Return-Path: <SRS0=53OG=QL=mobiveil.co.in=l.subrahmanya@kernel.org>
MIME-Version: 1.0
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com> <20190129113910.GA7467@e107981-ln.cambridge.arm.com>
In-Reply-To: <20190129113910.GA7467@e107981-ln.cambridge.arm.com>
From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Date: Mon, 4 Feb 2019 19:44:25 +0530
Message-ID: <CAFZiPx002HED+YH2GysS7a7uoEDQuHGjxa_CQtwb9nSDH-XNuA@mail.gmail.com>
Subject: Re: [PATCHv3 00/27] PCI: refactor Mobiveil driver and add PCIe Gen4
 driver for NXP Layerscape SoCs
Content-Type: multipart/alternative; boundary="000000000000c203850581121cd1"
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000c203850581121cd1
Content-Type: text/plain; charset="UTF-8"

Bjorn,
My apologies, I was away for a while from this work.
I am starting to review now.

Thanks,
~subbu

On Tue, Jan 29, 2019 at 5:09 PM Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
wrote:

> On Tue, Jan 29, 2019 at 08:08:28AM +0000, Z.q. Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> > This patch set is aim to refactor the Mobiveil driver and add
> > PCIe support for NXP Layerscape series SoCs integrated Mobiveil's
> > PCIe Gen4 controller.
> >
> > Hou Zhiqiang (27):
> >   PCI: mobiveil: uniform the register accessors
> >   PCI: mobiveil: format the code without function change
> >   PCI: mobiveil: correct the returned error number
> >   PCI: mobiveil: remove flag MSI_FLAG_MULTI_PCI_MSI
> >   PCI: mobiveil: correct PCI base address in MEM/IO outbound windows
> >   PCI: mobiveil: replace the resource list iteration function
> >   PCI: mobiveil: use WIN_NUM_0 explicitly for CFG outbound window
> >   PCI: mobiveil: use the 1st inbound window for MEM inbound transactions
> >   PCI: mobiveil: correct inbound/outbound window setup routines
> >   PCI: mobiveil: fix the INTx process error
> >   PCI: mobiveil: only fix up the Class Code field
> >   PCI: mobiveil: move out the link up waiting from mobiveil_host_init
> >   PCI: mobiveil: move irq chained handler setup out of DT parse
> >   PCI: mobiveil: initialize Primary/Secondary/Subordinate bus number
> >   dt-bindings: pci: mobiveil: change gpio_slave and apb_csr to optional
> >   PCI: mobiveil: refactor Mobiveil PCIe Host Bridge IP driver
> >   PCI: mobiveil: fix the checking of valid device
> >   PCI: mobiveil: continue to initialize the host upon no PCIe link
> >   PCI: mobiveil: disabled IB and OB windows set by bootloader
> >   PCI: mobiveil: add Byte and Half-Word width register accessors
> >   PCI: mobiveil: make mobiveil_host_init can be used to re-init host
> >   dt-bindings: pci: Add NXP Layerscape SoCs PCIe Gen4 controller
> >   PCI: mobiveil: add PCIe Gen4 RC driver for NXP Layerscape SoCs
> >   PCI: mobiveil: ls_pcie_g4: add Workaround for A-011577
> >   PCI: mobiveil: ls_pcie_g4: add Workaround for A-011451
> >   arm64: dts: freescale: lx2160a: add pcie DT nodes
> >   arm64: defconfig: Enable CONFIG_PCI_LAYERSCAPE_GEN4
>
> Subrahmanya,
>
> Either you review this series or I will have to drop you from
> the MAINTAINERS list for this driver, I am sorry but I asked you
> before to no avail.
>
> Thanks,
> Lorenzo
>
> >  .../bindings/pci/layerscape-pci-gen4.txt      |  52 ++
> >  .../devicetree/bindings/pci/mobiveil-pcie.txt |   2 +
> >  MAINTAINERS                                   |  10 +-
> >  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 163 ++++
> >  arch/arm64/configs/defconfig                  |   1 +
> >  drivers/pci/controller/Kconfig                |  11 +-
> >  drivers/pci/controller/Makefile               |   2 +-
> >  drivers/pci/controller/mobiveil/Kconfig       |  34 +
> >  drivers/pci/controller/mobiveil/Makefile      |   5 +
> >  .../controller/mobiveil/pci-layerscape-gen4.c | 306 +++++++
> >  .../controller/mobiveil/pcie-mobiveil-host.c  | 640 +++++++++++++
> >  .../controller/mobiveil/pcie-mobiveil-plat.c  |  54 ++
> >  .../pci/controller/mobiveil/pcie-mobiveil.c   | 246 +++++
> >  .../pci/controller/mobiveil/pcie-mobiveil.h   | 229 +++++
> >  drivers/pci/controller/pcie-mobiveil.c        | 861 ------------------
> >  15 files changed, 1743 insertions(+), 873 deletions(-)
> >  create mode 100644
> Documentation/devicetree/bindings/pci/layerscape-pci-gen4.txt
> >  create mode 100644 drivers/pci/controller/mobiveil/Kconfig
> >  create mode 100644 drivers/pci/controller/mobiveil/Makefile
> >  create mode 100644 drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-plat.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil.h
> >  delete mode 100644 drivers/pci/controller/pcie-mobiveil.c
> >
> > --
> > 2.17.1
> >
>

--000000000000c203850581121cd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#073763">Bjorn,</div><div class=3D"gmail_default" style=3D=
"font-family:verdana,sans-serif;color:#073763">My apologies, I was away for=
 a while from this work.</div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif;color:#073763">I am starting to review now.</div><d=
iv class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0=
73763"><br></div><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#073763">Thanks,</div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif;color:#073763">~subbu</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 2=
9, 2019 at 5:09 PM Lorenzo Pieralisi &lt;<a href=3D"mailto:lorenzo.pieralis=
i@arm.com">lorenzo.pieralisi@arm.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Tue, Jan 29, 2019 at 08:08:28AM +000=
0, Z.q. Hou wrote:<br>
&gt; From: Hou Zhiqiang &lt;<a href=3D"mailto:Zhiqiang.Hou@nxp.com" target=
=3D"_blank">Zhiqiang.Hou@nxp.com</a>&gt;<br>
&gt; <br>
&gt; This patch set is aim to refactor the Mobiveil driver and add<br>
&gt; PCIe support for NXP Layerscape series SoCs integrated Mobiveil&#39;s<=
br>
&gt; PCIe Gen4 controller.<br>
&gt; <br>
&gt; Hou Zhiqiang (27):<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: uniform the register accessors<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: format the code without function change<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: correct the returned error number<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: remove flag MSI_FLAG_MULTI_PCI_MSI<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: correct PCI base address in MEM/IO outbound=
 windows<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: replace the resource list iteration functio=
n<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: use WIN_NUM_0 explicitly for CFG outbound w=
indow<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: use the 1st inbound window for MEM inbound =
transactions<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: correct inbound/outbound window setup routi=
nes<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: fix the INTx process error<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: only fix up the Class Code field<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: move out the link up waiting from mobiveil_=
host_init<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: move irq chained handler setup out of DT pa=
rse<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: initialize Primary/Secondary/Subordinate bu=
s number<br>
&gt;=C2=A0 =C2=A0dt-bindings: pci: mobiveil: change gpio_slave and apb_csr =
to optional<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: refactor Mobiveil PCIe Host Bridge IP drive=
r<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: fix the checking of valid device<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: continue to initialize the host upon no PCI=
e link<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: disabled IB and OB windows set by bootloade=
r<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: add Byte and Half-Word width register acces=
sors<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: make mobiveil_host_init can be used to re-i=
nit host<br>
&gt;=C2=A0 =C2=A0dt-bindings: pci: Add NXP Layerscape SoCs PCIe Gen4 contro=
ller<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: add PCIe Gen4 RC driver for NXP Layerscape =
SoCs<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: ls_pcie_g4: add Workaround for A-011577<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: ls_pcie_g4: add Workaround for A-011451<br>
&gt;=C2=A0 =C2=A0arm64: dts: freescale: lx2160a: add pcie DT nodes<br>
&gt;=C2=A0 =C2=A0arm64: defconfig: Enable CONFIG_PCI_LAYERSCAPE_GEN4<br>
<br>
Subrahmanya,<br>
<br>
Either you review this series or I will have to drop you from<br>
the MAINTAINERS list for this driver, I am sorry but I asked you<br>
before to no avail.<br>
<br>
Thanks,<br>
Lorenzo<br>
<br>
&gt;=C2=A0 .../bindings/pci/layerscape-pci-gen4.txt=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 52 ++<br>
&gt;=C2=A0 .../devicetree/bindings/pci/mobiveil-pcie.txt |=C2=A0 =C2=A02 +<=
br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
&gt;=C2=A0 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 163 ++++<br>
&gt;=C2=A0 arch/arm64/configs/defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/pci/controller/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-<br>
&gt;=C2=A0 drivers/pci/controller/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 drivers/pci/controller/mobiveil/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 34 +<br>
&gt;=C2=A0 drivers/pci/controller/mobiveil/Makefile=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 .../controller/mobiveil/pci-layerscape-gen4.c | 306 +++++++<br>
&gt;=C2=A0 .../controller/mobiveil/pcie-mobiveil-host.c=C2=A0 | 640 +++++++=
++++++<br>
&gt;=C2=A0 .../controller/mobiveil/pcie-mobiveil-plat.c=C2=A0 |=C2=A0 54 ++=
<br>
&gt;=C2=A0 .../pci/controller/mobiveil/pcie-mobiveil.c=C2=A0 =C2=A0| 246 ++=
+++<br>
&gt;=C2=A0 .../pci/controller/mobiveil/pcie-mobiveil.h=C2=A0 =C2=A0| 229 ++=
+++<br>
&gt;=C2=A0 drivers/pci/controller/pcie-mobiveil.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 861 ------------------<br>
&gt;=C2=A0 15 files changed, 1743 insertions(+), 873 deletions(-)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/pci/layersc=
ape-pci-gen4.txt<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/Kconfig<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pci-layerscap=
e-gen4.c<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil=
-host.c<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil=
-plat.c<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil=
.c<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil=
.h<br>
&gt;=C2=A0 delete mode 100644 drivers/pci/controller/pcie-mobiveil.c<br>
&gt; <br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
</blockquote></div>

--000000000000c203850581121cd1--
