Return-Path: <rajatja@google.com>
MIME-Version: 1.0
In-Reply-To: <20161026204648.GD3989@dtor-ws>
References: <1477070156-109965-1-git-send-email-rajatja@google.com>
 <1477084869-15612-1-git-send-email-rajatja@google.com> <20161026201735.GA10192@localhost>
 <20161026204648.GD3989@dtor-ws>
From: Rajat Jain <rajatja@google.com>
Date: Wed, 26 Oct 2016 13:51:48 -0700
Message-ID: <CACK8Z6H1ACBo7nDxaXR3Vn9cPdyRqxxzdgYz7vNmojiSvjbW5A@mail.gmail.com>
Subject: Re: [PATCH v6] mwifiex: parse device tree node for PCIe
Content-Type: multipart/alternative; boundary=94eb2c0889fea2ff9a053fcacd1c
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, Xinming Hu <huxm@marvell.com>, Amitkumar Karwar <akarwar@marvell.com>, Brian Norris <briannorris@google.com>, Kalle Valo <kvalo@codeaurora.org>, Rob Herring <robh@kernel.org>, Rajat Jain <rajatxjain@gmail.com>
List-ID: <devicetree@vger.kernel.org>

--94eb2c0889fea2ff9a053fcacd1c
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 26, 2016 at 1:46 PM, Dmitry Torokhov <dmitry.torokhov@gmail.com>
wrote:

> On Wed, Oct 26, 2016 at 01:17:36PM -0700, Brian Norris wrote:
> > Hi Rajat,
> >
> > On Fri, Oct 21, 2016 at 02:21:09PM -0700, Rajat Jain wrote:
> > > From: Xinming Hu <huxm@marvell.com>
> > >
> > > This patch derives device tree node from pcie bus layer framework, and
> > > fixes a minor memory leak in mwifiex_pcie_probe() (in failure path).
> > > Device tree bindings file has been renamed(marvell-sd8xxx.txt ->
> > > marvell-8xxx.txt) to accommodate PCIe changes.
> > >
> > > Signed-off-by: Xinming Hu <huxm@marvell.com>
> > > Signed-off-by: Amitkumar Karwar <akarwar@marvell.com>
> > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > Reviewed-by: Brian Norris <briannorris@chromium.org>
> > > ---
> > > v2: Included vendor and product IDs in compatible strings for PCIe
> > > chipsets(Rob Herring)
> > > v3: Patch is created using -M option so that it will only include diff
> of
> > > original and renamed files(Rob Herring)
> > > Resend v3: Resending the patch because I missed to include device tree
> mailing
> > > while sending v3.
> > > v4: Fix error handling, also move-on even if no device tree node is
> present.
> > > v5: Update commit log to include memory leak, return -EINVAL instead
> of -1.
> >
> > I've been working on reworking some bugfixes for this driver, and I
> > noticed we have some problems w.r.t. memory leaks, and the "memory leak"
> > fix is not actually a fix. See below.
>
> Sorry, I just saw this... Why do we need devicetree data for
> discoverable bus (PCI)? How does the driver work on systems that do not
> use DT? Why do we need them to behave differently?
>

There are a couple of out-of-band GPIO pins from Marvell chip that can
serve as wake-up pins (wake up the CPU when asserted). The Marvell chip has
to be told which GPIO pin is to be used as the wake-up pin. The pin to be
used is system / platform dependent. (On some systems it could be GPIO13,
on others it could be GPIO14 etc depending on how the marvell chip is wired
up to the CPU).



>
> Thanks.
>
> --
> Dmitry
>

--94eb2c0889fea2ff9a053fcacd1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Oct 26, 2016 at 1:46 PM, Dmitry Torokhov <span dir=3D"ltr">&lt;=
<a href=3D"mailto:dmitry.torokhov@gmail.com" target=3D"_blank">dmitry.torok=
hov@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
 class=3D"">On Wed, Oct 26, 2016 at 01:17:36PM -0700, Brian Norris wrote:<b=
r>
&gt; Hi Rajat,<br>
&gt;<br>
&gt; On Fri, Oct 21, 2016 at 02:21:09PM -0700, Rajat Jain wrote:<br>
&gt; &gt; From: Xinming Hu &lt;<a href=3D"mailto:huxm@marvell.com">huxm@mar=
vell.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This patch derives device tree node from pcie bus layer framework=
, and<br>
&gt; &gt; fixes a minor memory leak in mwifiex_pcie_probe() (in failure pat=
h).<br>
&gt; &gt; Device tree bindings file has been renamed(marvell-sd8xxx.txt -&g=
t;<br>
&gt; &gt; marvell-8xxx.txt) to accommodate PCIe changes.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Xinming Hu &lt;<a href=3D"mailto:huxm@marvell.com"=
>huxm@marvell.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Amitkumar Karwar &lt;<a href=3D"mailto:akarwar@mar=
vell.com">akarwar@marvell.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Rajat Jain &lt;<a href=3D"mailto:rajatja@google.co=
m">rajatja@google.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Brian Norris &lt;<a href=3D"mailto:briannorris@chrom=
ium.org">briannorris@chromium.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v2: Included vendor and product IDs in compatible strings for PCI=
e<br>
&gt; &gt; chipsets(Rob Herring)<br>
&gt; &gt; v3: Patch is created using -M option so that it will only include=
 diff of<br>
&gt; &gt; original and renamed files(Rob Herring)<br>
&gt; &gt; Resend v3: Resending the patch because I missed to include device=
 tree mailing<br>
&gt; &gt; while sending v3.<br>
&gt; &gt; v4: Fix error handling, also move-on even if no device tree node =
is present.<br>
&gt; &gt; v5: Update commit log to include memory leak, return -EINVAL inst=
ead of -1.<br>
&gt;<br>
&gt; I&#39;ve been working on reworking some bugfixes for this driver, and =
I<br>
&gt; noticed we have some problems w.r.t. memory leaks, and the &quot;memor=
y leak&quot;<br>
&gt; fix is not actually a fix. See below.<br>
<br>
</span>Sorry, I just saw this... Why do we need devicetree data for<br>
discoverable bus (PCI)? How does the driver work on systems that do not<br>
use DT? Why do we need them to behave differently?<br></blockquote><div><br=
></div><div>There are a couple of out-of-band GPIO pins from Marvell chip t=
hat can serve as wake-up pins (wake up the CPU when asserted). The Marvell =
chip has to be told which GPIO pin is to be used as the wake-up pin. The pi=
n to be used is system / platform dependent. (On some systems it could be G=
PIO13, on others it could be GPIO14 etc depending on how the marvell chip i=
s wired up to the CPU).</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Dmitry<br>
</font></span></blockquote></div><br></div></div>

--94eb2c0889fea2ff9a053fcacd1c--
