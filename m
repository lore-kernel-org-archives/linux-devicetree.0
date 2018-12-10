Return-Path: <SRS0=Ijj/=OT=mobiveil.co.in=l.subrahmanya@kernel.org>
MIME-Version: 1.0
References: <20181106131807.29951-1-Zhiqiang.Hou@nxp.com> <20181203115850.GB8040@e107981-ln.cambridge.arm.com>
In-Reply-To: <20181203115850.GB8040@e107981-ln.cambridge.arm.com>
From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Date: Mon, 10 Dec 2018 07:13:43 -0300
Message-ID: <CAFZiPx2tjhwkgOccPLGXrcR6=Qh2EAai7aiPiH5vEZw46-Hjnw@mail.gmail.com>
Subject: Re: [PATCH 00/23] PCI: refactor the Mobiveil driver and add PCIe
 support for NXP LX SoCs
Content-Type: multipart/alternative; boundary="0000000000002dae9d057ca381b6"
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, Leo Li <leoyang.li@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, xiaowei.bao@nxp.com
List-ID: <devicetree@vger.kernel.org>

--0000000000002dae9d057ca381b6
Content-Type: text/plain; charset="UTF-8"

Lorenzo,
You are right, I reviewed few DT files, will need some time to review this
train.
I will start doing it in a while.

Thanks for pitching in.

Thanks.

On Mon, Dec 3, 2018 at 8:58 AM Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
wrote:

> On Tue, Nov 06, 2018 at 01:19:03PM +0000, Z.q. Hou wrote:
> > From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> >
> > This patch set is aim to refactor the Mobiveil driver and add
> > PCIe support for NXP LX series SoCs.
> >
> > Hou Zhiqiang (23):
> >   PCI: mobiveil: uniform the register accessors
> >   PCI: mobiveil: format the code without function change
> >   PCI: mobiveil: correct the returned error number
> >   PCI: mobiveil: remove flag MSI_FLAG_MULTI_PCI_MSI
> >   PCI: mobiveil: correct PCI base address in MEM/IO outbound windows
> >   PCI: mobiveil: replace the resource list iteration function
> >   PCI: mobiveil: use WIN_NUM_0 explicitly for CFG outbound window
> >   PCI: mobiveil: use the 1st inbound window for MEM inbound transactions
> >   PCI: mobiveil: correct the inbound/outbound window setup routine
> >   PCI: mobiveil: fix the INTx process error
> >   PCI: mobiveil: only fixup the Class Code field
> >   PCI: mobiveil: move out the link up waiting from mobiveil_host_init
> >   PCI: mobiveil: move irq chained handler setup out of DT parse
> >   PCI: mobiveil: initialize Primary/Secondary/Subordinate bus number
> >   dt-bindings: pci: mobiveil: change gpio_slave and apb_csr to optional
> >   PCI: mobiveil: refactor the Mobiveil driver
> >   PCI: mobiveil: continue to initialize the host upon no PCIe link
> >   PCI: mobiveil: disabled IB and OB windows set by bootloader
> >   PCI: mobiveil: add Byte and Half-Word width register accessors
> >   PCI: mobiveil: change prototype of function mobiveil_host_init
> >   dt-bindings: pci: Add NXP LX SoCs PCIe controller
> >   PCI: mobiveil: add PCIe RC driver for NXP LX series SoCs
> >   arm64: dts: freescale: lx2160a: add pcie DT nodes
> >
> >  .../devicetree/bindings/pci/lx-pci.txt        |  52 ++
> >  .../devicetree/bindings/pci/mobiveil-pcie.txt |   2 +
> >  MAINTAINERS                                   |  10 +-
> >  .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 157 ++++
> >  drivers/pci/controller/Kconfig                |  11 +-
> >  drivers/pci/controller/Makefile               |   2 +-
> >  drivers/pci/controller/mobiveil/Kconfig       |  34 +
> >  drivers/pci/controller/mobiveil/Makefile      |   5 +
> >  drivers/pci/controller/mobiveil/pci-lx.c      | 222 +++++
> >  .../controller/mobiveil/pcie-mobiveil-host.c  | 622 +++++++++++++
> >  .../controller/mobiveil/pcie-mobiveil-plat.c  |  54 ++
> >  .../pci/controller/mobiveil/pcie-mobiveil.c   | 245 +++++
> >  .../pci/controller/mobiveil/pcie-mobiveil.h   | 221 +++++
> >  drivers/pci/controller/pcie-mobiveil.c        | 861 ------------------
> >  14 files changed, 1625 insertions(+), 873 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/pci/lx-pci.txt
> >  create mode 100644 drivers/pci/controller/mobiveil/Kconfig
> >  create mode 100644 drivers/pci/controller/mobiveil/Makefile
> >  create mode 100644 drivers/pci/controller/mobiveil/pci-lx.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil-plat.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil.c
> >  create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil.h
> >  delete mode 100644 drivers/pci/controller/pcie-mobiveil.c
>
> Subrahmanya,
>
> for the records, this is the driver *you* are maintaining, aren't you ?
>
> We ask developers to be added to the MAINTAINERS list in order to hold
> them accountable, merging a driver upstream means that you need to
> actively maintain it, which in turn means reviewing series affecting
> its code, like this one.
>
> I will have a look too but it is your responsibility to review these
> patches and ACK them accordingly.
>
> So I strongly suggest you start doing it please.
>
> Thanks,
> Lorenzo
>

--0000000000002dae9d057ca381b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:rgb(7,55,99)">Lorenzo,<br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,99)">You are righ=
t, I reviewed few DT files, will need some time to review this train.<br></=
div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;co=
lor:rgb(7,55,99)">I will start doing it in a while.<br><br></div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:rgb(7,55,9=
9)">Thanks for pitching in.<br><br></div><div class=3D"gmail_default" style=
=3D"font-family:verdana,sans-serif;color:rgb(7,55,99)">Thanks.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Dec 3, 2018 at 8:58 =
AM Lorenzo Pieralisi &lt;<a href=3D"mailto:lorenzo.pieralisi@arm.com">loren=
zo.pieralisi@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Tue, Nov 06, 2018 at 01:19:03PM +0000, Z.q. Hou wrot=
e:<br>
&gt; From: Hou Zhiqiang &lt;<a href=3D"mailto:Zhiqiang.Hou@nxp.com" target=
=3D"_blank">Zhiqiang.Hou@nxp.com</a>&gt;<br>
&gt; <br>
&gt; This patch set is aim to refactor the Mobiveil driver and add<br>
&gt; PCIe support for NXP LX series SoCs.<br>
&gt; <br>
&gt; Hou Zhiqiang (23):<br>
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
&gt;=C2=A0 =C2=A0PCI: mobiveil: correct the inbound/outbound window setup r=
outine<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: fix the INTx process error<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: only fixup the Class Code field<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: move out the link up waiting from mobiveil_=
host_init<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: move irq chained handler setup out of DT pa=
rse<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: initialize Primary/Secondary/Subordinate bu=
s number<br>
&gt;=C2=A0 =C2=A0dt-bindings: pci: mobiveil: change gpio_slave and apb_csr =
to optional<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: refactor the Mobiveil driver<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: continue to initialize the host upon no PCI=
e link<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: disabled IB and OB windows set by bootloade=
r<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: add Byte and Half-Word width register acces=
sors<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: change prototype of function mobiveil_host_=
init<br>
&gt;=C2=A0 =C2=A0dt-bindings: pci: Add NXP LX SoCs PCIe controller<br>
&gt;=C2=A0 =C2=A0PCI: mobiveil: add PCIe RC driver for NXP LX series SoCs<b=
r>
&gt;=C2=A0 =C2=A0arm64: dts: freescale: lx2160a: add pcie DT nodes<br>
&gt; <br>
&gt;=C2=A0 .../devicetree/bindings/pci/lx-pci.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 52 ++<br>
&gt;=C2=A0 .../devicetree/bindings/pci/mobiveil-pcie.txt |=C2=A0 =C2=A02 +<=
br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
&gt;=C2=A0 .../arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 157 ++++<br>
&gt;=C2=A0 drivers/pci/controller/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-<br>
&gt;=C2=A0 drivers/pci/controller/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 drivers/pci/controller/mobiveil/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 34 +<br>
&gt;=C2=A0 drivers/pci/controller/mobiveil/Makefile=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 drivers/pci/controller/mobiveil/pci-lx.c=C2=A0 =C2=A0 =C2=A0 | 2=
22 +++++<br>
&gt;=C2=A0 .../controller/mobiveil/pcie-mobiveil-host.c=C2=A0 | 622 +++++++=
++++++<br>
&gt;=C2=A0 .../controller/mobiveil/pcie-mobiveil-plat.c=C2=A0 |=C2=A0 54 ++=
<br>
&gt;=C2=A0 .../pci/controller/mobiveil/pcie-mobiveil.c=C2=A0 =C2=A0| 245 ++=
+++<br>
&gt;=C2=A0 .../pci/controller/mobiveil/pcie-mobiveil.h=C2=A0 =C2=A0| 221 ++=
+++<br>
&gt;=C2=A0 drivers/pci/controller/pcie-mobiveil.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 861 ------------------<br>
&gt;=C2=A0 14 files changed, 1625 insertions(+), 873 deletions(-)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/pci/lx-pci.=
txt<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/Kconfig<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/Makefile<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pci-lx.c<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil=
-host.c<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil=
-plat.c<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil=
.c<br>
&gt;=C2=A0 create mode 100644 drivers/pci/controller/mobiveil/pcie-mobiveil=
.h<br>
&gt;=C2=A0 delete mode 100644 drivers/pci/controller/pcie-mobiveil.c<br>
<br>
Subrahmanya,<br>
<br>
for the records, this is the driver *you* are maintaining, aren&#39;t you ?=
<br>
<br>
We ask developers to be added to the MAINTAINERS list in order to hold<br>
them accountable, merging a driver upstream means that you need to<br>
actively maintain it, which in turn means reviewing series affecting<br>
its code, like this one.<br>
<br>
I will have a look too but it is your responsibility to review these<br>
patches and ACK them accordingly.<br>
<br>
So I strongly suggest you start doing it please.<br>
<br>
Thanks,<br>
Lorenzo<br>
</blockquote></div>

--0000000000002dae9d057ca381b6--
