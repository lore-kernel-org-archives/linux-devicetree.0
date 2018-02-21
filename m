From: gregkh <gregkh@linuxfoundation.org>
Subject: Re: stable-rc/linux-4.15.y build: 185 builds: 0 failed, 185 passed,
 46 warnings (v4.15.1-61-g7ab5513e4cbc)
Date: Wed, 21 Feb 2018 12:35:48 +0100
Message-ID: <20180221113548.GB19900@kroah.com>
References: <5a78c368.5896df0a.8f293.fd41@mx.google.com>
 <CAK8P3a1n2ELL56MHqEgffzNg2B8gdpwHpMnp_vgN4ftAAiwW8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a1n2ELL56MHqEgffzNg2B8gdpwHpMnp_vgN4ftAAiwW8A@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>, "kernelci.org bot" <bot@kernelci.org>, Kernel Build Reports Mailman List <kernel-build-reports@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "4.15.x" <stable@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 06, 2018 at 04:08:49PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 5, 2018 at 9:49 PM, kernelci.org bot <bot@kernelci.org> wrote:
> >
> > stable-rc/linux-4.15.y build: 185 builds: 0 failed, 185 passed, 46 warnings (v4.15.1-61-g7ab5513e4cbc)
> 
> Hi Greg,
> 
> FYI, the device tree compiler warnings are all fixed in
> linux-4.16-rc1. These are basically fixes
> that we ended up not submitting last minute for the release after one
> of them (the USB PHY
> one, if you remember) had blown up.
> 
> Anyway, I think the risk is rather low for any of them (they are
> mostly platforms that
> are not widely used, and the fixes make things work that didn't), so
> to get a clean
> build, feel free to pick up the remaining patches from mainline now or
> after -rc1:
> 
> > Warnings Detected:
> >
> > Warnings summary:
> > 2 arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Property 'dmas', cell 4 is not a phandle reference in /ahb/apb/serial@b4100000
> > 2 arch/arm/boot/dts/spear1340-evb.dtb: Warning (dmas_property): Missing property '#dma-cells' in node /interrupt-controller@ec801000 or bad phandle (referred from /ahb/apb/serial@b4100000:dmas[4])
> 
> cdd104099141 ("arm: spear13xx: Fix dmas cells")

Now applied.

> > 2 arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Property 'cs-gpios', cell 6 is not a phandle reference in /ahb/apb/spi@e0100000
> > 2 arch/arm/boot/dts/spear1310-evb.dtb: Warning (gpios_property): Missing property '#gpio-cells' in node /interrupt-controller@ec801000 or bad phandle (referred from /ahb/apb/spi@e0100000:cs-gpios[6])
> 
> f8975cb1b8a3 ("arm: spear13xx: Fix spics gpio controller's warning")

Applied.

> > 2 arch/arm/boot/dts/exynos5410-smdk5410.dtb: Warning (interrupts_property): Missing interrupt-controller or interrupt-map property in /soc/system-controller@10040000
> > 2 arch/arm/boot/dts/exynos5410-smdk5410.dtb: Warning (interrupts_property): Missing #interrupt-cells in interrupt-parent /soc/system-controller@10040000
> > 2 arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property): Missing interrupt-controller or interrupt-map property in /soc/system-controller@10040000
> > 2 arch/arm/boot/dts/exynos5410-odroidxu.dtb: Warning (interrupts_property): Missing #interrupt-cells in interrupt-parent /soc/system-controller@10040000
> 
> 5628a8ca1414 ("ARM: dts: exynos: fix RTC interrupt for exynos5410")

Applied

> > 2 WARNING: modpost: missing MODULE_LICENSE() in arch/arm/mach-pxa/tosa-bt.o
> 
> 3343647813fd ("ARM: pxa/tosa-bt: add MODULE_LICENSE tag")

Applied

> > 1 arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: Warning (phys_property): Missing property '#phy-cells' in node /soc/mdss@1a00000/dsi-phy@1a98300 or bad phandle (referred from /soc/mdss@1a00000/dsi@1a98000:phys[0])
> > 1 arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: Warning (phys_property): Missing property '#phy-cells' in node /soc/mdss@1a00000/dsi-phy@1a98300 or bad phandle (referred from /soc/mdss@1a00000/dsi@1a98000:phys[0])
> 
> b0ab681285aa ("arm64: dts: msm8916: Add missing #phy-cells")

Applied.

> > 1 arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: Warning (cooling_device_property): Missing property '#cooling-cells' in node /cpus/cpu@100 or bad phandle (referred from /thermal-zones/cpu_thermal/cooling-maps/map@1:cooling-device[0])
> > 1 arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: Warning (cooling_device_property): Missing property '#cooling-cells' in node /cpus/cpu@0 or bad phandle (referred from /thermal-zones/cpu_thermal/cooling-maps/map@0:cooling-device[0])
> 
> acbf76ee0506 ("arm64: dts: add #cooling-cells to CPU nodes")

Does not apply at all, can you send a backport?

> > 1 arch/arm/boot/dts/stih410-b2260.dtb: Warning (gpios_property): hdmi,hpd-gpio property size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
> > 1 arch/arm/boot/dts/stih410-b2120.dtb: Warning (gpios_property): hdmi,hpd-gpio property size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
> > 1 arch/arm/boot/dts/stih407-b2120.dtb: Warning (gpios_property): hdmi,hpd-gpio property size (8) too small for cell size 2 in /soc/sti-display-subsystem/sti-hdmi@8d04000
> 
> 7ac1f59c09a6 ("ARM: dts: STi: Add gpio polarity for "hdmi,hpd-gpio" property")

Applied.

> > 1 arch/arm/boot/dts/ste-nomadik-s8815.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000
> > 1 arch/arm/boot/dts/ste-nomadik-nhk15.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000
> 
> e8bfa0422469 ("ARM: dts: nomadik: add interrupt-parent for clcd")

Applied

> > 1 arch/arm/boot/dts/spear600-evb.dtb: Warning (interrupts_property): Missing interrupt-parent for /ahb/apb/rtc@fc900000
> 
> 6ffb5b4f248f ("arm: spear600: Add missing interrupt-parent of rtc")

Applied.

> > 1 arch/arm/boot/dts/s5pv210-torbreck.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> > 1 arch/arm/boot/dts/s5pv210-smdkv210.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> > 1 arch/arm/boot/dts/s5pv210-smdkc110.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> > 1 arch/arm/boot/dts/s5pv210-goni.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> > 1 arch/arm/boot/dts/s5pv210-aquila.dtb: Warning (interrupts_property): Missing interrupt-parent for /soc/ohci@ec300000
> 
> 5c1037196b9e ("ARM: dts: s5pv210: add interrupt-parent for ohci")

Applied.

> > 1 arch/arm/boot/dts/mt7623n-rfb-nand.dtb: Warning (resets_property): Missing property '#reset-cells' in node /syscon@1b000000 or bad phandle (referred from /ethernet@1b100000:resets[0])
> > 1 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dtb: Warning (resets_property): Missing property '#reset-cells' in node /syscon@1b000000 or bad phandle (referred from /ethernet@1b100000:resets[0])
> 
> 76a09ce214ad ("arm: dts: mt7623: Update ethsys binding")

Applied.

> > 1 arch/arm/boot/dts/mt2701-evb.dtb: Warning (resets_property): Missing property '#reset-cells' in node /syscon@1b000000 or bad phandle (referred from /ethernet@1b100000:resets[0])
> 
> ae72e95b5e4d ("arm: dts: mt2701: Add reset-cells")

Applied.

> > 1 arch/arm/boot/dts/lpc3250-phy3250.dtb: Warning (gpios_property): reset-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18
> > 1 arch/arm/boot/dts/lpc3250-phy3250.dtb: Warning (gpios_property): power-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18
> > 1 arch/arm/boot/dts/lpc3250-ea3250.dtb: Warning (gpios_property): reset-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18
> > 1 arch/arm/boot/dts/lpc3250-ea3250.dtb: Warning (gpios_property): power-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18
> 
> ca32e0c4bf9c ("ARM: lpc3250: fix uda1380 gpio numbers")

Applied.

> > 1 arch/arm/boot/dts/arm-realview-eb-a9mp.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
> > 1 arch/arm/boot/dts/arm-realview-eb-a9mp-bbrevd.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
> > 1 arch/arm/boot/dts/arm-realview-eb-11mp.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
> > 1 arch/arm/boot/dts/arm-realview-eb-11mp-ctrevb.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
> > 1 arch/arm/boot/dts/arm-realview-eb-11mp-bbrevd.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
> > 1 arch/arm/boot/dts/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
> 
> 586b2a4befad ("ARM: dts: Delete bogus reference to the charlcd")

Applied.

Thanks for all of these, only one needs manual help.

greg k-h
