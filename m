From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCHv2 5/5] arm64: allwinner: a64: Add support for TERES-I laptop
Date: Mon, 25 Jun 2018 15:47:18 +0800
Message-ID: <1CF519CD-D44E-4959-8951-27CE710E0984@aosc.io>
References: <20180315162510.11669-1-harald@ccbib.org> <20180315162510.11669-6-harald@ccbib.org> <a7011fe78d171658742406bf01d50b7e3d7eaf1d.camel@aosc.io> <E1fX7yK-0000OC-HA@stardust.g4.wien.funkfeuer.at> <5B309D37.80207@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5B309D37.80207@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Harald Geyer <harald@ccbib.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Kalle Valo <kvalo@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, info@olimex.com, linux-wireless@vger.kernel.org
List-Id: devicetree@vger.kernel.org



于 2018年6月25日 GMT+08:00 下午3:43:51, Arend van Spriel <arend.vanspriel@broadcom.com> 写到:
>On 6/24/2018 6:34 PM, Harald Geyer wrote:
>> Icenowy Zheng writes:
>>> >在 2018-03-15四的 16:25 +0000，Harald Geyer写道：
>>>> > >+&mmc1 {
>>>> > >+	pinctrl-names = "default";
>>>> > >+	pinctrl-0 = <&mmc1_pins>;
>>>> > >+	vmmc-supply = <&reg_aldo2>;
>>>> > >+	vqmmc-supply = <&reg_dldo4>;
>>>> > >+	mmc-pwrseq = <&wifi_pwrseq>;
>>>> > >+	bus-width = <4>;
>>>> > >+	non-removable;
>>>> > >+	status = "okay";
>>>> > >+
>>>> > >+	rtl8723bs: wifi@1 {
>>>> > >+		reg = <1>;
>>>> > >+		interrupt-parent = <&r_pio>;
>>>> > >+		interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
>>>> > >+		interrupt-names = "host-wake";
>>>> > >+	};
>
>[...]
>
>>> >- This device node has no binding. The "host-wake" interrupt is
>part of
>>> >  Broadcom SDIO Wi-Fi binding, rather than a generic one.
>> I think the general mmc and interrupts bindings apply. And the mmc
>binding
>> clearly states that for sub-nodes a compatible string is optional.
>>
>> However I just realized that the 'interrupt-names' property is not
>part
>> of the general interrupts binding, so I guess at least this property
>should
>> be removed.
>
>Indeed. If the device just used the SDIO interrupt this is not needed. 
>The Broadcom device can use either SDIO interrupt or a so-called 
>out-of-band host-wake interrupt, which is what the above represents.

RTL8....S is also capable of use OOB interrupt.

>
>Regards,
>Arend
