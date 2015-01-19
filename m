Return-Path: <gabriel.fernandez@linaro.org>
MIME-Version: 1.0
In-Reply-To: <000e01d01a7f$47592e20$d60b8a60$%han@samsung.com>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
	<1418812486-12394-5-git-send-email-gabriel.fernandez@linaro.org>
	<1507589.aeTeyNn1QF@wuerfel>
	<000e01d01a7f$47592e20$d60b8a60$%han@samsung.com>
Date: Mon, 19 Jan 2015 13:38:53 +0100
Message-ID: <CAG374jBZCn+V2zjcAwdKEb0COzBT2VES5uiw0gc40mFvoraERA@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI: designware: Add setup bus-related to pcie_host_ops
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Content-Type: multipart/alternative; boundary=047d7b3a9a84e78005050d009a70
To: Jingoo Han <jg1.han@samsung.com>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Grant Likely <grant.likely@linaro.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>, Minghuan Lian <Minghuan.Lian@freescale.com>, Magnus Damm <damm@opensource.se>, Will Deacon <will.deacon@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Pratyush Anand <pratyush.anand@st.com>, Sachin Kamat <sachin.kamat@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, Srikanth Thokala <sthokal@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>, linux-pci@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--047d7b3a9a84e78005050d009a70
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Jingoo,

On 18 December 2014 at 05:58, Jingoo Han <jg1.han@samsung.com> wrote:

> On Thursday, December 18, 2014 7:16 AM, Arnd Bergmann wrote:
> > On Wednesday 17 December 2014 11:34:45 Gabriel FERNANDEZ wrote:
> > > ST sti SoCs PCIe IPs are built around DesignWare IP Core.
> > > But in these SoCs PCIe IP doesn't support IO.
>
> Hi Gabriel,
>
> I cannot understand how ST sti SoCs PCIe IP does not support I/O.
> As far as I know, it cannot be selected by the 'parameter'.
> Then, H/W engineers dropped out the I/O control logic?
>
> > >
> > > To support this, add setup_bus() to pcie_host_ops.
>
>
> > >
> > > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> >
> > The dw-pcie driver should be able to tell whether the device has
> > an I/O space or not, and do the right thing based on that. Don't
> > add an implementation specific callback for that.
>
> I agree with Arnd's opinion.
>
> In addition, I have one more question.
> Then, if a device that requires I/O region is connected to
> PCIe slot of ST sti SoCs PCIe, what will happen?
> It just prints error messages?
>
> Best regards,
> Jingoo Han
>
> >
> >       Arnd
>
>
Arnd i
n other post mention to add an empty I/O space to workaround lack of I/O
port access.
Is it the right thing to do ?
=E2=80=8B
http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November/299623.=
html


=E2=80=8BBest regards
=E2=80=8B=E2=80=8B

--047d7b3a9a84e78005050d009a70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:&#39;cou=
rier new&#39;,monospace">Hi Arnd, Jingoo,</div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 18 December 2014 at 05:58, Jingoo Han <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:jg1.han@samsung.com" target=3D"_blank">=
jg1.han@samsung.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span>On Thur=
sday, December 18, 2014 7:16 AM, Arnd Bergmann wrote:<br>
&gt; On Wednesday 17 December 2014 11:34:45 Gabriel FERNANDEZ wrote:<br>
&gt; &gt; ST sti SoCs PCIe IPs are built around DesignWare IP Core.<br>
&gt; &gt; But in these SoCs PCIe IP doesn&#39;t support IO.<br>
<br>
</span>Hi Gabriel,<br>
<br>
I cannot understand how ST sti SoCs PCIe IP does not support I/O.<br>
As far as I know, it cannot be selected by the &#39;parameter&#39;.<br>
Then, H/W engineers dropped out the I/O control logic?<br>
<span><br>
&gt; &gt;<br>
&gt; &gt; To support this, add setup_bus() to pcie_host_ops.<br>
<br>
<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Fabrice Gasnier &lt;<a href=3D"mailto:fabrice.gasn=
ier@st.com" target=3D"_blank">fabrice.gasnier@st.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Gabriel Fernandez &lt;<a href=3D"mailto:gabriel.fe=
rnandez@linaro.org" target=3D"_blank">gabriel.fernandez@linaro.org</a>&gt;<=
br>
&gt;<br>
&gt; The dw-pcie driver should be able to tell whether the device has<br>
&gt; an I/O space or not, and do the right thing based on that. Don&#39;t<b=
r>
&gt; add an implementation specific callback for that.<br>
<br>
</span>I agree with Arnd&#39;s opinion.<br>
<br>
In addition, I have one more question.<br>
Then, if a device that requires I/O region is connected to<br>
PCIe slot of ST sti SoCs PCIe, what will happen?<br>
It just prints error messages?<br>
<br>
Best regards,<br>
Jingoo Han<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Arnd<br>
<br></blockquote><div><div class=3D"gmail_default" style=3D"font-family:&#3=
9;courier new&#39;,monospace;display:inline"><br></div></div><div><div clas=
s=3D"gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace;di=
splay:inline">Arnd i</div><span style=3D"font-family:&#39;courier new&#39;,=
monospace">n other post mention to add an empty I/O space to workaround lac=
k of I/O port access.</span></div><div class=3D"gmail_extra"><div class=3D"=
gmail_default" style=3D"font-family:&#39;courier new&#39;,monospace">Is it =
the right thing to do ?=C2=A0</div><div class=3D"gmail_default" style=3D"fo=
nt-family:&#39;courier new&#39;,monospace">=E2=80=8B<span style=3D"font-fam=
ily:arial,sans-serif"><a href=3D"http://lists.infradead.org/pipermail/linux=
-arm-kernel/2014-November/299623.html" target=3D"_blank">http://lists.infra=
dead.org/pipermail/linux-arm-kernel/2014-November/299623.html</a></span></d=
iv></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra"><div class=3D"gmail_default" style=3D"fo=
nt-family:&#39;courier new&#39;,monospace">=E2=80=8BBest regards</div></div=
><div><div class=3D"gmail_default" style=3D"font-family:&#39;courier new&#3=
9;,monospace;display:inline">=E2=80=8B=E2=80=8B</div>=C2=A0</div></div><br>=
</div></div>

--047d7b3a9a84e78005050d009a70--
