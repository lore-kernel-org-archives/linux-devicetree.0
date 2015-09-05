From: Sharma Bhupesh <bhupesh.sharma@freescale.com>
Subject: RE: [PATCH v2 07/10] dts/ls2085a: Update DTSI to add support of
 various peripherals
Date: Sat, 5 Sep 2015 08:37:53 +0000
Message-ID: <BY1PR0301MB130306991ACB28E4C8109DD582560@BY1PR0301MB1303.namprd03.prod.outlook.com>
References: <1441350322-4671-1-git-send-email-bhupesh.sharma@freescale.com>
 <CADRPPNQER9UnKLazm9C6Dd7DAkDxLb4QShK64tmtahZxJJ-t=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CADRPPNQER9UnKLazm9C6Dd7DAkDxLb4QShK64tmtahZxJJ-t=g@mail.gmail.com>
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
To: Li Leo <LeoLi@freescale.com>, Xiaobo Xie <X.Xie@freescale.com>, Liu Gang <Gang.Liu@freescale.com>, "Lian M.H." <Minghuan.Lian@freescale.com>, Badola
 Nikhil <nikhil.badola@freescale.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shaohui Xie <Shaohui.Xie@freescale.com>, Arnd Bergmann <arnd@arndb.de>, Huan Wang <alison.wang@freescale.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "Catalin.Marinas@arm.com" <Catalin.Marinas@arm.com>, Singh Jaiprakash <jaiprakash.singh@freescale.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "olof@lixom.net" <olof@lixom.net>, Scott Wood <scottwood@freescale.com>, Bhupesh SHARMA <bhupesh.linux@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Lu Y.B." <yangbo.lu@freescale.com>
List-Id: devicetree@vger.kernel.org

> From: pku.leo@gmail.com [mailto:pku.leo@gmail.com]
> Sent: Saturday, September 05, 2015 2:33 AM
> On Fri, Sep 4, 2015 at 2:05 AM, Bhupesh Sharma
> <bhupesh.sharma@freescale.com> wrote:
> > This patch updates the LS2085a DTSI (DTS Include) file to add support
> > for various peripherals supported by FSL LS2085a SoC, for e.g.:
> 
> The title and description here are still using the old LS2085 name.

Ok.

[snip] ..

> > +       amba {
> > +               compatible = "arm,amba-bus";
> > +               #address-cells = <2>;
> > +               #size-cells = <2>;
> > +               ranges;
> > +
> > +               cluster1_core0_watchdog: wdt@c000000 {
> > +                       compatible = "arm,primecell";
> 
> Binding of Primecell requires a specific name for the device instead of
> just a "arm,primecell".

The sp805 driver doesn't have a compatible string like arm, sp805.
You can refer to 'Documentation/devicetree/bindings/wdt' for details - there is no entry for sp805 here.
Instead it relies on the 'drivers/amba/bus.c' framework to invoke the probe function of the
sp805 wdt driver using the unique PRIMECELL identifiers of the sp805 wdt IP.

See Appendix A of 'devicetree/usage-model.txt' for details:
http://lxr.free-electrons.com/source/Documentation/devicetree/usage-model.txt#L398

> > +       smmu: iommu@5000000 {
> > +               compatible = "arm,mmu-500";
> > +               reg = <0 0x5000000 0 0x800000>;
> > +               #global-interrupts = <12>;
> > +               interrupts = <0 13 4>, /* global secure fault */
> > +                            <0 14 4>, /* combined secure interrupt */
> > +                            <0 15 4>, /* global non-secure fault */
> > +                            <0 16 4>, /* combined non-secure interrupt
> */
> > +                       /* performance counter interrupts 0-7 */
> > +                            <0 211 4>,
> > +                            <0 212 4>,
> > +                            <0 213 4>,
> > +                            <0 214 4>,
> > +                            <0 215 4>,
> > +                            <0 216 4>,
> > +                            <0 217 4>,
> > +                            <0 218 4>,
> > +                       /* per context interrupt, 64 interrupts */
> > +                            <0 146 4>,
> > +                            <0 147 4>,
> > +                            <0 148 4>,
> > +                            <0 149 4>,
> > +                            <0 150 4>,
> > +                            <0 151 4>,
> > +                            <0 152 4>,
> > +                            <0 153 4>,
> > +                            <0 154 4>,
> > +                            <0 155 4>,
> > +                            <0 156 4>,
> > +                            <0 157 4>,
> > +                            <0 158 4>,
> > +                            <0 159 4>,
> > +                            <0 160 4>,
> > +                            <0 161 4>,
> > +                            <0 162 4>,
> > +                            <0 163 4>,
> > +                            <0 164 4>,
> > +                            <0 165 4>,
> > +                            <0 166 4>,
> > +                            <0 167 4>,
> > +                            <0 168 4>,
> > +                            <0 169 4>,
> > +                            <0 170 4>,
> > +                            <0 171 4>,
> > +                            <0 172 4>,
> > +                            <0 173 4>,
> > +                            <0 174 4>,
> > +                            <0 175 4>,
> > +                            <0 176 4>,
> > +                            <0 177 4>,
> > +                            <0 178 4>,
> > +                            <0 179 4>,
> > +                            <0 180 4>,
> > +                            <0 181 4>,
> > +                            <0 182 4>,
> > +                            <0 183 4>,
> > +                            <0 184 4>,
> > +                            <0 185 4>,
> > +                            <0 186 4>,
> > +                            <0 187 4>,
> > +                            <0 188 4>,
> > +                            <0 189 4>,
> > +                            <0 190 4>,
> > +                            <0 191 4>,
> > +                            <0 192 4>,
> > +                            <0 193 4>,
> > +                            <0 194 4>,
> > +                            <0 195 4>,
> > +                            <0 196 4>,
> > +                            <0 197 4>,
> > +                            <0 198 4>,
> > +                            <0 199 4>,
> > +                            <0 200 4>,
> > +                            <0 201 4>,
> > +                            <0 202 4>,
> > +                            <0 203 4>,
> > +                            <0 204 4>,
> > +                            <0 205 4>,
> > +                            <0 206 4>,
> > +                            <0 207 4>,
> > +                            <0 208 4>,
> > +                            <0 209 4>;
> > +               mmu-masters = <&fsl_mc 0x300 0>;
> 
> Are we really only having one mmu-master?

So far only this one is tested. Later on others can be added
when we have tested them with SMMU APIs as well.

> > +       };
> > +
> > +       dspi: dspi@2100000 {
> > +               compatible = "fsl,vf610-dspi";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               reg = <0x0 0x2100000 0x0 0x10000>;
> > +               interrupts = <0 26 0x4>; /* Level high type */
> > +               tcfq-mode;
> 
> Can not find this property in the binding.

Xiaobo, can you please answer Leo's comment here. Thanks.

> > +               clocks = <&clockgen 4 3>;
> > +               clock-names = "dspi";
> > +               spi-num-chipselects = <5>;
> > +               bus-num = <0>;
> > +               spi-cpol;
> > +               spi-cpha;
> 
> These two are not defined either.

Xiaobo, can you please answer Leo's comment here. Thanks.
 
> > +       };
> > +
> > +       esdhc: esdhc@2140000 {
> > +               compatible = "fsl,ls2080a-esdhc", "fsl,esdhc";
> > +               reg = <0x0 0x2140000 0x0 0x10000>;
> > +               interrupts = <0 28 0x4>; /* Level high type */
> > +               clock-frequency = <0>;  /* Updated by bootloader */
> > +               voltage-ranges = <1800 1800 3300 3300>;
> > +               sdhci,auto-cmd12;
> > +               little-endian;
> 
> The patch for defining this property is still pending.

Xiaobo, can you please answer Leo's comment here. Thanks.

> 
> > +               bus-width = <4>;
> > +       };
> > +
> > +       gpio0: gpio@2300000 {
> > +               compatible = "fsl,ls2080a-gpio";
> 
> Maybe you should add a more generic compatible string here.  It's not
> clear which driver/binding you are actually using, mpc8xxx, imx or vf610?

Liu Gang, can you please answer Leo's comment here. Thanks.
 
> > +               reg = <0x0 0x2300000 0x0 0x10000>;
> > +               interrupts = <0 36 0x4>; /* Level high type */
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +               interrupt-controller;
> > +               #interrupt-cells = <2>;
> > +       };
> > +

[snip] ..

> > +       pcie@3400000 {
> > +               compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
> > +               reg = <0x00 0x03400000 0x0 0x00100000   /* controller
> registers */
> > +                      0x10 0x00000000 0x0 0x00001000>; /*
> configuration space */
> > +               reg-names = "regs", "config";
> > +               interrupts = <0 108 0x4>; /* Level high type */
> > +               interrupt-names = "intr";
> > +               #address-cells = <3>;
> > +               #size-cells = <2>;
> > +               device_type = "pci";
> > +               num-lanes = <4>;
> > +               bus-range = <0x0 0xff>;
> > +               ranges = <0x81000000 0x0 0x00000000 0x10 0x00010000 0x0
> 0x00010000   /* downstream I/O */
> > +                         0x82000000 0x0 0x40000000 0x10 0x40000000 0x0
> 0x40000000>; /* non-prefetchable memory */
> > +               msi-parent = <&its>;
> > +               #interrupt-cells = <1>;
> > +               interrupt-map-mask = <0 0 0 7>;
> > +               interrupt-map = <0000 0 0 1 &gic 0 0 0 109 4>,
> > +                               <0000 0 0 2 &gic 0 0 0 110 4>,
> > +                               <0000 0 0 3 &gic 0 0 0 111 4>,
> > +                               <0000 0 0 4 &gic 0 0 0 112 4>;
> 
> Binding shows it requires clocks and clock-names property.

Minghuan, can you please answer Leo's comment here. Thanks.
 
> > +       };
> > +

[snip] ..

> > +
> > +       usb0: usb3@3100000 {
> > +               compatible = "snps,dwc3";
> > +               reg = <0x0 0x3100000 0x0 0x10000>;
> > +               interrupts = <0 80 0x4>; /* Level high type */
> > +               dr_mode = "host";
> 
> dr_mode not defined in dwc3 binding.

Nikhil, I think you have already sent out a patch which addresses the same.
Can you please update this thread with the link of the same? Thanks.


[snip] ..

Regards,
Bhupesh
