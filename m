Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16642C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 12:38:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA188207DE
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 12:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8vlsSme"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729105AbgHTMiZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 08:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729549AbgHTMiS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 08:38:18 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD486C061385
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 05:38:15 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id j22so856658lfm.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/7XnOncViWciMSMHdC32gmjZ89ebFtZjOtpQqjYWCRg=;
        b=o8vlsSme4uBPDp3l0bkE0rInTn4tnLWlSstESeOQivoaoAwYm1iDyxrg6c4dCpGRO7
         Gv19ZIC3petRy7d9lh3gVQQLfxVrJS6V6dGWI8kPdsFlos7v+WLI0+GQki5kDK9K2rUC
         jU0ULWrmrTg4lnBd2uLzxcNsGbSCFX9IeawTgmri+AZOQ89Ma/vEZKPtqYhDBrE6S4xp
         vkPfnZN1u8WHbC7nTxEdkr4bPYgOV71Kly2behwDgmVPUjnuZ3pqxN3tnEiP9IwG8HmN
         UQwdE2ll7VdC9NEE55gue+0h95Y+ZQfUrosm/RG9+274lg95LD0yUcKf1lEhOklK8hjy
         wYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/7XnOncViWciMSMHdC32gmjZ89ebFtZjOtpQqjYWCRg=;
        b=VbLzh/hTAt+nv3iMzACYrWVHaOfw8rXeYS7vBgEAsb++9/VhtCistkq9/EymXMY5n3
         6yg5JfYncPo0opi3yeUEKLp1zIDBnQ6pkTjF2gopMggFW/GqyackwJKsdddRtuGCCjC8
         T05wmkHlqgcOzMS2altTF+gbOPb/w2e0ApXdxM5WrIFNhDD5aGy91psn1FnOPz9eSSwU
         e/QnRIoPi73GSXXhfJGlR136dcN4Pacy+2Rnk4JLWw0+89BYo2w4IdC59xTpQUbcFN6C
         LrW/G7B2WK47Lkj00TO7EMKIwk3U19veJiThsmBuO2cmYebX9vvjLGxhrMTWR4fJeGmq
         vq5Q==
X-Gm-Message-State: AOAM530yBRgWn0fBilEDIEQj82l65AJXhtKmz26WV/tzXTg5J8UBS93r
        HN3NhV4+YXew+BAMgI7ezzxFfLwIvuI=
X-Google-Smtp-Source: ABdhPJyZtE/1GOAYEgSY9o0Nljw0ydQ+2pPsTNubAB44qkPnZ592MXdTphQc8Tv/21nZLLgczbGqbQ==
X-Received: by 2002:ac2:5f48:: with SMTP id 8mr1526595lfz.157.1597927092302;
        Thu, 20 Aug 2020 05:38:12 -0700 (PDT)
Received: from elitebook.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id 80sm431577ljf.38.2020.08.20.05.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 05:38:11 -0700 (PDT)
Subject: Re: Proper DT bindings for Broadcom's DMU node
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vivek Unune <npcomplete13@gmail.com>
Cc:     BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>
References: <7da2db8f-66d0-24ec-d3eb-84247b383a06@gmail.com>
Message-ID: <ef6e208d-e74f-382b-953f-1f770ab12754@gmail.com>
Date:   Thu, 20 Aug 2020 14:38:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7da2db8f-66d0-24ec-d3eb-84247b383a06@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob, could you help me/us with Northstar bindings design, please?

On 04.05.2020 17:24, Rafał Miłecki wrote:
> I need some help with designing proper bindings for Broadcom's DMU
> block. We already have it partially covered but it's inconsistent, some
> cleanups were rejected and so I want to redesign it as it should be.
> 
> DMU ("Device Management Unit") is a block that can be found on Broadcom
> iProc / Northstar devices. On Northstar it's mapped at:
> ranges = <0x1800c000 0x1000>
> 
> It contains:
> 1. Few random registers, some of them shared by various hardware
>     blocks (and possibly hard to abstract?)
> 2. At least one sub-block with even more random registers
> 
> Some of known DMU registers are:
> reg = <0x100 0x14>    CRU LCPLL control0
> reg = <0x140 0x24>    CRU GENPLL
> reg = <0x164 0x04>    CRU_USB2_CONTROL
> reg = <0x180 0x04>    CRU_CLKSET_KEY
> reg = <0x184 0x04>    CRU_RESET
> reg = <0x1c0 0x24>    pinctrl
> reg = <0x2a0 0x04>    CRU_STRAPS_CTRL
> reg = <0x2c0 0x04>    PVTMON control0
> (Broadcom never released a proper documentation)
> 
> 
> As you can see there are a few CRU registers (depending on a source it's
> a "Clock and Reset Unit" or "Central Resource Unit"). It's said to be
> separated block and was described by Scott (from Broadcom) as: "unit
> with a lot of random registers to perform various operations".
> 
> As I said, there are also some shared registers:
> 
> CRU_CLKSET_KEY is accessed by:
> 1. USB 2.0 PHY driver for (un)locking DMU PLL settings
> 2. GMAC for changing 2.66G line rate to 2Gbps
> 
> CRU_STRAPS_CTRL needs to be accessed by:
> 1. USB 3.0 PHY driver for PHY connected to MDIO
> 2. PCIE driver for PHY connected to MDIO
> 
> 
> My initial idea was to have something like:
> 
> dmu@1800c000 {
>      compatible = "simple-bus";
>      ranges = <0 0x1800c000 0x1000>;
>      #address-cells = <1>;
>      #size-cells = <1>;
> 
>      cru@100 {
>          compatible = "simple-bus";
>          reg = <0x100 0x1a4>;
> 
>          lcpll { ... };
>          genpll { ... };
>          reset { ... };
>      };
> };
> 
> but Rob noticed that "simple-bus" requires everything in DMU to have
> sub-nodes [0] [1].

"simple-bus" apparently is a no-way as some single registers may need to
be referenced using syscon.


> I thought it can be solved by using compatible = "syscon", "simple-mfd"
> and I even got one patch for that accepted [2] [3] (pinctrl). It seems
> it slipped through and was possibly a mistake. Another similar patch was
> rejected [4] [5] (bcm-ns-usb2-phy).
> 
> What I tried to achieve was something like this:
> 
> dmu@1800c000 {
>      compatible = "simple-bus";
>      ranges = <0 0x1800c000 0x1000>;
>      #address-cells = <1>;
>      #size-cells = <1>;
> 
>      cru: syscon@100 {
>          compatible = "syscon", "simple-mfd";
>          reg = <0x100 0x1a4>;
>          ranges;
>          #address-cells = <1>;
>          #size-cells = <1>;
> 
>          lcpll0@0 {
>              #clock-cells = <1>;
>              compatible = "brcm,nsp-lcpll0";
>              reg = <0x0 0x14>;
>          };
> 
>          genpll@40 {
>              #clock-cells = <1>;
>              compatible = "brcm,nsp-genpll";
>              reg = <0x40 0x24>;
>          };
> 
>          pin-controller@c0 {
>              compatible = "brcm,bcm4708-pinmux";
>              reg = <0xc0 0x24>;
>              reg-names = "cru_gpio_control";
>          };
> 
>          thermal@1c0 {
>              compatible = "brcm,ns-thermal";
>              reg = <0x1c0 0x10>;
>              #thermal-sensor-cells = <0>;
>          };
>      };
> };
> 
> cru-reset@??? {
>      compatible = "brcm,ns-cru-reset";
>      syscon-cru = <&cru>; /* CRU_RESET */
>      #reset-cells = <1>;
> };
> 
> usb2-phy@??? {
>      compatible = "brcm,ns-usb2-phy";
>      syscon-cru = <&cru>; /* CRU_CLKSET_KEY */
>      #phy-cells = <0>;
> };
> 
> (apparently it wasn't a good idea)

Here I tried "syscon", "simple-mfd" which lets me:
1. Have subnodes for all small hardware subblocks
2. Reference single registers using syscon
but it appears I can't mix those two.


> So my question is: how to properly handle this? I'm not sure what's the
> proper "compatible" string to use. Is my idea of:
> 1. Using sub-node for registers explicitly used by one driver
> 2. Using syscon for shared registers
> OK?
> 
> 
> [0] https://www.spinics.net/lists/arm-kernel/msg682838.html
> [1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20181015093013.31651-1-zajec5@gmail.com/
> [2] https://spinics.net/lists/linux-gpio/msg35285.html
> [3] https://patchwork.kernel.org/patch/10735931/
> [4] https://lkml.org/lkml/2019/1/15/913
> [5] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20190108123907.19816-1-zajec5@gmail.com/
