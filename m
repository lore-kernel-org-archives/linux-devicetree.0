Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB15C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 21:29:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECF2620738
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 21:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598390979;
	bh=DdKIsuQbdUMGc8ALHGN9ZKFGVrpk1sfiGQFnXZo5ocw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ei2UgertzIjDWYmXs20ikhOcLF+mfvNZgQnsX5oHehiC5rp/bg154Gus+103YnxIw
	 aRUDk9QltSMVNjJPsh13zHgds2072LorGHbZeuA6E5wWT4ftYe8euxJrK/SbxDPEhQ
	 ONBgE4nVm2Ee9hA7HHpZE2GYAiB2o0MoGZHRlnUA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHYV3i (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 17:29:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40501 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHYV3i (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 17:29:38 -0400
Received: by mail-io1-f68.google.com with SMTP id q132so9480iod.7
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 14:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KC6+KOuevd65Hj+rqbmYtwV5VdmCIsRDB4gdpaWQ8XQ=;
        b=s92PLBRYRkgmUrbNl2GP941orhdUuvjVB/nUuyE/kKAc4Ysgw3/f1qxbN386Xx2d4s
         995IMFIMBwu4AvE8P3+KKudMOzoWgSAzou+rGk28Ra3KD9p2MpuM17U7yW9xvvLtGz1s
         HMA9XV3srmROgyxDfhU44RU0MrSHFmxBydu/DsAhvR8ooS3NrA4dvv3ap/uJIgiFHruc
         RHsXCwdBnVDgMR3i5Sio6p0WKM8utop+sVhs5GHYwqZR0n8veDEbAr+ateQQG6CPb+vk
         H5wtHvoqIYk9ezVtU0gtdAMi2Ccywokj80g1V+hzXPfujCw9Ixts1Hvr0BlFcKX3T+Vh
         +RgA==
X-Gm-Message-State: AOAM530EEF8FdQr07xPDUDTFRZTlxrha8p8VJ2xajdQBKNg/TAzMf3JK
        GQikFo5ITUmlXhZL0rXONA==
X-Google-Smtp-Source: ABdhPJzWPE8O3q99Q9+RzPgzMZpx69D3yqiRk3ejyaURbwNHkg/tdWoZDmSKNx4IIjcnExLRTo/ooA==
X-Received: by 2002:a05:6602:1343:: with SMTP id i3mr10387390iov.134.1598390977445;
        Tue, 25 Aug 2020 14:29:37 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id g6sm12518iop.24.2020.08.25.14.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 14:29:36 -0700 (PDT)
Received: (nullmailer pid 1366394 invoked by uid 1000);
        Tue, 25 Aug 2020 21:29:32 -0000
Date:   Tue, 25 Aug 2020 15:29:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Nicolas Pitre <npitre@baylibre.com>,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: MIPI I3C Host Controller
 Interface
Message-ID: <20200825212932.GA1360264@bogus>
References: <20200819031723.1398378-1-nico@fluxnic.net>
 <20200819031723.1398378-2-nico@fluxnic.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819031723.1398378-2-nico@fluxnic.net>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Aug 18, 2020 at 11:17:22PM -0400, Nicolas Pitre wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> The MIPI I3C HCI (Host Controller Interface) specification defines
> a common software driver interface to support compliant MIPI I3C
> host controller hardware implementations from multiple vendors.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> new file mode 100644
> index 0000000000..8fc18ea922
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i3c/mipi-i3c-hci.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: MIPI I3C HCI Device Tree Bindings
> +
> +maintainers:
> +  - Nicolas Pitre <npitre@baylibre.com>
> +
> +description: |
> +  MIPI I3C Host Controller Interface
> +
> +  The MIPI I3C HCI (Host Controller Interface) specification defines
> +  a common software driver interface to support compliant MIPI I3C
> +  host controller hardware implementations from multiple vendors.
> +
> +  For details, please see:
> +  https://www.mipi.org/specifications/i3c-hci
> +
> +properties:
> +  compatible:
> +    const: mipi-i3c-hci

What about my comments on v1? Pasted again:

A register interface (or protocol) spec is never complete enough to
capture all the details about a specific h/w implementation. One just
has to go look at AHCI, EHCI, OHCI, XHCI, UFS, 8250, etc. bindings.
Let's not start with pretending that here. Fine for this to be a
fallback, but it must have a compatible for a specific implementation.

Also, which version of the spec does this compatible correspond to? Or
are there not HCI differences in the spec versions you mention in the
cover letter?

> +  reg:
> +    maxItems: 1
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    mipi_i3c_hci@a0000000 {

i3c@a0000000

> +      compatible = "mipi-i3c-hci";
> +      reg = <0xa0000000 0x2000>;
> +      interrupts = <89>;
> +    };
> -- 
> 2.26.2
> 
