Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F366C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 19:24:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 395F820578
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 19:24:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uKs7GCMy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgHXTYa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 15:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgHXTYa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 15:24:30 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED59C061573
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 12:24:29 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 67so1956320pgd.12
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 12:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HMkWVe0iXOrTlUdElhDF/Jd0Uk3XK6+AlkAGoG6jsNM=;
        b=uKs7GCMymiDN9kgLmu4I6IlVkET7gFPKiTuLFvRjkq+/gjXWt2pz+CS2D89RyV/VyK
         qA4ueBbBlbBDhPS62dW4EaC51zTVYEW761CFjjpHkTlOt+9j6dfM13AjFFCro+D7JVW2
         zCKDuRD/UVlAtFKEtpT7lF+uM3/UEilgxcyzElkz7ZisKY+opa2scWRDgYEodNen3Hv2
         1CNcbOj7dRDWuLH+nSTd2Fjj74SL1WtiKUTTKozMF55nc3hhp99QZQRdoZWqwTQCt890
         Ybw73MiAq6mOVzmmDw+z5AFj2HabUqq7QAGpP2WWeu2nAx0BjtlEcUFT+mRouzI3hT6D
         5XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HMkWVe0iXOrTlUdElhDF/Jd0Uk3XK6+AlkAGoG6jsNM=;
        b=JKYAwXhiBe+Ep83r8iRFmZQ6dDnnRbgSYrC+BeA9nyL5ThHE42TFUyaWGX7hpjgQtL
         isoYN6EXMHkb/h3oD50+1a9+zaNxgW5e0JsSkTy1TmcGw79dbA6rUgQbSYNFjm5KbWpA
         Krw/vhXzvzhE2eC0a7BXPpNeaAe1vTFOWq8kZrQzrm7CywD5tZtXNk3gS1V+natxov0V
         CT15mhWk5PWvZydn1QrCr75V/a4k8goOUk7YrRlrO676JfsDZc+zuBvmEe8Azr9iM51Z
         CyZB5r8wS1DU5Q5WKVwRdoCcn+MIEUoaPa7Y+rz4nRvu2EKVD/TTBVd9DTyKvVAIK1dF
         5xeA==
X-Gm-Message-State: AOAM532YrrygG6xrdEArrjJ0T9I0tyK1kTebpQiTS7y98mFv/HOzyjYu
        TAomknbYPSYiCS0S5iXb0gU=
X-Google-Smtp-Source: ABdhPJzMopzfJf8C4nNwNZY5HTfsf47D3twm23MhTaFahOdOlQNjoyDercivWmB3mPyNUzOZVlFXIQ==
X-Received: by 2002:a62:5284:: with SMTP id g126mr5010372pfb.139.1598297068554;
        Mon, 24 Aug 2020 12:24:28 -0700 (PDT)
Received: from [10.67.50.75] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u123sm6878907pfb.209.2020.08.24.12.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 12:24:27 -0700 (PDT)
Subject: Re: Proper DT bindings for Broadcom's DMU node
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vivek Unune <npcomplete13@gmail.com>
Cc:     BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>
References: <7da2db8f-66d0-24ec-d3eb-84247b383a06@gmail.com>
 <ef6e208d-e74f-382b-953f-1f770ab12754@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <30fe8a8d-34a7-2138-a823-f508a8250039@gmail.com>
Date:   Mon, 24 Aug 2020 12:24:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ef6e208d-e74f-382b-953f-1f770ab12754@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 8/20/20 5:38 AM, Rafał Miłecki wrote:
> Hi Rob, could you help me/us with Northstar bindings design, please?
> 
> On 04.05.2020 17:24, Rafał Miłecki wrote:
>> I need some help with designing proper bindings for Broadcom's DMU
>> block. We already have it partially covered but it's inconsistent, some
>> cleanups were rejected and so I want to redesign it as it should be.
>>
>> DMU ("Device Management Unit") is a block that can be found on Broadcom
>> iProc / Northstar devices. On Northstar it's mapped at:
>> ranges = <0x1800c000 0x1000>
>>
>> It contains:
>> 1. Few random registers, some of them shared by various hardware
>>     blocks (and possibly hard to abstract?)
>> 2. At least one sub-block with even more random registers
>>
>> Some of known DMU registers are:
>> reg = <0x100 0x14>    CRU LCPLL control0
>> reg = <0x140 0x24>    CRU GENPLL
>> reg = <0x164 0x04>    CRU_USB2_CONTROL
>> reg = <0x180 0x04>    CRU_CLKSET_KEY
>> reg = <0x184 0x04>    CRU_RESET
>> reg = <0x1c0 0x24>    pinctrl
>> reg = <0x2a0 0x04>    CRU_STRAPS_CTRL
>> reg = <0x2c0 0x04>    PVTMON control0
>> (Broadcom never released a proper documentation)
>>
>>
>> As you can see there are a few CRU registers (depending on a source it's
>> a "Clock and Reset Unit" or "Central Resource Unit"). It's said to be
>> separated block and was described by Scott (from Broadcom) as: "unit
>> with a lot of random registers to perform various operations".
>>
>> As I said, there are also some shared registers:
>>
>> CRU_CLKSET_KEY is accessed by:
>> 1. USB 2.0 PHY driver for (un)locking DMU PLL settings
>> 2. GMAC for changing 2.66G line rate to 2Gbps
>>
>> CRU_STRAPS_CTRL needs to be accessed by:
>> 1. USB 3.0 PHY driver for PHY connected to MDIO
>> 2. PCIE driver for PHY connected to MDIO
>>
>>
>> My initial idea was to have something like:
>>
>> dmu@1800c000 {
>>      compatible = "simple-bus";
>>      ranges = <0 0x1800c000 0x1000>;
>>      #address-cells = <1>;
>>      #size-cells = <1>;
>>
>>      cru@100 {
>>          compatible = "simple-bus";
>>          reg = <0x100 0x1a4>;
>>
>>          lcpll { ... };
>>          genpll { ... };
>>          reset { ... };
>>      };
>> };
>>
>> but Rob noticed that "simple-bus" requires everything in DMU to have
>> sub-nodes [0] [1].
> 
> "simple-bus" apparently is a no-way as some single registers may need to
> be referenced using syscon.
> 
> 
>> I thought it can be solved by using compatible = "syscon", "simple-mfd"
>> and I even got one patch for that accepted [2] [3] (pinctrl). It seems
>> it slipped through and was possibly a mistake. Another similar patch was
>> rejected [4] [5] (bcm-ns-usb2-phy).
>>
>> What I tried to achieve was something like this:
>>
>> dmu@1800c000 {
>>      compatible = "simple-bus";
>>      ranges = <0 0x1800c000 0x1000>;
>>      #address-cells = <1>;
>>      #size-cells = <1>;
>>
>>      cru: syscon@100 {
>>          compatible = "syscon", "simple-mfd";

This should actually be a simple-bus no?

>>          reg = <0x100 0x1a4>;
>>          ranges;
>>          #address-cells = <1>;
>>          #size-cells = <1>;
>>
>>          lcpll0@0 {
>>              #clock-cells = <1>;
>>              compatible = "brcm,nsp-lcpll0";
>>              reg = <0x0 0x14>;
>>          };
>>
>>          genpll@40 {
>>              #clock-cells = <1>;
>>              compatible = "brcm,nsp-genpll";
>>              reg = <0x40 0x24>;
>>          };
>>
>>          pin-controller@c0 {
>>              compatible = "brcm,bcm4708-pinmux";
>>              reg = <0xc0 0x24>;
>>              reg-names = "cru_gpio_control";
>>          };
>>
>>          thermal@1c0 {
>>              compatible = "brcm,ns-thermal";
>>              reg = <0x1c0 0x10>;
>>              #thermal-sensor-cells = <0>;
>>          };
>>      };
>> };
>>
>> cru-reset@??? {
>>      compatible = "brcm,ns-cru-reset";
>>      syscon-cru = <&cru>; /* CRU_RESET */
>>      #reset-cells = <1>;
>> };
>>
>> usb2-phy@??? {
>>      compatible = "brcm,ns-usb2-phy";
>>      syscon-cru = <&cru>; /* CRU_CLKSET_KEY */
>>      #phy-cells = <0>;
>> };
>>
>> (apparently it wasn't a good idea)
> 
> Here I tried "syscon", "simple-mfd" which lets me:
> 1. Have subnodes for all small hardware subblocks
> 2. Reference single registers using syscon
> but it appears I can't mix those two.

It does not seem to me that there is an use case for syscon except for
the USB2 PHY PLL which should arguably be a clock provider and the "DMP"
register base used by the USB 3.0 PHY which should be a reset provider.
-- 
Florian
