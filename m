Return-Path: <SRS0=mz9M=BP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361BEC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 01:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1715D2086A
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 01:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="0nWPc3Jn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgHEBr7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 4 Aug 2020 21:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgHEBr5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Aug 2020 21:47:57 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D875C061756
        for <devicetree@vger.kernel.org>; Tue,  4 Aug 2020 18:47:57 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p3so23528109pgh.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2020 18:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=j65hl2pUPWvRBCvP5UfBYwkdWCQ+opfh83SIaOomumk=;
        b=0nWPc3Jnrmdjj1thXDdb0nsxHlWBaEFrdPjvEzy/NF6FCrxahLF/igaj3kwTwA3KDM
         a+ViGXMXxuTKcSk/8V90anyNwoN4Alwong3RO4+M3sYDhtEUZIv09RG9YtnbAW3ld88F
         t8Lq6FMqiI1Xw5FRkiSxFqG/ogw3KrCk5FFp6yva4tthwmljV8m1C1LnJ32SItbaStpq
         Ov6ixSDnHO70+4gLDzoGx7kynFSkhz3RVH2VPd1lB06bdiGwvlhWaCWPj6Vp8e9wrCGr
         cEWRq8yDkqPHxk+XMs3B+kMvEZ392ZnOf69zcGnSBjf5cqzZPu2UhmxnCT2Ur4UgAum5
         3aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=j65hl2pUPWvRBCvP5UfBYwkdWCQ+opfh83SIaOomumk=;
        b=Ind8h5bNN07Tw8P3xpg5Jk2zy1mSa/DhMcvcuo7ZCYX5q3ykwKvse4DvcqsEbFXzSQ
         f6ZNCSB4HGIOE760tDFlX9vN2+8CGngfvui65NpSl5+v5NsXPD2yu+ZpbIjWr7tIahbK
         +U3vTM0BsSvLacgPJt757o3kKji7GCiz/rrQ+40CnBDDCQCeLznkOMbIRKFwVYejcJls
         rF8iT8Fa6OCbVy9g+nqege7qgQuYPN5i4fcUSTVJbAwxW3xvZ8HYtVmCL1kwD7kd/Nl/
         BFRH8OpIIxJd5hE5qIae2OGtlF7khwa+EmfZMKtgH/bZzneBPGJn0Q2hBDvTqbVaZ5+w
         +uuQ==
X-Gm-Message-State: AOAM533KgerRzxr5m3ZmrrsoJbjgUXxPT1FlITwWbLNHGqVkdvyhYzJP
        kHU/Xb+Yj+emKyXJ7wdLDu3LQA==
X-Google-Smtp-Source: ABdhPJyuFFmk+82rB0ni0x79mPwQUbHfkDBrfOGruFSOkrDPftIPB+K4DHVRTGU9Yz9VttsZAD3GNQ==
X-Received: by 2002:a62:c103:: with SMTP id i3mr1086842pfg.180.1596592076555;
        Tue, 04 Aug 2020 18:47:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id 207sm543411pfz.203.2020.08.04.18.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 18:47:55 -0700 (PDT)
Date:   Tue, 04 Aug 2020 18:47:55 -0700 (PDT)
X-Google-Original-Date: Tue, 04 Aug 2020 18:41:10 PDT (-0700)
Subject:     Re: [PATCH v6 4/4] dt-bindings: timer: Add CLINT bindings
In-Reply-To: <20200724071822.126758-5-anup.patel@wdc.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        robh+dt@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        Atish Patra <Atish.Patra@wdc.com>,
        Alistair Francis <Alistair.Francis@wdc.com>,
        anup@brainfault.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Anup Patel <Anup.Patel@wdc.com>, kernel@esmil.dk
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-af0c875c-57e6-4004-bb43-1f5dc3f1db36@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 24 Jul 2020 00:18:22 PDT (-0700), Anup Patel wrote:
> We add DT bindings documentation for CLINT device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> new file mode 100644
> index 000000000000..2a0e9cd9fbcf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/sifive,clint.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Core Local Interruptor
> +
> +maintainers:
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  SiFive (and other RISC-V) SOCs include an implementation of the SiFive
> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> +  interrupts. It directly connects to the timer and inter-processor interrupt
> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> +  interrupt controller is the parent interrupt controller for CLINT device.
> +  The clock frequency of CLINT is specified via "timebase-frequency" DT
> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,fu540-c000-clint
> +      - const: sifive,clint0
> +
> +    description:
> +      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
> +      Supported compatible strings are -
> +      "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
> +      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
> +      CLINT v0 IP block with no chip integration tweaks.
> +      Please refer to sifive-blocks-ip-versioning.txt for details

Perfect!  I was going to mention that we forgot to define the
"sifive,${name}${version}" scheme but I guess I just forgot that we did define
it ;)

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    timer@2000000 {
> +      compatible = "sifive,fu540-c000-clint", "sifive,clint0";
> +      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> +                             &cpu2intc 3 &cpu2intc 7
> +                             &cpu3intc 3 &cpu3intc 7
> +                             &cpu4intc 3 &cpu4intc 7>;
> +       reg = <0x2000000 0x10000>;
> +    };
> +...

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
