Return-Path: <gabriel.fernandez@linaro.org>
MIME-Version: 1.0
In-Reply-To: <2165161.8vJctS1yVa@wuerfel>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
	<1418812486-12394-3-git-send-email-gabriel.fernandez@linaro.org>
	<2165161.8vJctS1yVa@wuerfel>
Date: Mon, 19 Jan 2015 13:36:19 +0100
Message-ID: <CAG374jDhgk-5d+mpduSJyJ4xHJ+R7jiwh6PnU=ZM4j8=UC986A@mail.gmail.com>
Subject: Re: [PATCH 2/5] PCI: st: Add Device Tree bindings for sti pcie
From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Content-Type: multipart/alternative; boundary=001a113c3800b292f4050d00910f
To: Arnd Bergmann <arnd@arndb.de>
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Grant Likely <grant.likely@linaro.org>, Fabrice Gasnier <fabrice.gasnier@st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <treding@nvidia.com>, Minghuan Lian <Minghuan.Lian@freescale.com>, Magnus Damm <damm@opensource.se>, Will Deacon <will.deacon@arm.com>, Tanmay Inamdar <tinamdar@apm.com>, Murali Karicheri <m-karicheri2@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Pratyush Anand <pratyush.anand@st.com>, Sachin Kamat <sachin.kamat@samsung.com>, Andrew Lunn <andrew@lunn.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, Srikanth Thokala <sthokal@xilinx.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>, linux-pci@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <devicetree@vger.kernel.org>

--001a113c3800b292f4050d00910f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

=E2=80=8BThanks for reviewing=E2=80=8B

On 17 December 2014 at 23:01, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wednesday 17 December 2014 11:34:43 Gabriel FERNANDEZ wrote:
> > sti pcie is built around a Synopsis Designware PCIe IP.
> >
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/pci/st-pcie.txt | 53
> +++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/st-pcie.txt
> >
> > diff --git a/Documentation/devicetree/bindings/pci/st-pcie.txt
> b/Documentation/devicetree/bindings/pci/st-pcie.txt
> > new file mode 100644
> > index 0000000..bd3488f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/st-pcie.txt
> > @@ -0,0 +1,53 @@
> > +STMicroelectronics STi PCIe controller
> > +
> > +This PCIe host controller is based on the Synopsis Designware PCIe IP
> > +and thus inherits all the common properties defined in
> designware-pcie.txt.
> > +
> > +Required properties:
> > + - compatible: "st,stih407-pcie"
> > + - reg: base address and length of the pcie controller, mem-window
> address
> > +   and length available to the controller.
> > + - interrupts: A list of interrupt outputs of the controller.
> > + - interrupt-names: Must include the following entries:
> > +   "msi": STi interrupt that is asserted when an MSI is received
>
> You should specify that only one interrupt may be present.
> If you extend the binding, you will need to describe what the
> second one is as well.
>

=E2=80=8Bok, i will change into:
=E2=80=8B
=E2=80=8B"=E2=80=8B
 - interrupts: A list of interrupt outputs of the controller. Must contain
an
  entry for each entry in the interrupt-names property.
=E2=80=8B"=E2=80=8B




> > + - st,syscfg : should be a phandle of the syscfg node. Also contains
> syscfg
> > +   offset for IP configuration.
> > + - resets, reset-names: the power-down and soft-reset lines of PCIe IP=
.
> > +   Associated names must be "powerdown" and "softreset".
> > + - phys, phy-names: the phandle for the PHY device.
> > +   Associated name must be "pcie_phy"
>
> Names should not have underscores in them in general. "pcie-phy" would
> be fine, but just "pcie" seems good enough, unless there are existing
> drivers that have established a specific naming.
>

=E2=80=8B

=E2=80=8Bjust "pcie" is fine for me


BR

Gabriel
=E2=80=8B

>
>
>         Arnd
>
>

--001a113c3800b292f4050d00910f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:courier =
new,monospace">Hi Arnd,<br></div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra"><div class=3D"gmail_default" style=3D"font-family:&#3=
9;courier new&#39;,monospace">=E2=80=8BThanks for reviewing=E2=80=8B</div><=
br><div class=3D"gmail_quote">On 17 December 2014 at 23:01, Arnd Bergmann <=
span dir=3D"ltr">&lt;<a href=3D"mailto:arnd@arndb.de" target=3D"_blank">arn=
d@arndb.de</a>&gt;</span> wrote:<blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div><div>On Wednesday 17 December 2014 11:34:43 Gabriel FERNANDEZ w=
rote:<br>
&gt; sti pcie is built around a Synopsis Designware PCIe IP.<br>
&gt;<br>
&gt; Signed-off-by: Fabrice Gasnier &lt;<a href=3D"mailto:fabrice.gasnier@s=
t.com" target=3D"_blank">fabrice.gasnier@st.com</a>&gt;<br>
&gt; Signed-off-by: Gabriel Fernandez &lt;<a href=3D"mailto:gabriel.fernand=
ez@linaro.org" target=3D"_blank">gabriel.fernandez@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/devicetree/bindings/pci/st-pcie.txt | 53 +++++++++=
++++++++++++++<br>
&gt;=C2=A0 1 file changed, 53 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/pci/st-pcie=
.txt<br>
&gt;<br>
&gt; diff --git a/Documentation/devicetree/bindings/pci/st-pcie.txt b/Docum=
entation/devicetree/bindings/pci/st-pcie.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..bd3488f<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/pci/st-pcie.txt<br>
&gt; @@ -0,0 +1,53 @@<br>
&gt; +STMicroelectronics STi PCIe controller<br>
&gt; +<br>
&gt; +This PCIe host controller is based on the Synopsis Designware PCIe IP=
<br>
&gt; +and thus inherits all the common properties defined in designware-pci=
e.txt.<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; + - compatible: &quot;st,stih407-pcie&quot;<br>
&gt; + - reg: base address and length of the pcie controller, mem-window ad=
dress<br>
&gt; +=C2=A0 =C2=A0and length available to the controller.<br>
&gt; + - interrupts: A list of interrupt outputs of the controller.<br>
&gt; + - interrupt-names: Must include the following entries:<br>
&gt; +=C2=A0 =C2=A0&quot;msi&quot;: STi interrupt that is asserted when an =
MSI is received<br>
<br>
</div></div>You should specify that only one interrupt may be present.<br>
If you extend the binding, you will need to describe what the<br>
second one is as well.<br></blockquote><div>=C2=A0</div><div><div class=3D"=
gmail_default" style=3D"display:inline"><span style=3D"font-family:arial,he=
lvetica,sans-serif">=E2=80=8Bok, i will change into:<br>=E2=80=8B</span></d=
iv><span style=3D"font-family:arial,helvetica,sans-serif"><div class=3D"gma=
il_default" style=3D"font-family:courier new,monospace;display:inline">=E2=
=80=8B&quot;=E2=80=8B</div>=C2=A0- interrupts: A list of interrupt outputs =
of the controller. Must contain an<br>=C2=A0 entry for each entry in the in=
terrupt-names property.</span><div class=3D"gmail_default" style=3D"font-fa=
mily:courier new,monospace;display:inline">=E2=80=8B&quot;=E2=80=8B</div><b=
r><br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span><br>
&gt; + - st,syscfg : should be a phandle of the syscfg node. Also contains =
syscfg<br>
&gt; +=C2=A0 =C2=A0offset for IP configuration.<br>
&gt; + - resets, reset-names: the power-down and soft-reset lines of PCIe I=
P.<br>
&gt; +=C2=A0 =C2=A0Associated names must be &quot;powerdown&quot; and &quot=
;softreset&quot;.<br>
&gt; + - phys, phy-names: the phandle for the PHY device.<br>
&gt; +=C2=A0 =C2=A0Associated name must be &quot;pcie_phy&quot;<br>
<br>
</span>Names should not have underscores in them in general. &quot;pcie-phy=
&quot; would<br>
be fine, but just &quot;pcie&quot; seems good enough, unless there are exis=
ting<br>
drivers that have established a specific naming.<br></blockquote><div><br><=
div class=3D"gmail_default" style=3D"display:inline"><span style=3D"font-fa=
mily:arial,helvetica,sans-serif">=E2=80=8B</span></div><span style=3D"font-=
family:arial,helvetica,sans-serif">=C2=A0</span><div class=3D"gmail_default=
" style=3D"font-family:courier new,monospace;display:inline"><span style=3D=
"font-family:arial,helvetica,sans-serif">=E2=80=8Bjust &quot;pcie&quot; is =
fine for me</span><br><br><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:courier new,monospace;display:inline">BR<br><br>Gabriel<br></div=
><div class=3D"gmail_default" style=3D"font-family:courier new,monospace;di=
splay:inline">=E2=80=8B</div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<span><font color=3D"#888888"><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br>
<br>
</font></span></blockquote></div></div></div>

--001a113c3800b292f4050d00910f--
