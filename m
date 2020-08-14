Return-Path: <SRS0=/1Tz=BY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24F7C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 18:07:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77F412078D
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 18:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597428434;
	bh=NFHdc3BmdYFhz2nyKu8dvV6vT2C/XFArO5mCzwNmMDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=bvn+YhRnnmMGZC7oys2zNKaBO57g+52ClnVQo3DsFXxHLvjU+QzHIJLEge7PyQ/aR
	 542sdaP5//Qsd0uEQF5iqIq5J57Cp2cjkMNrIKHO6mhsBoGa7RalrHmL8F0TXDi2Js
	 N3lP8Kv1qLoOkrWyLCP22ZwR+1Wi99dtnLSF7kWQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgHNSHO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Aug 2020 14:07:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726297AbgHNSHN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 14 Aug 2020 14:07:13 -0400
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA94720829
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2020 18:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597428433;
        bh=NFHdc3BmdYFhz2nyKu8dvV6vT2C/XFArO5mCzwNmMDQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LmkbNPlxnz2KVY3YlDjhBA55pnVQFQlSw1VT7g0JJYThgl0KHUNHxqblsQSxuMVTm
         jQMNdT6F/fnJKUXTo6gn145yoYAsEM/zEEB+OQ3/yxmIlo52Wve+fWHgBaZcC+PWCz
         t0rGc6tECvGfbLPtQXACIs5iWdo5G9wjTap3p0qw=
Received: by mail-oo1-f52.google.com with SMTP id j19so2099045oor.2
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2020 11:07:12 -0700 (PDT)
X-Gm-Message-State: AOAM533Egeb0vzVlfHyYg91Jva2G0GLzE8BDQFkhA68TDz3IvQ/SFHQr
        afPfeNRnbsC5fX4jRagvvEQYfXmB1Svo3P5HjA==
X-Google-Smtp-Source: ABdhPJxmP2s5JfYVm3WEANrKwTUJbyRcbOd7ARe5undwm96kyX2D2gaV83wWWuqAjTXDbKGMvwTgDcWr+VmwZhsA9hE=
X-Received: by 2002:a4a:330b:: with SMTP id q11mr2519520ooq.50.1597428432155;
 Fri, 14 Aug 2020 11:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200814034854.460830-1-nico@fluxnic.net> <20200814034854.460830-2-nico@fluxnic.net>
In-Reply-To: <20200814034854.460830-2-nico@fluxnic.net>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 14 Aug 2020 12:07:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKTJgo8y1Zq=tyM=tTCXaVdu9o09SBiMNdz-OtXOMkkgg@mail.gmail.com>
Message-ID: <CAL_JsqKTJgo8y1Zq=tyM=tTCXaVdu9o09SBiMNdz-OtXOMkkgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: MIPI I3C Host Controller Interface
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Nicolas Pitre <npitre@baylibre.com>,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Aug 13, 2020 at 9:49 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> From: Nicolas Pitre <npitre@baylibre.com>
>
> The MIPI I3C HCI (Host Controller Interface) specification defines
> a common software driver interface to support compliant MIPI I3C
> host controller hardware implementations from multiple vendors.
>
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.txt      | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt

Bindings should be in schema format now.

> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt
> new file mode 100644
> index 0000000000..8de7d7ac6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.txt
> @@ -0,0 +1,15 @@
> +MIPI I3C Host Controller Interface
> +----------------------------------
> +
> +Required properties:
> +- compatible : "mipi-i3c-hci"

A register interface (or protocol) spec is never complete enough to
capture all the details about a specific h/w implementation. One just
has to go look at AHCI, EHCI, OHCI, XHCI, UFS, 8250, etc. bindings.
Let's not start with pretending that here. Fine for this to be a
fallback, but it must have a compatible for a specific implementation.

Also, which version of the spec does this compatible correspond to? Or
are there not HCI differences in the spec versions you mention in the
cover letter?

> +- reg : Should contain 1 register range (address and length)
> +- interrupts : HCI interrupt
> +
> +Example:
> +
> +       mipi_i3c_hci@0xa0000000 {

i3c@a0000000


> +               compatible = "mipi-i3c-hci";
> +               reg = <0xa0000000 0x2000>;
> +               interrupts = <89>;
> +       };
> --
> 2.26.2
>
