Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627A8C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 21:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97AD424682
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576270934;
	bh=+dKkT9qss0TqkoVOkTkEq+PspUmRCwAnZfc5MFA4ENA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=kx96REzz4yj/5Iqijt8qoiZOqdlIgFn+dmQqxKsbbq/XXhai0/pNB1gS7sWhCyWz8
	 6VRPGQdzlwLDbpP/L0ZINA0M4f7uZs1X1twgNe5MvG0pB7Dae/Fejp3aPRF5grj75Q
	 H3KGAYy9/6pAKtN2zgqzbAHge9LbpjsjRV+MC2WA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfLMVCO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 16:02:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:39742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbfLMVCO (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Dec 2019 16:02:14 -0500
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07EDB2465E;
        Fri, 13 Dec 2019 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576270933;
        bh=+dKkT9qss0TqkoVOkTkEq+PspUmRCwAnZfc5MFA4ENA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LhHtURfCvYmIuRkJl99Qo4S/nI7eK7un+4JAniuPEYc13zprB59KF7t7i++Z6NeZ0
         yaLz2PsMmvHqR/ShLKJhzoFL45g70ouFfoSU8+Ug6F6LS86EAMxj6EaZW+wT/2pat3
         3jyrr61NeviJnSr9l2R62Si/MxU3Oq+AGSELqrAI=
Received: by mail-pl1-f176.google.com with SMTP id p27so1725298pli.10;
        Fri, 13 Dec 2019 13:02:13 -0800 (PST)
X-Gm-Message-State: APjAAAVvFC+lug4SRvof++l8PEvfQo7g/zkl7LVjmMPQIbErPwoNYMiY
        9frVdBYIfwWo896JXbdetgeHplb05fqLhZpjMw==
X-Google-Smtp-Source: APXvYqyB90WtC9yvdYd6CmgFqz44rFwwJP+EgXqkcen8gQAUWJSXIFADvOtFxe2f6ycbB1XDnFfJpLpI9ICEyUjapLU=
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr13564621qvn.79.1576250763417;
 Fri, 13 Dec 2019 07:26:03 -0800 (PST)
MIME-Version: 1.0
References: <20191213074055.26193-1-maxime@cerno.tech>
In-Reply-To: <20191213074055.26193-1-maxime@cerno.tech>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 13 Dec 2019 09:25:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLxGe9sWrTdZhuT69o_LBxQTi6TxcbT28WdC1gsPw5+fQ@mail.gmail.com>
Message-ID: <CAL_JsqLxGe9sWrTdZhuT69o_LBxQTi6TxcbT28WdC1gsPw5+fQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: media: Convert Allwinner hardware codec to a schema
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 13, 2019 at 1:41 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Allwinner SoCs have a hardware video codec that is supported in Linux,
> with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 83 +++++++++++++++++++
>  .../devicetree/bindings/media/cedrus.txt      | 57 -------------
>  2 files changed, 83 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/cedrus.txt
>
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> new file mode 100644
> index 000000000000..47c8513555b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0+

Do you have rights to change the license (adding '+' aka '-or-later')?
If so, please add BSD-2-Clause. I don't have any other comments, so
just confirm and I can change it when applying.

Rob
