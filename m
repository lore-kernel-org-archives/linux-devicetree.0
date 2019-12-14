Return-Path: <SRS0=22nm=2E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C05C43603
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Dec 2019 02:13:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C0552073D
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Dec 2019 02:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BrGWiWYw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfLNCNY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 21:13:24 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:43487 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfLNCNY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 21:13:24 -0500
Received: by mail-pj1-f68.google.com with SMTP id g4so477473pjs.10
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 18:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:subject:cc:to:in-reply-to:references:message-id
         :mime-version:content-transfer-encoding;
        bh=LlBgPd4jKU/ivB4inJv2NdvJiBH02P7hq9N0GagI2Hc=;
        b=BrGWiWYwglLuch8nF6G6oTkqNFA41MXuP9p9xbZitOO4McQTuD58hZzHKG/a03AzkK
         X42N8H0YvBPayz8I6Uh0XriwvXTVsejiXkIozcO4JgDIOkGFu1bZem2KEuMyLKAsPLL0
         DzzY0oiQTF62+chWS2BeE/+P/XE/6/9LJNDzBKLLn9r7XmqtsIE2a/xwU9ZhTEVmlLtY
         uVygOLJb1lOyo3gUbP24BGF05pbUAps3FPiYHRv9AFl1ek/+rbe3zhTz+ggEsoL8pc9O
         Hz1TZIeeuZ5mPgTIqEG6ASO3x/BqGvjVtQnGFYp6crcvwEIkSVcW+fl1vaNiskAok30F
         f/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=LlBgPd4jKU/ivB4inJv2NdvJiBH02P7hq9N0GagI2Hc=;
        b=oSEnIqjQmgt6IaST8J1Uf0W2Vhm3ztL+0Thhdx/06afAwebnauKGLO0Gn3/F3I/E5O
         QpZQejATjo+AritzCnrzjVrq6NdcXCzk44qK1oI6DoDosyoGpouCyxbbGFN5o54ajxg2
         lo5htK6Uo9jRybeRsB/N0ULRIWd6ILqvbClBm1jyUdxzxsmMrMdP8bLd+1n3sB6++Vmq
         bt5tmQk2qa8vIX6ZSH6gGMgG8yvwvvwBDMVwfNSnQdxx3VoyWg0hKnBlqJOaDHMhlXvu
         McEMbpdg5R0AVCJ+ozhyx/HFFT5GnfC2CxccbpU2YGK31Vpg2/IhIvcGHNRjv7MgrPkZ
         j4CQ==
X-Gm-Message-State: APjAAAVat9daQs6t1t8Mnx4xB6sFBguS3I+CdhzNzXOjg66lE9byHLmn
        zkqb1eAE/G4SK501pyZ30y48SioC8/o=
X-Google-Smtp-Source: APXvYqwgMNyHwqaM8GRlUVZchzrPIFh4IykzVZXcNvpGe5skS7V0neTV1XyOGJHuYGdSk9AcfCXhUg==
X-Received: by 2002:a17:902:b418:: with SMTP id x24mr2855620plr.85.1576289603789;
        Fri, 13 Dec 2019 18:13:23 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
        by smtp.gmail.com with ESMTPSA id y62sm13929924pfg.45.2019.12.13.18.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 18:13:23 -0800 (PST)
Date:   Fri, 13 Dec 2019 18:13:23 -0800 (PST)
X-Google-Original-Date: Fri, 13 Dec 2019 18:13:20 PST (-0800)
From:   Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject:     Re: [PATCH 1/2] riscv: dts: Add DT support for SiFive L2 cache controller
CC:     robh+dt@kernel.org, mark.rutland@arm.com,
        Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, bmeng.cn@gmail.com, allison@lohutok.net,
        alexios.zavras@intel.com, Atish Patra <Atish.Patra@wdc.com>,
        tglx@linutronix.de, Greg KH <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, yash.shah@sifive.com
To:     yash.shah@sifive.com
In-Reply-To: <1575890706-36162-2-git-send-email-yash.shah@sifive.com>
References: <1575890706-36162-2-git-send-email-yash.shah@sifive.com>
  <1575890706-36162-1-git-send-email-yash.shah@sifive.com>
Message-ID: <mhng-119ed5ed-d9c3-422f-8d56-5794caef643c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 09 Dec 2019 03:25:05 PST (-0800), yash.shah@sifive.com wrote:
> Add the L2 cache controller DT node in SiFive FU540 soc-specific DT file
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index afa43c7..812db02 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -19,6 +19,16 @@
>  	chosen {
>  	};
>
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		l2_lim: lim@0x8000000 {
> +			reg = <0x0 0x8000000 0x0 0x2000000>;
> +		};
> +	};
> +
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> @@ -54,6 +64,7 @@
>  			reg = <1>;
>  			riscv,isa = "rv64imafdc";
>  			tlb-split;
> +			next-level-cache = <&l2cache>;
>  			cpu1_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
>  				compatible = "riscv,cpu-intc";
> @@ -77,6 +88,7 @@
>  			reg = <2>;
>  			riscv,isa = "rv64imafdc";
>  			tlb-split;
> +			next-level-cache = <&l2cache>;
>  			cpu2_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
>  				compatible = "riscv,cpu-intc";
> @@ -100,6 +112,7 @@
>  			reg = <3>;
>  			riscv,isa = "rv64imafdc";
>  			tlb-split;
> +			next-level-cache = <&l2cache>;
>  			cpu3_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
>  				compatible = "riscv,cpu-intc";
> @@ -123,6 +136,7 @@
>  			reg = <4>;
>  			riscv,isa = "rv64imafdc";
>  			tlb-split;
> +			next-level-cache = <&l2cache>;
>  			cpu4_intc: interrupt-controller {
>  				#interrupt-cells = <1>;
>  				compatible = "riscv,cpu-intc";
> @@ -246,6 +260,18 @@
>  			#pwm-cells = <3>;
>  			status = "disabled";
>  		};
> +		l2cache: cache-controller@2010000 {
> +			compatible = "sifive,fu540-c000-ccache", "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <1024>;
> +			cache-size = <2097152>;
> +			cache-unified;
> +			interrupt-parent = <&plic0>;
> +			interrupts = <1 2 3>;
> +			reg = <0x0 0x2010000 0x0 0x1000>;
> +			memory-region = <&l2_lim>;
> +		};
>
>  	};
>  };

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
