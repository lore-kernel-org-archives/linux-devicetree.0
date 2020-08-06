Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5D0C38146
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:04:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B089A22D00
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgHFG5Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 02:57:16 -0400
Received: from mars.blocktrron.ovh ([51.254.112.43]:53536 "EHLO
        mail.blocktrron.ovh" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbgHFG5P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 02:57:15 -0400
Received: from [IPv6:2001:678:6e3:1040:4613:faa3:b901:e91f] (unknown [IPv6:2001:678:6e3:1040:4613:faa3:b901:e91f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.blocktrron.ovh (Postfix) with ESMTPSA id 920CA23BC0;
        Thu,  6 Aug 2020 08:57:04 +0200 (CEST)
From:   David Bauer <mail@david-bauer.net>
Subject: Re: [PATCH v2 2/2] rockchip: rk3328: Add support for FriendlyARM
 NanoPi R2S
To:     Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
References: <20200730232054.286381-1-mail@david-bauer.net>
 <20200730232054.286381-2-mail@david-bauer.net>
 <d0053630-1ff3-9771-eb7d-7aaf0a27dca2@arm.com>
Autocrypt: addr=mail@david-bauer.net; prefer-encrypt=mutual; keydata=
 mQENBFYkGEcBCADbRMHdOXmszxrmE9G/gWUD4/HXklOfn+hyBpEcOul+GKAet0oFxznkchJe
 hO5MbEFYsnM8TZVxjnEi70c3luF1m4JycjgQ91GJ52+xvLV0dVz+L99JBgVJNRDvvt68rLVq
 A8/LCdkXctZ+GBfrtTYQ6dOeuQf/qWuwlNTvuG92uWVZjncyWOmQX73gv+1MTRsCmIGNYQu1
 ZDVyhr3YsTgJIXTHUCxBHQBDglkb3L5lK9WHPf1puQ2grNbUg9VSmo4a9IzUpRauNtCDUFxi
 1m1e5VnmU5O5/xZyDzwmpWog9tUfScS7X9pdVNQ+2W3zCRrotFEn6FKdD01mhIsLnczjABEB
 AAG0IkRhdmlkIEJhdWVyIDxtYWlsQGRhdmlkLWJhdWVyLm5ldD6JAVkEEwEIAEMCGwMHCwkI
 BwMCAQYVCAIJCgsEFgIDAQIeAQIXgAIZARYhBNcEMml7fEwnOA/No7qzlxS0pLh4BQJfJtbx
 BQkOplkqAAoJELqzlxS0pLh4DVsIAKedmfQNTTWPlLDni4TUqTDUC1XFsMuE0XUg+naVs10K
 35FpmZwzFzZYwPa1BYso3kE4EtuisFm6MsDkNhPrkL2fXMFONevSW1R9yYVH2BHZk9DkySjy
 4vTsztjCFnkgQSs8GPKOy/upXt9ZYHNAUMqdwyjF1x8bhXP+dBpvL/0mLckZyVBZ06wgKdFc
 kjgEKAhRrfIaWYDa7hqFTts5C+NEd2MZsqRzry87TmCwKzy4HIpDyc52BUINj5QjRZu14IG/
 x+9zyh7ItDRMGxeRP+TU0HKrhUL9ToGRGwVKxybY10DQiXktIBOUFy6QboK8QOKMrxtmQ31j
 3Zz+N0Ace2y5AQ0EViQYRwEIALqz1V6kWIvCTVN/6QN9fepVSwSw+5IiiVBGtf2rtdqujCRD
 bGi96a2ZLYRQzlSQvCZ51skgoZFmIW2YhPP90qiZssSEQxgY1rf+DEYnjWmFSgi3iHqYXRk2
 cY7OI3ZT8D2tAFu9pIAxZpD5FdQznJmUhljeTJw+lGOoxctf1xjHZcRcU6GUFMpFBc4xaLC0
 hUN24HT5pDpklxskPFH91VncDaOsLesqszGaUHWx3hogRfogdADvycUp/bQB80kZO/XqexWN
 GUNJYS4axWM2ND25bWV1h9aFjPpOwFM7FwAyra0VihnnNn7dTL5vBpFztY0IFPlvqyc1Vw8y
 vgtShA0AEQEAAYkBPAQYAQgAJgIbDBYhBNcEMml7fEwnOA/No7qzlxS0pLh4BQJfJtYyBQkO
 plhrAAoJELqzlxS0pLh4skYIAKFHNWPI9nFDbM4Caoy6unnAF0z9Se2YHfySyfwqfM3AYWku
 V5fxURhFZwsSmU9EuE4xgYbJsCI++BG70mRzpzjuA0lXpl2Ql3WtP2ocEBvsf0Tx+uFH9DYE
 USIr/M9shLswNr4uh8ZCbrH/ag01ZzdHISdicv1A8UlVFzwtFxaYjk+iJrhfE+J16bqepccp
 SsstQIZnGGL+pJRYYnM3bR+eAIefsUX+kyS6/+SxVzeZ1nSGGErKQpcRid0Iny7pUJNM0pPT
 yp74AEsXeEnwARddTIQi4Qy6UsgPr0ARkfx+oEIu+m3qXfeBAIyzykDAnjX7G6yb2ZiBsCBy
 xYmCdlk=
Message-ID: <685c3ab2-5f51-1fc2-622d-4d9785d7074b@david-bauer.net>
Date:   Thu, 6 Aug 2020 08:57:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0053630-1ff3-9771-eb7d-7aaf0a27dca2@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Robin,

thanks for your review. Only adressing some non-formal comments below.

On 8/3/20 12:01 AM, Robin Murphy wrote:
> 
> This seems to match the schematic, however in practice the GPIO seems to have a mind of its own and not respond to the LED settings - are we missing something with the pinctrl perhaps?

Hmm, this is strange. It works fine on my unit (with the current OpenWrt release). Can you test this and report back?

> 
>> +            label = "nanopi-r2s:green:lan";
>> +        };
>> +
>> +        wan {
>> +            gpios = <&gpio2 RK_PC2 GPIO_ACTIVE_HIGH>;
>> +            label = "nanopi-r2s:green:wan";
>> +        };
>> +    };
>> +
>> +    gpio_keys {
>> +        compatible = "gpio-keys-polled";
> 
> Does this need to be polled? I would have thought regular interrupt-based gpio-keys should work, to avoid the overhead of polling for something (relatively) incredibly rare, but perhaps I'm wrong :/

To be honest, I've missed that this is still polled. I've had this set to polled mode, as I've
had some issues (were to dumb) to get the pinmux going. I'll switch this to interrupt triggered and report back.

> 
>> +        poll-interval = <100>;
>> +
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&button_pins>;
>> +
>> +        reset {
>> +            label = "Reset Button";
>> +            gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
>> +            linux,code = <KEY_RESTART>;
>> +            debounce-interval = <50>;
>> +        };
>> +    };
>> +};
>> +
>> +&cpu0 {
>> +    cpu-supply = <&vdd_arm>;
>> +};
>> +
>> +&cpu1 {
>> +    cpu-supply = <&vdd_arm>;
>> +};
>> +
>> +&cpu2 {
>> +    cpu-supply = <&vdd_arm>;
>> +};
>> +
>> +&cpu3 {
>> +    cpu-supply = <&vdd_arm>;
>> +};
>> +
>> +&gmac2io {
>> +    assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
>> +    assigned-clock-parents = <&gmac_clkin>, <&gmac_clkin>;
>> +    clock_in_out = "input";
>> +    phy-supply = <&vcc_io>;
>> +    phy-handle = <&rtl8211e>;
>> +    phy-mode = "rgmii";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&rgmiim1_pins>;
>> +    snps,aal;
> 
> Is this needed over and above the txpbl fix present in the main DTSI? I forget exactly where all those discussions ended up, but if it matters here then it probably matters for all RK3328 boards.

It seems to matter, as otherwise forwards from LAN to WAN will result in tx_fifo errors.

> 
>> +    snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
>> +    snps,reset-active-low;
>> +    snps,reset-delays-us = <0 10000 50000>;
> 
> Since you're describing the phy already, you can convert these to generic reset specifiers on the phy node itself (shame we don't have an interrupt wired up, oh well...)

Yup, I've forgotten that there's reset-gpio bindings for the PHY itself. 

> 
>> +    tx_delay = <0x24>;
>> +    rx_delay = <0x18>;
>> +    status = "okay";
>> +
>> +    mdio {
>> +        compatible = "snps,dwmac-mdio";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        rtl8211e: ethernet-phy@0 {
>> +            reg = <0>;
> 
> Is that right? The schematic says the phy is strapped for address 1 (although 0 probably does manage to work since it should be interpreted as a broadcast address).

I'll test this.

> 
>> +        };
>> +    };
>> +};
>> +
>> +&i2c1 {
>> +    status = "okay";
>> +
>> +    rk805: rk805@18 {
>> +        compatible = "rockchip,rk805";
>> +        reg = <0x18>;
>> +        interrupt-parent = <&gpio2>;
>> +        interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
> 
> The schematic says GPIO1_D0 for this.

You are right, I'll fix this.

>> +
> 
> It shouldn't hurt to enable PWM2 from the outset to make mucking about with the fan easier.

I've seen reports of people having Fans on their NanoPi R2S, my unit does not have such 

> 
>> +&sdmmc {
>> +    bus-width = <4>;
>> +    cap-mmc-highspeed;
>> +    cap-sd-highspeed;
> 
> How about UHS modes, since we have the requisite I/O voltage support?

I'll look into this.

> 
>> +    disable-wp;
> 
> I believe this property is only meant for full-size MMC/SD sockets where write-protect functionality is expected but somehow broken. For micro-SD sockets the SoC pin should be hard-wired to write-enable anyway and thus it shouldn't need to be stated.

Thanks for this explanation, I'll remove and re-test.

> 
>> +    max-frequency = <150000000>;
> 
> This is in the DTSI already.
> 
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_dectn &sdmmc0_bus4>;
>> +    vmmc-supply = <&vcc_sd>;
>> +    vqmmc-supply = <&vcc_sdio>;
>> +    status = "okay";
>> +};
>> +
>> +&tsadc {
>> +    rockchip,hw-tshut-mode = <0>;
>> +    rockchip,hw-tshut-polarity = <0>;
>> +    status = "okay";
>> +};
>> +
>> +&uart2 {
>> +    status = "okay";
>> +};
>> +
>> +&u2phy {
>> +    status = "okay";
>> +
>> +    u2phy_host: host-port {
> 
> Just reference this by label directly, rather than as a child node here (especially since redefining the existing label is a bit confusing).
> 
>> +        status = "okay";
>> +    };
>> +};
> 
> No reason not to enable the OTG port either - I've hacked that in with g_serial for a cheeky console while powering the board from my laptop and it works fine.

Ouch, I've completely missed the micro-USB port is wired up to the OTG port.

I'll follow up with a v3 in the coming days. Thanks for your feedback!

Best wishes
David

> 
> Cheers,
> Robin.
> 
>> +
>> +&usb_host0_ehci {
>> +    status = "okay";
>> +};
>> +
>> +&usb_host0_ohci {
>> +    status = "okay";
>> +};
>>


