Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE4AC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 20:40:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24CC2204EF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 20:40:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Om00MRPn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730064AbgFDUkb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 16:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730047AbgFDUk0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 16:40:26 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07811C08C5C0
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 13:40:25 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d66so3807817pfd.6
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 13:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=xx1SMceBerbJ4D9bRiE7FtxAAA2jXtiHh9vjFS/GUGo=;
        b=Om00MRPnxHudI86qW6Iuw7en1e4tOjieEUvzDKvCJ6A4wtwo1q9bHu+SKpd17jbVHg
         s6b16xASEjJDBwRXkiDBeVMUAIEYfTycGII1FWri4gs9Asw2e1SM/lwwLyrDNzifqpef
         G+Df9AN2+/XtCA1WyfBtD9WRGwKj1bEsapAaCQjDc7QDthWz6yufc8gSlHF1I7+GlFhY
         eTnag4NLzgahcscyUqOavCXNQVqvO5Ht1vIczZBrSxb1jod3rQMBFdd1jGOs3rVChTqx
         bmyp47HhTQH80xJaS5IIGoLQSnph+dZFze9hr5HNHcmtr0W2mIwVn2Vjjo1vON2LFoyS
         THPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=xx1SMceBerbJ4D9bRiE7FtxAAA2jXtiHh9vjFS/GUGo=;
        b=pigWtioGybOgPqTTdXw2/UIm1yZJhhYNeFCIouyCoRjYcx291WmLiDxu4q/RAbIg6p
         z6wsXPzvilzCtiY31fK0AnznBpbxdpVUgJD+QaDU0v2Rh9x6QbmNSOBu0TD9RoBKZeop
         Rg2eXsrxrTIy8v90/OgGIMwXrKAycUuHo76F1ehQ/naY2ltBZyPP7lUTykfptJrzd/Or
         ni+2TrtUXtT3SatlUfDvuAfOdoete2vMNgIDI0uiRbi0SVlaHUbVBk2KklJZvQNgiWmg
         MdZxoa9iAUg9/ejWF8Wd5jwTLR5Su9M/J6Cp3cNXhLsbsgYd9D06V3JvC6vrkcEDZsvP
         K5mA==
X-Gm-Message-State: AOAM531ZTA5TDsxOwypW7x9xC8koWQ3Nr1mElv/dZjTjyAmI421IJ2PO
        jq77VOsP4ZVMqcrV/zbLZhKh+n6GafJZfQ==
X-Google-Smtp-Source: ABdhPJwvAhsBDFc+fpSlPYAPYmaksv9k7s7TOAHwIxYlG02LqHwsGEBSVZ0kNPiEyGgJTpNEaju9WQ==
X-Received: by 2002:a62:3382:: with SMTP id z124mr6044820pfz.263.1591303224391;
        Thu, 04 Jun 2020 13:40:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id v186sm4246627pfv.54.2020.06.04.13.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 13:40:23 -0700 (PDT)
Date:   Thu, 04 Jun 2020 13:40:23 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Jun 2020 13:38:28 PDT (-0700)
Subject:     Re: [PATCH 5/5] dt-bindings: timer: Add CLINT bindings
In-Reply-To: <20200521134544.816918-6-anup.patel@wdc.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        robh+dt@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        Atish Patra <Atish.Patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        anup@brainfault.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Anup Patel <Anup.Patel@wdc.com>
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-12494396-db4d-4b92-a8fb-1bb59bdf7fb8@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 21 May 2020 06:45:44 PDT (-0700), Anup Patel wrote:
> We add DT bindings documentation for CLINT device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  .../bindings/timer/sifive,clint.txt           | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.txt
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.txt b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> new file mode 100644
> index 000000000000..cae2dad1223a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.txt
> @@ -0,0 +1,33 @@
> +SiFive Core Local Interruptor (CLINT)
> +-------------------------------------
> +
> +SiFive (and other RISC-V) SOCs include an implementation of the SiFive Core
> +Local Interruptor (CLINT) for M-mode timer and inter-processor interrupts.
> +
> +It directly connects to the timer and inter-processor interrupt lines of
> +various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local interrupt
> +controller is the parent interrupt controller for CLINT device.
> +
> +The clock frequency of CLINT is specified via "timebase-frequency" DT
> +property of "/cpus" DT node. The "timebase-frequency" DT property is
> +described in: Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +Required properties:
> +- compatible : "sifive,clint-1.0.0" and a string identifying the actual
> +  detailed implementation in case that specific bugs need to be worked around.
> +- reg : Should contain 1 register range (address and length).
> +- interrupts-extended : Specifies which HARTs (or CPUs) are connected to
> +  the CLINT.  Each node pointed to should be a riscv,cpu-intc node, which
> +  has a riscv node as parent.
> +
> +Example:
> +
> +	clint@2000000 {
> +		compatible = "sifive,clint-1.0.0", "sifive,fu540-c000-clint";
> +		interrupts-extended = <
> +			&cpu1-intc 3 &cpu1-intc 7
> +			&cpu2-intc 3 &cpu2-intc 7
> +			&cpu3-intc 3 &cpu3-intc 7
> +			&cpu4-intc 3 &cpu4-intc 7>;
> +		reg = <0x2000000 0x4000000>;
> +	};

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
