Return-Path: <SRS0=vtql=4W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E1CC3F2D2
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 18:03:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04BD720870
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Mar 2020 18:03:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LjBCkZcy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgCESDj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Mar 2020 13:03:39 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34260 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgCESDi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Mar 2020 13:03:38 -0500
Received: by mail-wr1-f66.google.com with SMTP id z15so8182815wrl.1
        for <devicetree@vger.kernel.org>; Thu, 05 Mar 2020 10:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pacc1BawiG1/tj/EUN5oeT6l0SNiwMc2r5gM58s+hZU=;
        b=LjBCkZcySsVoxO+Ds1fzPM7qKl+m2oV1Wh+N2BfAVERHnTp6L8gT8PRW+QtaOlot4W
         DRnIzO10s/Bnbvjgdnay3OyeVuIqq6FcBm0lR7InFUaCyRO3KOrelt+ZPvLLpiJT3nsl
         oxQzZivGQBLvG+rEDRLiVHGMdXfSQTVciVLzCoLI1CIiRlWJRCve0bdO08hx+rbeUY0Z
         /fVCtR0Y0jvAJIJF0t+NKBhYzpL02zEgDeEpgEinmdnGFXhlwkcIDTmsIL2QjkTW2FLQ
         4BOmcLobWPkfG4EQW5eVt95UBaNlXidQtIonoPyfD8dXnOfQOjJA0lSCJCfwrI4zs5kh
         W5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pacc1BawiG1/tj/EUN5oeT6l0SNiwMc2r5gM58s+hZU=;
        b=Z4BfMysEA2PrmipR6IN7E02mGpYNjkSvUis0RYCnmdckDePPkTUqeoEk0ohLSAkg4L
         d565RsMZIXX3/b9XqZaiQEyvluORpEHyC7OA91Zp8DzHH8FYN0DYQs3DDlz8/Dj4lXvP
         qdO0vM5N2qywijqaC3fIHk6SGY6ELyOf1CA8vEm9BztDo4VRmjasVJCLH/shFBBmi3br
         C7N7n3n0lxe2DaNlMw1whaI9tAEV0cJNPzY3CFgxL44JzmP/0GICRekWjSKQeZKOauqA
         1r9TfkDYoVXlcWE51Cu3tflXgx9eCcE1TrQTzoov/cBF54jDkZ9kMLe7+/2hL86RemXK
         HT7g==
X-Gm-Message-State: ANhLgQ2gCfC0fWkokJTotj+o+se/z6uYZAiEGngV5HK3jPFjSJ+Xrsm6
        w0RZq+wF2FN8JKCQydP57dllWg==
X-Google-Smtp-Source: ADFU+vu10KPusAe5Mf1WcFCd23uu2DAWXK+sSy/qjCqr3KZsnMeAAFyJ7+ymA3ZM7QrCnwiThjF4dg==
X-Received: by 2002:adf:c445:: with SMTP id a5mr173997wrg.14.1583431415813;
        Thu, 05 Mar 2020 10:03:35 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id s22sm9668587wmc.16.2020.03.05.10.03.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 10:03:34 -0800 (PST)
Subject: Re: [PATCH v8 0/7] MIPS: CI20: Add efuse driver for Ingenic JZ4780
 and attach to DM9000 for stable MAC addresses
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
References: <cover.1582905653.git.hns@goldelico.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e0122cd8-4346-8ae9-44e6-451f5e1e5469@linaro.org>
Date:   Thu, 5 Mar 2020 18:03:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1582905653.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org



On 28/02/2020 16:00, H. Nikolaus Schaller wrote:
> * fix a compiler warning/error (reported by Paul Cercueil <paul@crapouillou.net>)
> * remove clock-names from properties (suggested by Paul Cercueil <paul@crapouillou.net>)
> 
> PATCH V7 2020-02-28 14:58:30:
> * use devm_add_action_or_reset to unprepare clock in case of error (suggested by Paul Cercueil <paul@crapouillou.net>)
> * use already existing constants to check for overflow of rd_adj and rd_strobe
> * remove clock-names from bindings example and DTS (suggested by Paul Cercueil <paul@crapouillou.net>)
> * addition for nemc driver to handle this correctly (contributed by Paul Cercueil <paul@crapouillou.net>)
> * make efuse a child node of nemc to avoid problems with overlapping
>    reg address ranges (suggested by Paul Cercueil <paul@crapouillou.net>)
> 
> PATCH V6 2020-02-26 12:16:07:
> * add dependency on CONFIG_OF and select REGMAP_MMIO (suggested by Paul Cercueil <paul@crapouillou.net>)
> * add clk_prepare_enable() (suggested by Paul Cercueil <paul@crapouillou.net>)
> * inline jz4780_efuse_read_32bytes() since it is only used once
> * remove read optimization for full block (suggested by Paul Cercueil <paul@crapouillou.net>)
> * simplify calculations for rd_adj and rd_strobe (suggested by Paul Cercueil <paul@crapouillou.net>)
> * do calculations for rd_adj and rd_strobe in local variables
> * fix overflow check (did allow for 5 bit values although register is 4 bit wide)
> * fixes for yaml (sugested by Andreas Kemnade <andreas@kemnade.info>)
> 
> PATCH V5 2020-02-22 11:25:35:
> * no longer RFC but PATCH
> * add yaml bindings (by Andreas Kemnade <andreas@kemnade.info>)
> * fixes to yaml (suggested by Rob Herring <robh@kernel.org>)
> 
> RFC V4 2020-02-17 17:55:35:
> * removed read_only for nvmem config because there is no write method
> * Kconfig: replaced depends MACH_JZ4780 with MACH_INGENIC
> * run through checkpatch and fixed issues
> * made use of devm_nvram_register() and get rid of jz4780_efuse_remove()
>    (suggested by Srinivas Kandagatla <srinivas.kandagatla@linaro.org>)
> * squashed previous patch 1/9 and 2/9 into single (regmap based) driver
> 
> RFC V3 2020-02-16 20:20:59:
> 
> This series is based on and a follow up for
> 
> https://lore.kernel.org/patchwork/cover/868157/
> 
> ("[v2,0/2] Add efuse driver for Ingenic JZ4780 SoC")
> 
> Original authors were
> PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Mathieu Malaterre <malat@debian.org>
> 
> and there are additions / code improvements by
> H. Nikolaus Schaller <hns@goldelico.com>
> Paul Cercueil <paul@crapouillou.net>
> 
> This setup works, if the dm9000 driver is compiled
> as a module.
> 
> Therefore it is all RFC level. It is also not completely
> checkpatched.
> 
> 
> H. Nikolaus Schaller (1):
>    MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the
>      default MAC address
> 
> Paul Cercueil (1):
>    memory: jz4780_nemc: Only request IO memory the driver will use
> 
> PrasannaKumar Muralidharan (5):
>    nvmem: add driver for JZ4780 efuse
>    Bindings: nvmem: add bindings for JZ4780 efuse
>    Documentation: ABI: nvmem: add documentation for JZ4780 efuse ABI
>    nvmem: MAINTAINERS: add maintainer for JZ4780 efuse driver
>    MIPS: DTS: JZ4780: define node for JZ4780 efuse
> 
>   .../ABI/testing/sysfs-driver-jz4780-efuse     |  16 ++
>   .../bindings/nvmem/ingenic,jz4780-efuse.yaml  |  45 ++++
>   MAINTAINERS                                   |   5 +
>   arch/mips/boot/dts/ingenic/ci20.dts           |   3 +
>   arch/mips/boot/dts/ingenic/jz4780.dtsi        |  19 +-
>   drivers/memory/jz4780-nemc.c                  |  15 +-
>   drivers/nvmem/Kconfig                         |  12 +
>   drivers/nvmem/Makefile                        |   2 +
>   drivers/nvmem/jz4780-efuse.c                  | 239 ++++++++++++++++++
>   9 files changed, 353 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
>   create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>   create mode 100644 drivers/nvmem/jz4780-efuse.c
> 
I have applied Patch 2/7, 3/7, 4/7 with are nvmem subsystem related, 
other patches have to go via respective maintainer tree.

--srini
