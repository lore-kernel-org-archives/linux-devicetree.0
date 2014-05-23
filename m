From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 02/47] mtd: nand: stm_nand_bch: provide Device Tree
 documentation
Date: Fri, 23 May 2014 11:21:51 +0100
Message-ID: <20140523102151.GT19747@lee--X1>
References: <20980858CB6D3A4BAE95CA194937D5E73EAD826F@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAD826F@DBDE04.ent.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gupta, Pekon" <pekon@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> >This is where we describe the different new and generic options used=
 by
> >the ST BCH driver.
> >
> >Cc: devicetree@vger.kernel.org
> >Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >---
> > Documentation/devicetree/bindings/mtd/stm-nand.txt | 123 ++++++++++=
+++++++++++
> > 1 file changed, 123 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/mtd/stm-nand.t=
xt
> >
> >diff --git a/Documentation/devicetree/bindings/mtd/stm-nand.txt
> >b/Documentation/devicetree/bindings/mtd/stm-nand.txt
> >new file mode 100644
> >index 0000000..9f9325f
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/mtd/stm-nand.txt
> >@@ -0,0 +1,123 @@
> >+STM BCH NAND Support
> >+--------------------
> >+
> >+Required properties:
> >+
> >+- compatible		: Should be "st,nand-bch"
> >+- reg			: Should contain register's location and length
> >+- reg-names		: "nand_mem" - NAND Controller register map
> >+			  "nand_dma" - BCH Controller DMA configuration map
> >+- interrupts		: Interrupt number
> >+- interrupt-names	: "nand_irq" - NAND Controller IRQ
> >+- st,nand-banks		: Subnode representing one or more "banks" of NAND
> >+                          Flash, connected to an STM NAND Controlle=
r (see
> >+                          description below).
> >+- nand-ecc-strength	: Generic NAND property (See mtd/nand.txt)
> >+- st,bch-bitflip-threshold
> >+			: The threshold at which the number of corrected bit-
> >+			  flips per sector is deemed to have reached an
> >+			  excessive level (triggers '-EUCLEAN' to be returned
> >+			  to the caller).  The value should be in the range 1
> >+			  to <ecc-strength> where <ecc-strength> is 18 or 30,
> >+			  depending on the BCH ECC mode in operation.  A value
> >+			  of 0, or if left unspecified, is interpreted by the
> >+			  driver as <ecc-strength>.
> >+
> Please drop this one as discussed in other thread that bitflip_thresh=
old
> does not qualify as DT binding (as it's not a hardware or const param=
eter).

=46ixed.

> >+Properties describing Bank of NAND Flash ("st,nand-banks"):
> >+
> >+- st,nand-csn		: Chip select associated with the Bank.
> >+- st,nand-timing-spec	: [Optional] NAND Device Timing Data.  All ti=
mes
> >+                          expressed in ns, except where stated othe=
rwise:
>=20
> I think DT maintainers don't prefer NAND timings being passed by DT,
> Instead they want it parsed from ONFI.
> Refer comments by 'Rob Herring <robherring2@gmail.com>' on
> [PATCH RFC 1/3] Devicetree: Add pl353 smc controller devicetree bindi=
ng information

=46ixed.

> >+Note, during initialisation, the NAND Controller timing registers a=
re configured
> >+according to one of the following methods, in order of precedence:
> >+
> >+           1. Configuration based on "st,nand_timing_spec" if suppl=
ied.
> >+
> Not sure if this mode is really required, as almost all devices are O=
NFI compliant.
> Please check with 'Rob Herring <robherring2@gmail.com>'

=46ixed.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
