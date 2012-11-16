From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH v5 1/4] genalloc: add a global pool list, allow to find
 pools by phys address
Date: Thu, 15 Nov 2012 20:50:45 -0500
Message-ID: <CAP=VYLpNfXY6qQQQ9QteArs6pm5TXWuQysw_6W6KyCz+OJuz8A@mail.gmail.com>
References: <1350570453-24546-1-git-send-email-p.zabel@pengutronix.de>
 <1350570453-24546-2-git-send-email-p.zabel@pengutronix.de>
 <CAP=VYLq9E_bacNQpczQVbOZzYq4eznMPdmMaVMu3oV9Z3q_9pw@mail.gmail.com>
 <1352985943.2399.198.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0645683520714563759=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1352985943.2399.198.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Matt Porter <mporter-l0cyMroinI0@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0645683520714563759==
Content-Type: multipart/alternative; boundary=f46d042f9252caf36e04ce930005

--f46d042f9252caf36e04ce930005
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 15, 2012 at 8:25 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>wrote:

> Hi Paul,
>
> Am Freitag, den 26.10.2012, 15:46 -0400 schrieb Paul Gortmaker:
> > On Thu, Oct 18, 2012 at 10:27 AM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> wrote:
> > > This patch keeps all created pools in a global list and adds two
> > > functions that allow to retrieve the gen_pool pointer from a known
> > > physical address and from a device tree node.
> >
> > So, I'm not seeing any added users of the of_get_named_gen_pool,
> > or the other exported "reverse-lookup" function.  Without that, the
> > anticipated use case is not clear to me.
>
> My use case is the coda video codec driver, for a video codec IP core
> that is integrated in various SoCs. It can use on-SoC SRAM as temporary

memory.
>

Thanks Philipp,

So perhaps it makes sense to somehow tie this patch to the user
patch, since from what I recall reading in the past, the infrastructure
additions that are immediately used are far more favourably rec'd
than those that are weakly bound to a hand-wavey possibly vapour
ware like use case that may or may not materialize going forward.

Paul.
--



>
> Other possible use cases are the TI Davinci sound driver.
> Or the PXA frame buffer driver could allocate a frame buffer in SRAM for
> low-resolution devices.
>
> > Is there an example of some pending driver or similar, that has
> > a phys addr from an unknown source and needs to know what
> > pool it may or may not be in?  With the use case, someone might
> > be able to suggest alternative ways to get what you want done.
>
> drivers/media/platform/coda.c right now uses imx specific
> iram_alloc/free wrappers around gen_pool_alloc/free.
> I'd like to use of_get_named_gen_pool to obtain the struct gen_pool
> pointer and use gen_pool_alloc/free directly, instead.
>
> sound/soc/davinci/davinci-pcm.c right now uses davinci specific
> sram_alloc/free wrappers around gen_pool_alloc/free.
>
> drivers/dma/mmp_tdma.c and sound/soc/pxa/mmp-pcm.c already use
> gen_pool_alloc/free directly, but they use a arch-mmp specific
> sram_get_gpool function to obtain the struct gen_pool pointer.
>
> > It might also be worth cross compiling this for powerpc, since the
> > header files you implicitly get included varies from one arch to
> > the next, and there might be some compile fails lurking there.
>
> Thanks, I'll do that.
>
> regards
> Philipp
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>

--f46d042f9252caf36e04ce930005
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2012 at 8:25 AM, Philipp Zabel <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" target=3D"_blank">p.zabel@pengutronix.d=
e</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

Hi Paul,<br>
<br>
Am Freitag, den 26.10.2012, 15:46 -0400 schrieb Paul Gortmaker:<br>
<div class=3D"im">&gt; On Thu, Oct 18, 2012 at 10:27 AM, Philipp Zabel &lt;=
<a href=3D"mailto:p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org">p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org</a>&gt; wr=
ote:<br>
&gt; &gt; This patch keeps all created pools in a global list and adds two<=
br>
&gt; &gt; functions that allow to retrieve the gen_pool pointer from a know=
n<br>
&gt; &gt; physical address and from a device tree node.<br>
&gt;<br>
&gt; So, I&#39;m not seeing any added users of the of_get_named_gen_pool,<b=
r>
&gt; or the other exported &quot;reverse-lookup&quot; function. =A0Without =
that, the<br>
&gt; anticipated use case is not clear to me.<br>
<br>
</div>My use case is the coda video codec driver, for a video codec IP core=
<br>
that is integrated in various SoCs. It can use on-SoC SRAM as temporary=A0<=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">memory.<br></blockquote><div><br=
>

Thanks Philipp,<br></div><div><br>So perhaps it makes sense to somehow tie =
this patch to the user<br>patch, since from what I recall reading in the pa=
st, the infrastructure<br>additions that are immediately used are far more =
favourably rec&#39;d<br>

than those that are weakly bound to a hand-wavey possibly vapour<br>ware li=
ke use case that may or may not materialize going forward.<br><br>Paul.<br>=
--<br><br>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">


<br>
Other possible use cases are the TI Davinci sound driver.<br>
Or the PXA frame buffer driver could allocate a frame buffer in SRAM for<br=
>
low-resolution devices.<br>
<div class=3D"im"><br>
&gt; Is there an example of some pending driver or similar, that has<br>
&gt; a phys addr from an unknown source and needs to know what<br>
&gt; pool it may or may not be in? =A0With the use case, someone might<br>
&gt; be able to suggest alternative ways to get what you want done.<br>
<br>
</div>drivers/media/platform/coda.c right now uses imx specific<br>
iram_alloc/free wrappers around gen_pool_alloc/free.<br>
I&#39;d like to use of_get_named_gen_pool to obtain the struct gen_pool<br>
pointer and use gen_pool_alloc/free directly, instead.<br>
<br>
sound/soc/davinci/davinci-pcm.c right now uses davinci specific<br>
sram_alloc/free wrappers around gen_pool_alloc/free.<br>
<br>
drivers/dma/mmp_tdma.c and sound/soc/pxa/mmp-pcm.c already use<br>
gen_pool_alloc/free directly, but they use a arch-mmp specific<br>
sram_get_gpool function to obtain the struct gen_pool pointer.<br>
<div class=3D"im"><br>
&gt; It might also be worth cross compiling this for powerpc, since the<br>
&gt; header files you implicitly get included varies from one arch to<br>
&gt; the next, and there might be some compile fails lurking there.<br>
<br>
</div>Thanks, I&#39;ll do that.<br>
<br>
regards<br>
<span class=3D"HOEnZb"><font color=3D"#888888">Philipp<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-kernel=
&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">major=
domo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
Please read the FAQ at =A0<a href=3D"http://www.tux.org/lkml/" target=3D"_b=
lank">http://www.tux.org/lkml/</a><br>
</div></div></blockquote></div><br>

--f46d042f9252caf36e04ce930005--

--===============0645683520714563759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0645683520714563759==--
