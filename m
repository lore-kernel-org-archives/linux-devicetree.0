Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA73C00523
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F940222C3
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578096601;
	bh=d9NUujIqWfkarIJ1UVYE4+Ixa0Pe1GIKYKYTdt/XZ6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kO5DHRqz8rzHk30GLhEhhh5Echk4sM5kEwWzDeoyZ+5cGxBMxp4cEdbx/92QMEdZc
	 hB5scURm0R+pulO00oQ1ZgP1KKme1LtLYkg8BCCHNLlgOhqqS7rkvqxGAlgmoIP4YL
	 RloKd7PWVFPMIyuJ7XIKBeWDd07HZWvi1Z05/SwE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgADAKB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:10:01 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:32868 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgADAKA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:10:00 -0500
Received: by mail-io1-f65.google.com with SMTP id z8so43076995ioh.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XfXHkBnCjci39X5Yh6SUYp5n6eoGbtDoP20HblyPxEY=;
        b=iZ+YRnMezl5o/mMuzmXmh0S4IHFLwTRLDthPS5sPu8wfbZnTxKwKuzplTe5j1V79SN
         NWNChS0wEcjBhw4vUTqt95I9gortUME4sd4LBYElygQRrjpmDIcQHDyFLUOphoi8i1bh
         eld2Gy1WB1pEmK6DvGVVGKCB/vMsoo5ETJIolOow7VZqmbBSM8QC4NuPHZklsyWOpRnU
         oppT3tVpixOfYAVymoD3hk1zBteCD1IDs+WIzkv7/FvPbrLCk7hZ6Xlpokm5qgbCOYaF
         w1C+80kkv89I52mGU4Vs12a3Eocvjl/0RetuvBgo0EchRLYwXQqxZ73cYs2oRVltnZQV
         Kf2Q==
X-Gm-Message-State: APjAAAXsb/CjLBb6zmB6nRT9bmIr+Y7mroO0dAAYxnSOoxXq8JandY0K
        +eqUod8/6NWysjiXfc61YygyBkI=
X-Google-Smtp-Source: APXvYqyOvA986AVKNMoMIopT3swAVJuQKyGl5JWwJ/ApErx3H7eRlz1Vjf4lcj5cqkJ7p6u+N0qxbQ==
X-Received: by 2002:a6b:8f0c:: with SMTP id r12mr63168486iod.233.1578096599455;
        Fri, 03 Jan 2020 16:09:59 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n5sm21351264ili.28.2020.01.03.16.09.58
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:09:58 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:09:57 -0700
Date:   Fri, 3 Jan 2020 17:09:57 -0700
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: Add Satoz panel
Message-ID: <20200104000957.GA17750@bogus>
References: <20191224141905.22780-1-miquel.raynal@bootlin.com>
 <20191224141905.22780-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191224141905.22780-2-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 24, 2019 at 03:19:04PM +0100, Miquel Raynal wrote:
> Satoz is a Chinese TFT manufacturer.
> Website: http://www.sat-sz.com/English/index.html
> 
> Add (simple) bindings for its SAT050AT40H12R2 5.0 inch LCD panel.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes since v2:
> * None.
> 
> Changes since v1:
> * New patch
> 
>  .../display/panel/satoz,sat050at40h12r2.yaml  | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml

Note that this may become obsolete if we move all simple panels to a 
single schema.

> 
> diff --git a/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml b/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml
> new file mode 100644
> index 000000000000..567b32a544f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/satoz,sat050at40h12r2.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/satoz,sat050at40h12r2#

Missing '.yaml'

Run 'make dt_binding_check' which will check this and other things.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Satoz SAT050AT40H12R2 panel
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |+
> +  LCD 5.0 inch 800x480 RGB panel.

Any public spec for this panel?

> +
> +  This binding is compatible with the simple-panel binding, which is specified
> +  in simple-panel.txt in this directory.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:

Drop 'contains'. It must be exactly the below string, not the below 
string and *any* other strings.

> +      const: satoz,sat050at40h12r2
> +
> +required:
> +  - compatible
> -- 
> 2.20.1
> 
