Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9552DC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 02:34:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CD36206B2
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 02:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597286094;
	bh=TAz5cCcHd4yqMqBvYJKy8U8P7gsxoLPKhwjFOZLWDIM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=mh3DUACjSbUslR+Qho7mhEDnURJVLeeV6GXy8CltbR891dlzCDkl4snsVqTkcAxAO
	 RUmTPDocyjJ1AfFAWaA1zWp1gUBo26fciVf/XMg+HpdIMSdSXO8i9xgxmejWSdPBgc
	 7Vfo0pJwQoyS3Tiu+BBj15DAZJgxTZPntnxrN0iI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHMCex (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 22:34:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:41984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgHMCex (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Aug 2020 22:34:53 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0315206B2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 02:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597286092;
        bh=TAz5cCcHd4yqMqBvYJKy8U8P7gsxoLPKhwjFOZLWDIM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u7NISzl7Yli6ona7KYhrl0rknhFMDrmUOybIArIa6PNnCnIAIG6LDNNLDcnEZt2CL
         zvG2etBn5SPemQrpFB2II8E+Wayl7PnVBh4BHb1KmsY+Hh1mzgA04DWjTszDIo4QBq
         Uc6ti+9tlAAzLatF/CIOjO3CgHWgIn8ASZ/tuvjQ=
Received: by mail-oi1-f175.google.com with SMTP id a24so3743286oia.6
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 19:34:52 -0700 (PDT)
X-Gm-Message-State: AOAM53221GFEglji9Q3OaC7rgFMnWYeePHAVYOAUBOKAW22fudPgQo76
        GQ9/GA1WJRWPCldDly/4Za6Nnzfsw/LFQ+Kv+w==
X-Google-Smtp-Source: ABdhPJywFKo5UazHL3R0/K51u8Ssfvgo/4jzjVgwnfimP3//6zmigP5vJq0Ak/mfqsro52gy1NdAYAbs4OnuvkCvHeo=
X-Received: by 2002:aca:90a:: with SMTP id 10mr519961oij.106.1597286092087;
 Wed, 12 Aug 2020 19:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1596631695.git.robin.murphy@arm.com> <91284e754802c37c303556a1cffbb46f0aebbd1f.1596631695.git.robin.murphy@arm.com>
In-Reply-To: <91284e754802c37c303556a1cffbb46f0aebbd1f.1596631695.git.robin.murphy@arm.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 12 Aug 2020 20:34:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcyhVRsdiPY_-F55aeE5kpVun12aMXqz=53fYMbYGuMQ@mail.gmail.com>
Message-ID: <CAL_JsqLcyhVRsdiPY_-F55aeE5kpVun12aMXqz=53fYMbYGuMQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf: Add Arm CMN-600 DT binding
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org,
        tuanphan@os.amperecomputing.com, tsahee@amazon.com,
        harb@amperecomputing.com, james.yang@arm.com,
        "Saidi, Ali" <alisaidi@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 5, 2020 at 6:57 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> Document the requirements for the CMN-600 DT binding. The internal
> topology is almost entirely discoverable by walking a tree of ID
> registers, but sadly both the starting point for that walk and the
> exact format of those registers are configuration-dependent and not
> discoverable from some sane fixed location. Oh well.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  .../devicetree/bindings/perf/arm-cmn.yaml     | 57 +++++++++++++++++++

arm,cmn.yaml

>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/arm-cmn.yaml
>
> diff --git a/Documentation/devicetree/bindings/perf/arm-cmn.yaml b/Documentation/devicetree/bindings/perf/arm-cmn.yaml
> new file mode 100644
> index 000000000000..167491787088
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/arm-cmn.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings: (GPL-2.0-only OR BSD-2-Clause)

> +# Copyright 2020 Arm Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/arm-cmn.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm CMN (Coherent Mesh Network) Performance Monitors
> +
> +maintainers:
> +  - Robin Murphy <robin.murphy@arm.com>
> +
> +properties:
> +  compatible:
> +    const: arm,cmn-600
> +
> +  reg:
> +    items:
> +      - description: Physical address of the base (PERIPHBASE) and
> +          size (up to 64MB) of the configuration address space.
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      - description: Overflow interrupt for DTC0
> +      - description: Overflow interrupt for DTC1
> +      - description: Overflow interrupt for DTC2
> +      - description: Overflow interrupt for DTC3
> +    description: One interrupt for each DTC domain implemented must
> +      be specified, in order. DTC0 is always present.
> +
> +  arm,root-node :

extra space       ^

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset from PERIPHBASE of the configuration
> +      discovery node (see TRM definition of ROOTNODEBASE).
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - arm,root-node
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    pmu@50000000 {
> +        compatible = "arm,cmn-600";
> +        reg = <0x50000000 0x4000000>;
> +        /* 4x2 mesh with one DTC, and CFG node at 0,1,1,0 */
> +        interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +        arm,root-node = <0x104000>;
> +    };
> +...
> --
> 2.28.0.dirty
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
