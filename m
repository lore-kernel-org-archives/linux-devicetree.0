From: Xing Zheng <zhengxing@rock-chips.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: add bindings for rk3399 clock controller
Date: Mon, 28 Mar 2016 10:51:36 +0800
Message-ID: <56F89C38.5000107@rock-chips.com>
References: <1458974276-10325-1-git-send-email-zhengxing@rock-chips.com> <1458974276-10325-3-git-send-email-zhengxing@rock-chips.com> <1507551.YPleCY5ZQt@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507551.YPleCY5ZQt@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016=E5=B9=B403=E6=9C=8828=E6=97=A5 07:52, Heiko St=C3=BCbner wrote:
> Hi Xing,
>
> Am Samstag, 26. M=C3=A4rz 2016, 14:37:54 schrieb Xing Zheng:
>> Add devicetree bindings for Rockchip cru which found on
>> Rockchip SoCs.
>>
>> Signed-off-by: Xing Zheng<zhengxing@rock-chips.com>
>> Signed-off-by: Jianqun Xu<jay.xu@rock-chips.com>
>> Acked-by: Rob Herring<robh@kernel.org>
>> ---
>>
>> Changes in v5: None
>> Changes in v3: None
>> Changes in v2: None
>>
>>   .../bindings/clock/rockchip,rk3399-cru.txt         |   83
>> ++++++++++++++++++++ 1 file changed, 83 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
>>
>> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3399=
-
> cru.txt
>> b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt ne=
w file
>> mode 100644
>> index 0000000..9427caa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.tx=
t
>> @@ -0,0 +1,83 @@
>> +* Rockchip RK3399 Clock and Reset Unit
>> +
>> +The RK3399 clock controller generates and supplies clock to various
>> +controllers within the SoC and also implements a reset controller f=
or SoC
>> +peripherals.
>> +
>> +Required Properties:
>> +
>> +- compatible: PMU for CRU should be "rockchip,rk3399-pmucru"
>> +- compatible: CRU should be "rockchip,rk3399-cru"
>> +- reg: physical base address of the controller and length of memory
> mapped
>> +  region.
>> +- #clock-cells: should be 1.
>> +- #reset-cells: should be 1.
>> +
>> +Optional Properties:
>> +
>> +- rockchip,grf: phandle to the syscon managing the "general registe=
r
> files"
>> +  If missing, pll rates are not changeable, due to the missing pll =
lock
>> status. +
> the rk3399 doesn't need the GRF, so we should drop this block for now
>
>> +Each clock is assigned an identifier and client nodes can use this
>> identifier +to specify the clock which they consume. All available c=
locks
>> are defined as +preprocessor macros in the dt-bindings/clock/rk3399-=
cru.h
>> headers and can be +used in device tree sources. Similar macros exis=
t for
>> the reset sources in +these files.
>> +
>> +External clocks:
>> +
>> +There are several clocks that are generated outside the SoC. It is
> expected
>> +that they are defined using standard clock bindings with following
>> +clock-output-names:
>> + - "xin24m" - crystal input - required,
>> + - "xin32k" - rtc clock - optional,
>> + - "ext_i2s" - external I2S clock - optional,
>> + - "ext_gmac" - external GMAC clock - optional
>> + - "ext_hsadc" - external HSADC clock - optional,
>> + - "ext_isp" - external ISP clock - optional,
>> + - "ext_jtag" - external JTAG clock - optional
>> + - "ext_vip" - external VIP clock - optional,
>> + - "usbotg_out" - output clock of the pll in the otg phy
> external clock listing needs adjusting, something like
>
> - clkin_i2s
> - clkin_gmac
> -->  remove ext_hsadc
> - clkin_cif
> -->  remove ext_jtag
> -->  remove ext_vip
> - clk_usbphy0_480m
> - clk_usbphy0_480m
>
> maybe?
Thanks, now they like this:
clock-output-names:
- "xin24m" - crystal input - required,
- "xin32k" - rtc clock - optional,
- "clkin_gmac" - external GMAC clock - optional,
- "gmac_phy_rx_clk" - external GMAC RX clock - optional,
- "clkin_i2s" - external I2S clock - optional,
- "pclkin_cif" - external ISP clock - optional,
- "clk_usbphy0_480m" - output clock of the pll in the usbphy0
- "clk_usbphy1_480m" - output clock of the pll in the usbphy1
>
>> +
>> +Example: General Register Files
>> +
>> +	pmugrf: syscon@ff320000 {
>> +		compatible =3D "rockchip,rk3399-pmugrf", "syscon";
>> +		reg =3D<0x0 0xff320000 0x0 0x1000>;
>> +	};
>> +
>> +	grf: syscon@ff770000 {
>> +		compatible =3D "rockchip,rk3399-grf", "syscon";
>> +		reg =3D<0x0 0xff770000 0x0 0x10000>;
>> +	};
>> +
>> +Example: Clock controller node:
>> +
>> +	pmucru: pmu-clock-controller@ff750000 {
>> +		compatible =3D "rockchip,rk3399-pmucru";
>> +		reg =3D<0x0 0xff750000 0x0 0x1000>;
>> +		rockchip,grf =3D<&pmugrf>;
>> +		#clock-cells =3D<1>;
>> +		#reset-cells =3D<1>;
>> +	};
>> +
>> +	cru: clock-controller@ff760000 {
>> +		compatible =3D "rockchip,rk3399-cru";
>> +		reg =3D<0x0 0xff760000 0x0 0x1000>;
>> +		rockchip,grf =3D<&grf>;
>> +		#clock-cells =3D<1>;
>> +		#reset-cells =3D<1>;
>> +	};
> also here drop grf nodes and rockchip,grf properties?
Done.
>
>
>> +
>> +Example: UART controller node that consumes the clock generated by =
the
>> clock +  controller:
>> +
>> +	uart0: serial@ff1a0000 {
>> +		compatible =3D "rockchip,rk3399-uart", "snps,dw-apb-uart";
>> +		reg =3D<0x0 0xff180000 0x0 0x100>;
>> +		clocks =3D<&cru SCLK_UART0>,<&cru PCLK_UART0>;
>> +		clock-names =3D "baudclk", "apb_pclk";
>> +		interrupts =3D<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>> +		reg-shift =3D<2>;
>> +		reg-io-width =3D<4>;
>> +	};
>
>
Thanks.

--=20
- Xing Zheng
