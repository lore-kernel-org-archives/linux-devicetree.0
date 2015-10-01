From: Stuart Yoder <stuart.yoder@freescale.com>
Subject: RE: [PATCH v3 1/2] fsl: Add binding for RCPM
Date: Thu, 1 Oct 2015 17:05:43 +0000
Message-ID: <CY1PR0301MB0748AB1CE2D93FFD79FE6009874C0@CY1PR0301MB0748.namprd03.prod.outlook.com>
References: <1443083354-37369-1-git-send-email-dongsheng.wang@freescale.com>
 <CALRxmdDwGgxCG5SfSOaEXK8_fJcG4UUw_9D2=NA7nQhikDyb+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CALRxmdDwGgxCG5SfSOaEXK8_fJcG4UUw_9D2=NA7nQhikDyb+A@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Zhao C.H." <chenhui.zhao@freescale.com>, Huan Wang <alison.wang@freescale.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Wang Dongsheng <Dongsheng.Wang@freescale.com>, Yuantian Tang <Yuantian.Tang@freescale.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Jin Jason <Jason.Jin@freescale.com>, Scott Wood <scottwood@freescale.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> @@ -0,0 +1,63 @@
> +* Run Control and Power Management
> +-------------------------------------------
> +The RCPM performs all device-level tasks associated with device run control
> +and power management.
> +
> +Required properites:
> +  - reg : Offset and length of the register set of RCPM block.

s/RCPM block/the RCPM block/

> +  - fsl,#rcpm-wakeup-cells : The number of cells in rcpm-wakeup property.

s/rcpm-wakeup-property/the rcpm-wakeup-property/

> +  - compatible : Sould contain a chip-specific RCPM block compatible string

s/Sould/Should

"Should" means it is recommended, but does not mean "must".  Is it really optional?

> +       and (if applicable) may contain a chassis-version RCPM compatible
> +       string. Chip-specific strings are of the form "fsl,<chip>-rcpm",
> +       such as:
> +       * "fsl,p2041-rcpm"
> +       * "fsl,p3041-rcpm"
> +       * "fsl,p4080-rcpm"
> +       * "fsl,p5020-rcpm"
> +       * "fsl,p5040-rcpm"
> +       * "fsl,t4240-rcpm"
> +       * "fsl,b4420-rcpm"
> +       * "fsl,b4860-rcpm"

2 or 3 examples is enough.

> +       Chassis-version strings are of the form "fsl,qoriq-rcpm-<version>",
> +       such as:
> +       * "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
> +       * "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
> +       * "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
> +
> +All references to "1.0" and "2.0" refer to the QorIQ chassis version to
> +which the chip complies.
> +Chassis Version                Example Chips
> +---------------                -------------------------------
> +1.0                            p4080, p5020, p5040, p2041, p3041
> +2.0                            t4240, b4860, b4420
> +2.1                            t1040, ls1021

Not sure this binding is the place to maintain a table of chassis
versions to SoCs.

Thanks,
Stuart
