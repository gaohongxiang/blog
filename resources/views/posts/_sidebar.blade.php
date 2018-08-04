<div class="card border-info mb-3">
    <div class="card-header bg-transparent border-info">
        <h5 class="text-muted text-center">归档</h5>
    </div>
    @if(count($archives))
        <ul class="list-group list-group-flush">
            @foreach($archives as $archive)
                <li class="list-group-item @if(request()->has('year') && request()->year == $archive->year) bg-light @endif">
                    <a href="{{ route('posts.index') }}?year={{ $archive->year }}@if(request()->has('order'))&order={{ request()->order }}@endif" 
                        class="text-center text-info font-weight-bold">
                        <center>{{ $archive->year }} ( {{ $archive->total }} )</center>
                    </a>
                </li>
            @endforeach
        </ul>
    @endif
</div>

 <div class="card mb-3 border-info">
      <div class="card-header bg-transparent border-info">
          <h5 class="text-muted text-center">友情链接</h5>
      </div>
       <div class="card-body" style="margin-left:20px;">
          <a href="https://www.jianshu.com/u/1f5ac0cf6a8b" target="_bank">高鸿祥-简书</a>
          
          <a href="https://broqiang.com" target="_bank" style="margin-left:50px;">Bro Qiang</a>
      </div>  
</div>

