Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC30C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 16:04:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25FEE20782
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 16:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="aDlbWI41"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgHYQEB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 12:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgHYQDB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 12:03:01 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5EC6C061786
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 09:02:53 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u128so7697737pfb.6
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=KPkLZJgZoXiLJffiihBupgXf4zrj4jokhwZeTXsnTGE=;
        b=aDlbWI41jY6pIx7QLbALlOlZ4VvpjQBnUpX9orTDHefzfXPlapLoMkrMZ01zGUGjk8
         5ahNPY6spEthv1QWrR2y6eWmBHQrMNSONkdxxlTzXsffWrylY9+6K8P6ryiPVZ5WC1i+
         4z/KKPpPw2+JBaAMNJd6/0F8hO4uMJesatg0sZ4G4KGpZvLHTNAJrIMjLsgAEPspW9/V
         F667p0bwmn6FmU5BjKJYD3VnPBir5RlBT8DF/w92lvjhisgnwK9VX0c+gBBptGF/KWl8
         aAR9hrR6lVF4ylWYCyLoToNz+ozfJSwdPXe6pbX1Xr2Mg3ImhrSwbrwNFnWxfJR7L7B8
         ukoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=KPkLZJgZoXiLJffiihBupgXf4zrj4jokhwZeTXsnTGE=;
        b=lCkzambM8l7/R/p1nVWsndmZkuT+4ZKa2DCoJH+dIHZlkfG9XbrM+El/+B9Ir878ex
         Win9l6PkpzjIvjOBnJCC0GHrXqK8e0sBGdCa6o4URc02QS7s4HfgIqvz+1gtgS6UurWJ
         S7gtJ/119045Gu/5Iy6/6T0XXQDNFONXZKGhMj7mSL+5qs7pzMv1eiWle/Fm1BLT1SFK
         Ft7/brKitHwREHDcTl5CgrnjWQF02vAa+FtEOgxKHm+SkQS8XUjHGu578CQaxyigntyz
         ebgQ58co3bz+U0dSlxX2RcSvtUqzzbslpMdsoDhaSwnCl9/GK8bhwhy1EYsTZ44t6cof
         2sLA==
X-Gm-Message-State: AOAM530vARsaAkWo4wBRKQ+rP6hVUxr2hrSCurrBHCChA0pHbfOJX7fB
        e2Cvoe914G7Pe1yF9lNK5IO6UQ==
X-Google-Smtp-Source: ABdhPJwFkVnCpRijagKF/eo1R4lg5/JWfJN9V6X1I79qjxwyzwaRx8jYAPMLkIGwV6qy4eXXe+qikQ==
X-Received: by 2002:a63:4f22:: with SMTP id d34mr7393022pgb.320.1598371372168;
        Tue, 25 Aug 2020 09:02:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id s125sm15564588pfb.125.2020.08.25.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 09:02:51 -0700 (PDT)
Date:   Tue, 25 Aug 2020 09:02:51 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Aug 2020 08:24:30 PDT (-0700)
Subject:     Re: [PATCH 1/3] dt-bindings: riscv: Add DT documentation for DDR Controller in SiFive SoCs
In-Reply-To: <1598357182-4226-2-git-send-email-yash.shah@sifive.com>
CC:     robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com,
        aou@eecs.berkeley.edu, james.morse@arm.com, rrichter@marvell.com,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        sachin.ghadi@sifive.com, yash.shah@sifive.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     yash.shah@sifive.com
Message-ID: <mhng-45ab2484-537a-45da-8fb2-b19329728caa@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Aug 2020 05:06:20 PDT (-0700), yash.shah@sifive.com wrote:
> Add device tree bindings for SiFive FU540 DDR controller driver
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-ddr.yaml      | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
>
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml b/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
> new file mode 100644
> index 0000000..0288119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sifive-ddr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive DDR memory controller binding
> +
> +description: |
> +  The Sifive DDR controller driver is used to manage the Cadence DDR
> +  controller present in SiFive FU540-C000 SoC. Currently the driver is
> +  used to manage EDAC feature of the DDR controller.
> +
> +maintainers:
> +  - Yash Shah <yash.shah@sifive.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sifive,fu540-c000-ddr
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    memory-controller@100b0000 {
> +        compatible = "sifive,fu540-c000-ddr";
> +        reg = <0x100b0000 0x4000>;
> +        interrupts = <31>;
> +    };

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
