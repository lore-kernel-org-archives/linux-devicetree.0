Return-Path: <SRS0=1SIx=BS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C08C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  8 Aug 2020 22:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5057C206C3
	for <linux-devicetree@archiver.kernel.org>; Sat,  8 Aug 2020 22:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgHHWAj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 8 Aug 2020 18:00:39 -0400
Received: from foss.arm.com ([217.140.110.172]:43926 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725950AbgHHWAj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 8 Aug 2020 18:00:39 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ACF7D6E;
        Sat,  8 Aug 2020 15:00:38 -0700 (PDT)
Received: from [10.57.35.143] (unknown [10.57.35.143])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79C243F7D8;
        Sat,  8 Aug 2020 15:00:37 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] rockchip: rk3328: Add support for FriendlyARM
 NanoPi R2S
To:     David Bauer <mail@david-bauer.net>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
References: <20200730232054.286381-1-mail@david-bauer.net>
 <20200730232054.286381-2-mail@david-bauer.net>
 <d0053630-1ff3-9771-eb7d-7aaf0a27dca2@arm.com>
 <685c3ab2-5f51-1fc2-622d-4d9785d7074b@david-bauer.net>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <efd14c05-0f0f-559e-dfb5-51cc6b0988f2@arm.com>
Date:   Sat, 8 Aug 2020 23:00:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <685c3ab2-5f51-1fc2-622d-4d9785d7074b@david-bauer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-08-06 07:57, David Bauer wrote:
> Hi Robin,
> 
> thanks for your review. Only adressing some non-formal comments below.
> 
> On 8/3/20 12:01 AM, Robin Murphy wrote:
>>
>> This seems to match the schematic, however in practice the GPIO seems to have a mind of its own and not respond to the LED settings - are we missing something with the pinctrl perhaps?
> 
> Hmm, this is strange. It works fine on my unit (with the current OpenWrt release). Can you test this and report back?

It seems like somehow that particular GPIO doesn't get configured 
properly and is still in its default out-of-reset state as an input. 
Poking the GPIO from sysfs works as expected, and in fact just unbinding 
and rebinding the leds-gpio driver also manages to kick things into 
shape. Clearly there's some subtle driver-level issue, but at least it's 
not a DT problem :)

>>> +            label = "nanopi-r2s:green:lan";
>>> +        };
>>> +
>>> +        wan {
>>> +            gpios = <&gpio2 RK_PC2 GPIO_ACTIVE_HIGH>;
>>> +            label = "nanopi-r2s:green:wan";
>>> +        };
>>> +    };
>>> +
>>> +    gpio_keys {
>>> +        compatible = "gpio-keys-polled";
>>
>> Does this need to be polled? I would have thought regular interrupt-based gpio-keys should work, to avoid the overhead of polling for something (relatively) incredibly rare, but perhaps I'm wrong :/
> 
> To be honest, I've missed that this is still polled. I've had this set to polled mode, as I've
> had some issues (were to dumb) to get the pinmux going. I'll switch this to interrupt triggered and report back.
> 
>>
>>> +        poll-interval = <100>;
>>> +
>>> +        pinctrl-names = "default";
>>> +        pinctrl-0 = <&button_pins>;
>>> +
>>> +        reset {
>>> +            label = "Reset Button";
>>> +            gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
>>> +            linux,code = <KEY_RESTART>;
>>> +            debounce-interval = <50>;
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&cpu0 {
>>> +    cpu-supply = <&vdd_arm>;
>>> +};
>>> +
>>> +&cpu1 {
>>> +    cpu-supply = <&vdd_arm>;
>>> +};
>>> +
>>> +&cpu2 {
>>> +    cpu-supply = <&vdd_arm>;
>>> +};
>>> +
>>> +&cpu3 {
>>> +    cpu-supply = <&vdd_arm>;
>>> +};
>>> +
>>> +&gmac2io {
>>> +    assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
>>> +    assigned-clock-parents = <&gmac_clkin>, <&gmac_clkin>;
>>> +    clock_in_out = "input";
>>> +    phy-supply = <&vcc_io>;
>>> +    phy-handle = <&rtl8211e>;
>>> +    phy-mode = "rgmii";
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&rgmiim1_pins>;
>>> +    snps,aal;
>>
>> Is this needed over and above the txpbl fix present in the main DTSI? I forget exactly where all those discussions ended up, but if it matters here then it probably matters for all RK3328 boards.
> 
> It seems to matter, as otherwise forwards from LAN to WAN will result in tx_fifo errors.

On second look it's already present in half the existing RK3328 DTs 
(including the one I wrote, ahem...), so probably does deserve promoting 
into the DTSI.

>>> +    snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
>>> +    snps,reset-active-low;
>>> +    snps,reset-delays-us = <0 10000 50000>;
>>
>> Since you're describing the phy already, you can convert these to generic reset specifiers on the phy node itself (shame we don't have an interrupt wired up, oh well...)
> 
> Yup, I've forgotten that there's reset-gpio bindings for the PHY itself.
> 
>>
>>> +    tx_delay = <0x24>;
>>> +    rx_delay = <0x18>;
>>> +    status = "okay";
>>> +
>>> +    mdio {
>>> +        compatible = "snps,dwmac-mdio";
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        rtl8211e: ethernet-phy@0 {
>>> +            reg = <0>;
>>
>> Is that right? The schematic says the phy is strapped for address 1 (although 0 probably does manage to work since it should be interpreted as a broadcast address).
> 
> I'll test this.
> 
>>
>>> +        };
>>> +    };
>>> +};
>>> +
>>> +&i2c1 {
>>> +    status = "okay";
>>> +
>>> +    rk805: rk805@18 {
>>> +        compatible = "rockchip,rk805";
>>> +        reg = <0x18>;
>>> +        interrupt-parent = <&gpio2>;
>>> +        interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
>>
>> The schematic says GPIO1_D0 for this.
> 
> You are right, I'll fix this.
> 
>>> +
>>
>> It shouldn't hurt to enable PWM2 from the outset to make mucking about with the fan easier.
> 
> I've seen reports of people having Fans on their NanoPi R2S, my unit does not have such

Yeah, mine came with the version 2 heatsink/fan fitted, although upon 
investigation it turns out the PWM is next to useless (something's off 
with rise times in the external MOSFET switching setup) and the fan 
connector may as well just be treated as GPIO-controlled anyway.

>>> +&sdmmc {
>>> +    bus-width = <4>;
>>> +    cap-mmc-highspeed;
>>> +    cap-sd-highspeed;
>>
>> How about UHS modes, since we have the requisite I/O voltage support?
> 
> I'll look into this.

FWIW SDR104 seems to be working fine for me, with the PMIC interrupt 
corrected so as not to break the regulator.

>>
>>> +    disable-wp;
>>
>> I believe this property is only meant for full-size MMC/SD sockets where write-protect functionality is expected but somehow broken. For micro-SD sockets the SoC pin should be hard-wired to write-enable anyway and thus it shouldn't need to be stated.
> 
> Thanks for this explanation, I'll remove and re-test.

Actually I think I was mistaken there - having double-checked the 
binding definition and datasheet it looks like RK3328 doesn't expose the 
WP function on any pin at all, so by the letter of the binding this 
*should* be specified for correctness (since we don't necessarily know 
for sure that the controller's internal WP line isn't left floating). 
Sorry for the confusion.

Cheers,
Robin.

>>
>>> +    max-frequency = <150000000>;
>>
>> This is in the DTSI already.
>>
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_dectn &sdmmc0_bus4>;
>>> +    vmmc-supply = <&vcc_sd>;
>>> +    vqmmc-supply = <&vcc_sdio>;
>>> +    status = "okay";
>>> +};
>>> +
>>> +&tsadc {
>>> +    rockchip,hw-tshut-mode = <0>;
>>> +    rockchip,hw-tshut-polarity = <0>;
>>> +    status = "okay";
>>> +};
>>> +
>>> +&uart2 {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&u2phy {
>>> +    status = "okay";
>>> +
>>> +    u2phy_host: host-port {
>>
>> Just reference this by label directly, rather than as a child node here (especially since redefining the existing label is a bit confusing).
>>
>>> +        status = "okay";
>>> +    };
>>> +};
>>
>> No reason not to enable the OTG port either - I've hacked that in with g_serial for a cheeky console while powering the board from my laptop and it works fine.
> 
> Ouch, I've completely missed the micro-USB port is wired up to the OTG port.
> 
> I'll follow up with a v3 in the coming days. Thanks for your feedback!
> 
> Best wishes
> David
> 
>>
>> Cheers,
>> Robin.
>>
>>> +
>>> +&usb_host0_ehci {
>>> +    status = "okay";
>>> +};
>>> +
>>> +&usb_host0_ohci {
>>> +    status = "okay";
>>> +};
>>>
> 
> 
