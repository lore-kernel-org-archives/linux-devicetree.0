Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D11C10DCE
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 00:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1859222D9
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 00:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tk4R9joY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgCKAZx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 20:25:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39936 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbgCKAZx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 20:25:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id 19so309940ljj.7;
        Tue, 10 Mar 2020 17:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t3Ky3qCEUdrJfOedcPuL/BpKy3lmiK+jdAKVMPuMJK8=;
        b=tk4R9joYqGAUiaX3wTuehJ9y9j5Ieegddvc4VAGIFU+YYuREOUNdBE0vBPslsDBcjx
         m5OYKaXcAfbtvUBTBBTm+ks85pEW9eebbdGAMVtf9jJCjhYZCHbcyXfWgS/5A4rPj9xn
         f66KnV7TNnj8YszUsWUofktnm4EumccamP4G3F0BN2GLDEAG3c/37wIkb+7B9gSrC+Mp
         noG+7uUPeMCciCgAEVIS4dbqq+4EK9JGtKwqNaDMaSQ3k6lCKKy30N+rtMwiT4O2Bg7k
         LJQiyqeDWhaFNhxMIjiXo4EhOjc+g4WUSH+mWhWLTQrrwzqw8v3cHPXSW8n/F36HE8aa
         8hcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t3Ky3qCEUdrJfOedcPuL/BpKy3lmiK+jdAKVMPuMJK8=;
        b=Mhb1ZtdB2ol14CdEOBjWbCX9y246pYiRm80ZEv4lWcokPjmhneQaQYG9kCF/AljZOc
         8EosBzZIYJQ/ObuLldsuvCITi3U94a53HY/ZPo5Jwz/vbHSWK8CZML+dGxm8oJC+8IbB
         Y8IBxvD3XS/JTo/Ejz+DQ7sONu3a3T+vwMCOflr6Sq7Cj3bN3GfTJPGnC/CiJd2PvAzT
         os4nFvgOaIUY7nectmsMKWOZYSzwuD9Kzh3nhQULUGjsaCmJv9a9hCBPXNSf253uCvWv
         yo3NquC40ANb7LvJgbhL0mL0e6nqf86KxlCatk/qed9gqKRaCw41LXgEp41XC019Q08A
         b5ng==
X-Gm-Message-State: ANhLgQ0WMGcHGLMofQVFv4xKU6027ogPu9o4h2/Y0C8BAdAzsvttmWVr
        CJrxF5Ka1/vFDw3/nr4fhFg=
X-Google-Smtp-Source: ADFU+vtJb0j7MalqOt+Z3WwOaodj9H9IYdfhO6LBUh7bBXVYdciVxamfoWd9b8sUn8ri29DON2hAlQ==
X-Received: by 2002:a2e:8e6f:: with SMTP id t15mr450294ljk.132.1583886349997;
        Tue, 10 Mar 2020 17:25:49 -0700 (PDT)
Received: from [192.168.2.145] (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.googlemail.com with ESMTPSA id y24sm28680496lfg.63.2020.03.10.17.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2020 17:25:49 -0700 (PDT)
Subject: Re: [PATCH v5 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-6-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <72fdd9f9-6100-d413-aae6-4c05922d7571@gmail.com>
Date:   Wed, 11 Mar 2020 03:25:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310152003.2945170-6-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

10.03.2020 18:20, Thierry Reding пишет:
> From: Joseph Lo <josephl@nvidia.com>
> 
> This is the initial patch for Tegra210 EMC frequency scaling. It has the
> code to program various aspects of the EMC that are standardized, but it
> does not yet include the specific programming sequence needed for clock
> scaling.
> 
> The driver is designed to support LPDDR4 SDRAM. Devices that use LPDDR4
> need to perform training of the RAM before it can be used. Firmware will
> perform this training during early boot and pass a table of supported
> frequencies to the kernel via device tree.
> 
> For the frequencies above 800 MHz, periodic retraining is needed to
> compensate for changes in timing. This periodic training will have to be
> performed until the frequency drops back to or below 800 MHz.
> 
> This driver provides helpers used during this runtime retraining that
> will be used by the sequence specific code in a follow-up patch.
> 
> Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - major rework and cleanup
> 
...

>  #include "mc.h"
>  
> +#define DVFS_FGCG_HIGH_SPEED_THRESHOLD				1000
> +#define IOBRICK_DCC_THRESHOLD					2400
> +#define DVFS_FGCG_MID_SPEED_THRESHOLD				600
> +
> +#define EMC_STATUS_UPDATE_TIMEOUT				1000
> +
> +#define MC_EMEM_ADR_CFG						0x54
> +#define MC_EMEM_ARB_CFG						0x90
> +#define MC_EMEM_ARB_OUTSTANDING_REQ				0x94
> +#define MC_EMEM_ARB_TIMING_RCD					0x98
> +#define MC_EMEM_ARB_TIMING_RP					0x9c
> +#define MC_EMEM_ARB_TIMING_RC					0xa0
> +#define MC_EMEM_ARB_TIMING_RAS					0xa4
> +#define MC_EMEM_ARB_TIMING_FAW					0xa8
> +#define MC_EMEM_ARB_TIMING_RRD					0xac
> +#define MC_EMEM_ARB_TIMING_RAP2PRE				0xb0
> +#define MC_EMEM_ARB_TIMING_WAP2PRE				0xb4
> +#define MC_EMEM_ARB_TIMING_R2R					0xb8
> +#define MC_EMEM_ARB_TIMING_W2W					0xbc
> +#define MC_EMEM_ARB_TIMING_R2W					0xc0
> +#define MC_EMEM_ARB_TIMING_W2R					0xc4
> +#define MC_EMEM_ARB_MISC2					0xc8
> +#define MC_EMEM_ARB_DA_TURNS					0xd0
> +#define MC_EMEM_ARB_DA_COVERS					0xd4
> +#define MC_EMEM_ARB_MISC0					0xd8
> +#define MC_EMEM_ARB_MISC1					0xdc
> +#define MC_EMEM_ARB_RING1_THROTTLE				0xe0

All these registers are already defined in mc.h, please don't re-define
them.

> +#define MC_LATENCY_ALLOWANCE_AVPC_0				0x2e4
> +#define MC_LATENCY_ALLOWANCE_HC_0				0x310
> +#define MC_LATENCY_ALLOWANCE_HC_1				0x314
> +#define MC_LATENCY_ALLOWANCE_MPCORE_0				0x320
> +#define MC_LATENCY_ALLOWANCE_NVENC_0				0x328
> +#define MC_LATENCY_ALLOWANCE_PPCS_0				0x344
> +#define MC_LATENCY_ALLOWANCE_PPCS_1				0x348
> +#define MC_LATENCY_ALLOWANCE_ISP2_0				0x370
> +#define MC_LATENCY_ALLOWANCE_ISP2_1				0x374
> +#define MC_LATENCY_ALLOWANCE_XUSB_0				0x37c
> +#define MC_LATENCY_ALLOWANCE_XUSB_1				0x380
> +#define MC_LATENCY_ALLOWANCE_TSEC_0				0x390
> +#define MC_LATENCY_ALLOWANCE_VIC_0				0x394
> +#define MC_LATENCY_ALLOWANCE_VI2_0				0x398
> +#define MC_LATENCY_ALLOWANCE_GPU_0				0x3ac
> +#define MC_LATENCY_ALLOWANCE_SDMMCA_0				0x3b8
> +#define MC_LATENCY_ALLOWANCE_SDMMCAA_0				0x3bc
> +#define MC_LATENCY_ALLOWANCE_SDMMC_0				0x3c0
> +#define MC_LATENCY_ALLOWANCE_SDMMCAB_0				0x3c4
> +#define MC_LATENCY_ALLOWANCE_GPU2_0				0x3e8
> +#define MC_LATENCY_ALLOWANCE_NVDEC_0				0x3d8
> +#define MC_MLL_MPCORER_PTSA_RATE				0x44c
> +#define MC_FTOP_PTSA_RATE					0x50c
> +#define MC_EMEM_ARB_TIMING_RFCPB				0x6c0
> +#define MC_EMEM_ARB_TIMING_CCDMW				0x6c4
> +#define MC_EMEM_ARB_REFPB_HP_CTRL				0x6f0
> +#define MC_EMEM_ARB_REFPB_BANK_CTRL				0x6f4
> +#define MC_PTSA_GRANT_DECREMENT					0x960
> +#define MC_EMEM_ARB_DHYST_CTRL					0xbcc
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0			0xbd0
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1			0xbd4
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2			0xbd8
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3			0xbdc
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4			0xbe0
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5			0xbe4
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6			0xbe8
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7			0xbec...

Secondly, looks like it all is unused, hence just remove it.
