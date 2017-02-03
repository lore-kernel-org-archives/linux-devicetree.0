Return-Path: <SRS0=l9ym=ZQ=broadcom.com=anup.patel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gBFu7skx_8cvsaL0sL5=44DMcWY_EjWSCfaNd8oh=Svw@mail.gmail.com>
References: <1486010836-25228-1-git-send-email-anup.patel@broadcom.com>
 <1486010836-25228-4-git-send-email-anup.patel@broadcom.com> <CAPcyv4gBFu7skx_8cvsaL0sL5=44DMcWY_EjWSCfaNd8oh=Svw@mail.gmail.com>
From: Anup Patel <anup.patel@broadcom.com>
Date: Fri, 3 Feb 2017 16:29:15 +0530
Message-ID: <CAALAos8HEjPhdM0cibTVB==WsanktBx87e8b8diVsNm1EmCQHQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] async_tx: Handle DMA devices having support for fewer
 PQ coefficients
Content-Type: multipart/alternative; boundary=001a114e665e37298005479e2c05
To: Dan Williams <dan.j.williams@intel.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Jassi Brar <jassisinghbrar@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Rob Rice <rob.rice@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Device Tree <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-crypto@vger.kernel.org, linux-raid <linux-raid@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a114e665e37298005479e2c05
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 2, 2017 at 11:31 AM, Dan Williams <dan.j.williams@intel.com>
wrote:

> On Wed, Feb 1, 2017 at 8:47 PM, Anup Patel <anup.patel@broadcom.com>
> wrote:
> > The DMAENGINE framework assumes that if PQ offload is supported by a
> > DMA device then all 256 PQ coefficients are supported. This assumption
> > does not hold anymore because we now have BCM-SBA-RAID offload engine
> > which supports PQ offload with limited number of PQ coefficients.
> >
> > This patch extends async_tx APIs to handle DMA devices with support
> > for fewer PQ coefficients.
> >
> > Signed-off-by: Anup Patel <anup.patel@broadcom.com>
> > Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> > ---
> >  crypto/async_tx/async_pq.c          |  3 +++
> >  crypto/async_tx/async_raid6_recov.c | 12 ++++++++++--
> >  include/linux/dmaengine.h           | 19 +++++++++++++++++++
> >  include/linux/raid/pq.h             |  3 +++
> >  4 files changed, 35 insertions(+), 2 deletions(-)
>
> So, I hate the way async_tx does these checks on each operation, and
> it's ok for me to say that because it's my fault. Really it's md that
> should be validating engine offload capabilities once at the beginning
> of time. I'd rather we move in that direction than continue to pile
> onto a bad design.
>

Yes, indeed. All async_tx APIs have lot of checks and for high throughput
RAID offload engine these checks can add some overhead.

I think doing checks in Linux md would be certainly better but this would
mean lot of changes in Linux md as well as remove checks in async_tx.

Also, async_tx APIs should not find DMA channel on its own instead it
should rely on Linux md to provide DMA channel pointer as parameter.

It's better to do checks cleanup in async_tx as separate patchset and
keep this patchset simple.

Regards,
Anup

--001a114e665e37298005479e2c05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Feb 2, 2017 at 11:31 AM, Dan Williams <span dir=3D"ltr">&lt;<a =
href=3D"mailto:dan.j.williams@intel.com" target=3D"_blank">dan.j.williams@i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Wed, Feb 1, 2017 at 8:47 PM, Anup Patel &lt;<a href=3D"mailto:a=
nup.patel@broadcom.com">anup.patel@broadcom.com</a>&gt; wrote:<br>
&gt; The DMAENGINE framework assumes that if PQ offload is supported by a<b=
r>
&gt; DMA device then all 256 PQ coefficients are supported. This assumption=
<br>
&gt; does not hold anymore because we now have BCM-SBA-RAID offload engine<=
br>
&gt; which supports PQ offload with limited number of PQ coefficients.<br>
&gt;<br>
&gt; This patch extends async_tx APIs to handle DMA devices with support<br=
>
&gt; for fewer PQ coefficients.<br>
&gt;<br>
&gt; Signed-off-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@broadcom.co=
m">anup.patel@broadcom.com</a>&gt;<br>
&gt; Reviewed-by: Scott Branden &lt;<a href=3D"mailto:scott.branden@broadco=
m.com">scott.branden@broadcom.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 crypto/async_tx/async_pq.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3 +++<br>
&gt;=C2=A0 crypto/async_tx/async_raid6_<wbr>recov.c | 12 ++++++++++--<br>
&gt;=C2=A0 include/linux/dmaengine.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 19 +++++++++++++++++++<br>
&gt;=C2=A0 include/linux/raid/pq.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 4 files changed, 35 insertions(+), 2 deletions(-)<br>
<br>
</span>So, I hate the way async_tx does these checks on each operation, and=
<br>
it&#39;s ok for me to say that because it&#39;s my fault. Really it&#39;s m=
d that<br>
should be validating engine offload capabilities once at the beginning<br>
of time. I&#39;d rather we move in that direction than continue to pile<br>
onto a bad design.<br>
</blockquote></div><br></div><div class=3D"gmail_extra">Yes, indeed. All as=
ync_tx APIs have lot of checks and for high throughput</div><div class=3D"g=
mail_extra">RAID offload engine these checks can add some overhead.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I think doing=
 checks in Linux md would be certainly better but this would</div><div clas=
s=3D"gmail_extra">mean lot of changes in Linux md as well as remove checks =
in async_tx.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Also, async_tx APIs should not find DMA channel on its own instead i=
t</div><div class=3D"gmail_extra">should rely on Linux md to provide DMA ch=
annel pointer as parameter.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">It&#39;s better to do checks cleanup in async_tx as s=
eparate patchset and</div><div class=3D"gmail_extra">keep this patchset sim=
ple.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
egards,</div><div class=3D"gmail_extra">Anup</div></div>

--001a114e665e37298005479e2c05--
