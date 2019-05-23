Return-Path: <SRS0=56P5=TX=nvidia.com=nkristam@kernel.org>
Subject: Re: [Patch V3 4/8] dt-bindings: usb: Add NVIDIA Tegra XUSB device
 mode controller binding
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-5-git-send-email-nkristam@nvidia.com>
 <20190523101359.GD30331@ulmo>
From: Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <9a617a32-96e5-9622-747e-d6ab6e90c305@nvidia.com>
Date: Thu, 23 May 2019 17:11:18 +0530
MIME-Version: 1.0
In-Reply-To: <20190523101359.GD30331@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 23-05-2019 15:43, Thierry Reding wrote:
> On Thu, May 16, 2019 at 12:09:28PM +0530, Nagarjuna Kristam wrote:
>> Add device-tree binding documentation for the XUSB device mode controller
>> present on Tegra210 SoC. This controller supports the USB 3.0
>> specification.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  | 101 +++++++++++++++++++++
>>  1 file changed, 101 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>> new file mode 100644
>> index 0000000..d78b436
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.txt
>> @@ -0,0 +1,101 @@
>> +Device tree binding for NVIDIA Tegra XUSB device mode controller (XUDC)
>> +=======================================================================
>> +
>> +The Tegra XUDC controller supports both USB 2.0 HighSpeed/FullSpeed and
>> +USB 3.0 SuperSpeed protocols.
>> +
>> +Required properties:
>> +--------------------
>> +- compatible: For Tegra210, must contain "nvidia,tegra210-xudc".
>> +- reg: Must contain the base and length of the XUSB device registers, XUSB device
>> +  PCI Config registers and XUSB device controller registers.
>> +- interrupts: Must contain the XUSB device interrupt.
>> +- clocks: Must contain an entry for all clocks used.
>> +  See ../clock/clock-bindings.txt for details.
>> +- clock-names: Must include the following entries:
>> +   - dev: Clock to enable core XUSB dev clock.
>> +   - ss: Clock to enable XUSB super speed clock.
>> +   - ss_src: Clock to enable XUSB super speed dev clock.
>> +   - hs_src: Clock to enable XUSB high Speed dev clock.
>> +   - fs_src: Clock to enable XUSB full Speed dev clock.
> 
> You use inconsistent spelling for "speed" here.
> 
will do
>> +- nvidia,xusb-padctl: phandle to the XUSB pad controller that is used to
>> +  configure the USB pads used by the XUDC controller.
>> +- power-domains: A list of PM domain specifiers that reference each power-domain
>> +  used by the XUSB device mode controller. This list must comprise of a specifier
>> +  for the XUSBA and XUSBB power-domains. See ../power/power_domain.txt and
>> +  ../arm/tegra/nvidia,tegra20-pmc.txt for details.
>> +- power-domain-names: A list of names that represent each of the specifiers in
>> +  the 'power-domains' property. Must include 'ss' and 'dev'.
>> +
>> +For Tegra210:
>> +- avddio-usb-supply: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
>> +- hvdd-usb-supply: USB controller power supply. Must supply 3.3 V.
>> +
>> +- phys: Must contain an entry for each entry in phy-names.
>> +  See ../phy/phy-bindings.txt for details.
>> +- phy-names: Should include an entry for each PHY used by the controller.
>> +  Names must be "usb2", and "usb3" if support SuperSpeed device mode.
>> +  - "usb3" phy, SuperSpeed (SSTX+/SSTX-/SSRX+/SSRX-) data lines.
>> +  - "usb2" phy, USB 2.0 (D+/D-) data lines.
>> +
>> +- extcon: Must contains an extcon entry which detects USB VBUS pin.
>> +  See ../extcon/extcon-usb-gpio.txt for details.
> 
> Do the phys, phy-names and extcon properties only apply to Tegra210? It
> sounds like those would also apply to other generations, so they should
> go before the "For Tegra210:" line.
> 
Will move before Tegra210
>> +
>> +Example:
>> +--------
>> +	pmc: pmc@7000e400 {
>> +		compatible = "nvidia,tegra210-pmc";
>> +		reg = <0x0 0x7000e400 0x0 0x400>;
>> +		clocks = <&tegra_car TEGRA210_CLK_PCLK>, <&clk32k_in>;
>> +		clock-names = "pclk", "clk32k_in";
>> +
>> +		powergates {
>> +			pd_xusbss: xusba {
>> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
>> +				resets = <&tegra_car TEGRA210_CLK_XUSB_SS>;
> 
> We typically use the literal number here to be consistent with the cases
> where the clock ID differs from the reset ID.
> 
Will keep reset ID to numeric values
>> +				#power-domain-cells = <0>;
>> +			};
>> +
>> +			pd_xusbdev: xusbb {
>> +				clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>;
>> +				resets = <&tegra_car 95>;
> 
> It seems like don't follow that rule exactly since this is the same
> thing we have for XUSB already. I think it'd be best to stick with the
> literal number (like here) and remove the odd ones out. I can prepare
> patches to convert over the existing oddballs.
> 
>> +				#power-domain-cells = <0>;
>> +			};
>> +		};
>> +	};
>> +
>> +	xudc@700d0000 {
>> +		compatible = "nvidia,tegra210-xudc";
>> +		reg = <0x0 0x700d0000 0x0 0x8000>,
>> +			<0x0 0x700d8000 0x0 0x1000>,
>> +			<0x0 0x700d9000 0x0 0x1000>;
> 
> Use tabs, followed by spaces to properly align with the first entry,
> like you do for clock-names below.
> 
Will allign accordingly
>> +
>> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
>> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
>> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
>> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
>> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
> 
> Ditto.
> 
>> +		clock-names = "dev", "ss", "ss_src",
>> +			      "hs_src", "fs_src";
>> +
>> +		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
>> +		power-domain-names = "dev", "ss";
>> +
>> +		nvidia,xusb-padctl = <&padctl>;
>> +
>> +		phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>;
>> +		phy-names = "usb2;
> 
> Does it perhaps make sense to include the pad controller snippet in here
> as well?
>> Thierry
> 
Will add the reference.
-Nagarjuna
>> +
>> +		avddio-usb-supply = <&vdd_pex_1v05>;
>> +		hvdd-usb-supply = <&vdd_3v3_sys>;
>> +
>> +		extcon = <&extcon_usb>;
>> +	};
>> +
>> +	extcon_usb: extcon_vbus {
>> +		compatible = "linux,extcon-usb-gpio";
>> +		vbus-gpio = <&gpio TEGRA_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
>> +	};
>> +
>> -- 
>> 2.7.4
>>
