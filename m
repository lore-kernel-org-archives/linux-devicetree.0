Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC47AC33CA9
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 18:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90121214AF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 18:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578938596;
	bh=afflEPcI7MpMlvXe7Utrd24JwsqE7FzZ4KSgPfwTYhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=NwW56t6evGsMc2dOiedJhVVj40Oe6CCI5wx+1mioYG08QYThQy7meOK/UdApZEmSy
	 Bb/OmOcoQaMABNo5F//3K0hl7Ig4XtWS2qWelxJ/XPsPyFMaPXWJq60SY1aGyLgDah
	 +Os7oXIlHdGokpscJFiMOpyeJZlv5TCeVemKIYZo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgAMSDQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 13:03:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:35594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727726AbgAMSDP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jan 2020 13:03:15 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49A822075B;
        Mon, 13 Jan 2020 18:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578938594;
        bh=afflEPcI7MpMlvXe7Utrd24JwsqE7FzZ4KSgPfwTYhA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t2SdDU6gYhuDwF0V+t7IEZ4Mfch8uWRfQCNh93EnNl7Fz4+nACnwyDj5iGOqN3mk4
         hgivCO8LQTO9U87gIxoWJAAozqRFSglbpIP0vNv7q75G4dfFe3AgzA653Gohq+SUVq
         uNUXsLRd30DaznWfQKmsUGwDfewX9c9BClWvrZOs=
Received: by mail-qv1-f44.google.com with SMTP id t6so4405197qvs.5;
        Mon, 13 Jan 2020 10:03:14 -0800 (PST)
X-Gm-Message-State: APjAAAU8f5rqbOvk45l03BTwN1rZXJKTJt9AybCjyreU0ggznlyeOWse
        sfZMb4CGTr6ncG/3Zy5FTWW2VFK061jfHSV6FA==
X-Google-Smtp-Source: APXvYqxzDqqZLxyasFHvaFmhSmeFE/4AB65rl6FByRgTdU7OF89T+KZV1q9l2AtEAQ19eqqpv05W2/tU3D6NcQZJoyE=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr12282769qvn.79.1578938593441;
 Mon, 13 Jan 2020 10:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20191222113921.1469372-1-thierry.reding@gmail.com> <20191222113921.1469372-2-thierry.reding@gmail.com>
In-Reply-To: <20191222113921.1469372-2-thierry.reding@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 13 Jan 2020 12:03:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKWRm7BN1vjV=DDHJooEbQti+zFN=PrvEtrNhKoKa06YQ@mail.gmail.com>
Message-ID: <CAL_JsqKWRm7BN1vjV=DDHJooEbQti+zFN=PrvEtrNhKoKa06YQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: memory-controller: Convert Tegra124 EMC
 to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Dec 22, 2019 at 5:39 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Convert the device tree bindings for the Tegra124 EMC controller to the
> DT schema format using json-schema. While at it, clean up the binding a
> little bit by removing any mention of how RAM code and clock frequency
> are represented in unit-addresses (which they aren't) and by adding the
> EMC clock without which the EMC controller can't change the frequency at
> which the external memory is clocked. While this is technically an ABI
> break (the clock was not required before), this should be fine because
> there isn't much that the EMC driver can do without access to the EMC
> clock.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../nvidia,tegra124-emc.txt                   | 374 -------------
>  .../nvidia,tegra124-emc.yaml                  | 528 ++++++++++++++++++
>  2 files changed, 528 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml

The example fails 'make dt_binding_check':

/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml:
memory-controller@70019000: '#reset-cells' is a required property
/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml:
external-memory-controller@7001b000: emc-timings-0:timing-0:
'nvidia,emc-mrs-wait-cnt' is a required property
/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml:
external-memory-controller@7001b000: emc-timings-0:timing-0:
'nvidia,emc-xm2dqspadctrl2' is a required property
/home/rob/proj/git/linux-dt/.build-arm64/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.example.dt.yaml:
external-memory-controller@7001b000: emc-timings-0:timing-0:
'nvidia,emc-zcal-interval' is a required property

Rob
