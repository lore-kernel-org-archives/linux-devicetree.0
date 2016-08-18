From: Shaohui Xie <shaohui.xie@nxp.com>
Subject: RE: [PATCH 1/5] arm64: dts: add QorIQ LS1046A SoC support
Date: Thu, 18 Aug 2016 10:27:36 +0000
Message-ID: <DB5PR0401MB21834BD67F0EA86B3A22E9D6E8150@DB5PR0401MB2183.eurprd04.prod.outlook.com>
References: <1467972944-12293-1-git-send-email-shh.xie@gmail.com>
 <1467972944-12293-2-git-send-email-shh.xie@gmail.com>
 <1984740.gmAYAJ1bIT@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1984740.gmAYAJ1bIT@wuerfel>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mihai Emilian Bantea <mihai.bantea@nxp.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, Zhiqiang Hou <zhiqiang.hou@nxp.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Minghuan Lian <minghuan.lian@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>, "galak@codeaurora.org" <galak@codeaurora.org>, Qianyu Gong <qianyu.gong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Arnd,

Thank you for reviewing!

I'm seriously Sorry for the late response! I was on business travel on a project and had been very busy for a  long time.

Please see inline.

Regards,
Shaohui
> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd@arndb.de]
> Sent: Friday, July 08, 2016 8:00 PM
> To: shh.xie@gmail.com
> Cc: devicetree@vger.kernel.org; robh+dt@kernel.org; mark.rutland@arm.com;
> pawel.moll@arm.com; ijc+devicetree@hellion.org.uk; galak@codeaurora.org;
> linux-arm-kernel@lists.infradead.org; catalin.marinas@arm.com;
> will.deacon@arm.com; Mingkai Hu <mingkai.hu@nxp.com>; Mihai Emilian Bantea
> <mihai.bantea@nxp.com>; Qianyu Gong <qianyu.gong@nxp.com>; Minghuan Lian
> <minghuan.lian@nxp.com>; Zhiqiang Hou <zhiqiang.hou@nxp.com>; Shaohui Xie
> <shaohui.xie@nxp.com>
> Subject: Re: [PATCH 1/5] arm64: dts: add QorIQ LS1046A SoC support
> 
> On Friday, July 8, 2016 6:15:40 PM CEST shh.xie@gmail.com wrote:
> > +
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		reg = <0x0 0x80000000 0 0x80000000>;
> > +		      /* DRAM space 1, size: 2GiB DRAM */
> > +	};
> 
> The memory size is usually in the .dts file, unless this is on-chip eDRAM.
[S.H] The memory size will be fixup by U-boot, if it's not proper to have it in .dtsti,
How about remove it?

> > +		clockgen: clocking@1ee1000 {
> > +			compatible = "fsl,ls1046a-clockgen";
> 
> > +		scfg: scfg@1570000 {
> > +			compatible = "fsl,ls1046a-scfg", "syscon";
> 
> > +		dcfg: dcfg@1ee0000 {
> > +			compatible = "fsl,ls1046a-dcfg", "syscon";
> 
> None of the fsl,ls1046a-* devices seem to have any binding documentation.
[S.H] Will update binding for fsl,ls1046-* devices in next version.

> 
> > +		wdog0: wdog@2ad0000 {
> 
> watchdog@2ad0000
[S.H] Will fix it.

> 
> > +		usb0: usb3@2f00000 {
> 
> usb@2f00000
[S.H] Will fix it.

> 
> > +		pcie@3400000 {
> > +			compatible = "fsl,ls1046a-pcie", "snps,dw-pcie";
> > +			reg = <0x00 0x03400000 0x0 0x00100000   /* controller
> registers */
> > +			       0x40 0x00000000 0x0 0x00002000>; /* configuration
> space */
> > +			reg-names = "regs", "config";
> > +			interrupts = <0 118 0x4>, /* controller interrupt */
> > +				     <0 117 0x4>; /* PME interrupt */
> > +			interrupt-names = "intr", "pme";
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +			device_type = "pci";
> > +			num-lanes = <4>;
> > +			bus-range = <0x0 0xff>;
> > +			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000
> 0x0 0x00010000   /* downstream I/O */
> > +				  0x82000000 0x0 0x40000000 0x40 0x40000000
> 0x0 0x40000000>; /*
> > +non-prefetchable memory */
> 
> No prefetchable memory area?
> 
> > +			msi-parent = <&msi>;
> 
> You seem to have a gic-400, could you use that as the MSI sink instead?
> 
> > +			#interrupt-cells = <1>;
> > +			interrupt-map-mask = <0 0 0 7>;
> > +			interrupt-map = <0000 0 0 1 &gic 0 110 0x4>,
> > +					<0000 0 0 2 &gic 0 110 0x4>,
> > +					<0000 0 0 3 &gic 0 110 0x4>,
> > +					<0000 0 0 4 &gic 0 110 0x4>;
> > +		};
> >
> 
> If the four interrupts are all the same, why do you have separate entries?
[S.H] We are working on refining the MSI driver and the MSI node will also be changed, 
so the MSI and PCIe node will be added together with the MSI driver updates.
In the next version, I will drop the MSI node and PCIe node.

Thank you!
