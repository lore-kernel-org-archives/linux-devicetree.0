Return-Path: <SRS0=dRq7=SM=gmail.com=vichy.kuo@kernel.org>
MIME-Version: 1.0
References: <20190219074500.16454-1-vichy.kuo@gmail.com> <20190410135648.GA25739@bogus>
In-Reply-To: <20190410135648.GA25739@bogus>
From: pierre kuo <vichy.kuo@gmail.com>
Date: Thu, 11 Apr 2019 02:44:48 +0800
Message-ID: <CAOVJa8EuUaaENp9uY_xXQJo3cTjG_0b-KsnrQ5A2W1OQe9BDEQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] of: reserved_mem: fix reserve memory leak
Content-Type: multipart/alternative; boundary="00000000000085cb0e0586317795"
To: Rob Herring <robh@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--00000000000085cb0e0586317795
Content-Type: text/plain; charset="UTF-8"

Hi Rob:

On Tue, Feb 19, 2019 at 03:45:00PM +0800, pierre Kuo wrote:
> > The __reserved_mem_init_node will call region specific reserved memory
> > init codes, but once all compatibled init codes failed, the memory region
> > will left in memory.reserved and cause leakage.
> >
> > Take cma reserve memory DTS for example, if user declare 1MB size,
> > which is not align to (PAGE_SIZE << max(MAX_ORDER - 1,
> > pageblock_order)), rmem_cma_setup will return -EINVAL.
> > Meanwhile, rmem_dma_setup will also return -EINVAL since "reusable"
> > property is not set. If finally there is no reserved memory init pick up
> > this memory, kernel will left the 1MB leak in memory.reserved.
> >
> > This patch will remove this kind of memory from memory.reserved, only
> > when __reserved_mem_init_node return neither 0 nor -ENOENT.
> >
> > Signed-off-by: pierre Kuo <vichy.kuo@gmail.com>
> > ---
> >  drivers/of/of_reserved_mem.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
>
> As no one else seems to have any comments, I've applied it.
>

Thanks for your help.

>

--00000000000085cb0e0586317795
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Rob:</div><div dir=3D"auto"><br><div class=3D"gma=
il_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Feb 19, 2019 =
at 03:45:00PM +0800, pierre Kuo wrote:<br>
&gt; The __reserved_mem_init_node will call region specific reserved memory=
<br>
&gt; init codes, but once all compatibled init codes failed, the memory reg=
ion<br>
&gt; will left in memory.reserved and cause leakage.<br>
&gt; <br>
&gt; Take cma reserve memory DTS for example, if user declare 1MB size,<br>
&gt; which is not align to (PAGE_SIZE &lt;&lt; max(MAX_ORDER - 1,<br>
&gt; pageblock_order)), rmem_cma_setup will return -EINVAL.<br>
&gt; Meanwhile, rmem_dma_setup will also return -EINVAL since &quot;reusabl=
e&quot;<br>
&gt; property is not set. If finally there is no reserved memory init pick =
up<br>
&gt; this memory, kernel will left the 1MB leak in memory.reserved.<br>
&gt; <br>
&gt; This patch will remove this kind of memory from memory.reserved, only<=
br>
&gt; when __reserved_mem_init_node return neither 0 nor -ENOENT.<br>
&gt; <br>
&gt; Signed-off-by: pierre Kuo &lt;<a href=3D"mailto:vichy.kuo@gmail.com" r=
el=3D"noreferrer noreferrer" target=3D"_blank">vichy.kuo@gmail.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 drivers/of/of_reserved_mem.c | 22 +++++++++++++++++-----<br>
&gt;=C2=A0 1 file changed, 17 insertions(+), 5 deletions(-)<br>
<br>
As no one else seems to have any comments, I&#39;ve applied it.<br></blockq=
uote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote><=
/div></div><div dir=3D"auto">Thanks for your help.</div><div dir=3D"auto"><=
div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000085cb0e0586317795--
