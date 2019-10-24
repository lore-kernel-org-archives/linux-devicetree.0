Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB41CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 18:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 147E521925
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 18:02:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="oZ22aT4v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406374AbfJXSCS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 14:02:18 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42453 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404873AbfJXSCS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 24 Oct 2019 14:02:18 -0400
Received: by mail-lf1-f68.google.com with SMTP id z12so19873447lfj.9
        for <devicetree@vger.kernel.org>; Thu, 24 Oct 2019 11:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1MT+NuL0A2d7V47il5xKhn38l4jnJHUWqOzNSUqZTmU=;
        b=oZ22aT4v7OacrgXhNTSDZMursMGBZczVUnMPSlZ/Trsm7sPAQ/HZoQod05TDbS0DvM
         oDCq0HtMiuBDJ5XsdPVtJq1oCRGBQW4nVjj724fZT92YXuPyodfXTYwppWz3pyOA4Xy1
         IiXrDpZRt/3F9DRMeZV3/clMSkQEKpZZoGoeej3YZvYhUQrxgZYpbZlWzMhtyunBPN/h
         6TWZ/935JMnZjt1MC0A/+UOQdu9/RRoKDxPTo+BHxYvAc5NkTCQN+wU4A1d0zzEyiuNs
         sN5VUfK5DIj3z7jpjLIGpQjUfmP7XTaUbtPKunBAyF3fC/b9GcDeYAgVtCWmC1PQqstJ
         O4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1MT+NuL0A2d7V47il5xKhn38l4jnJHUWqOzNSUqZTmU=;
        b=lf1q3csbv6Oie6tspSOr+xLnmFDVviQpKR0FbCUiXZxhWwYoBsRRUzkUPm5zFnwkbh
         pN/TrZgKbWje2md0QznoGkWyCsPe6N2cFsHBzxClK/KlZQoP5awpQwv8Qx0hXBCsi9k7
         2WzsrdtL+DcIm9CJBto0ksRrEZ+MV+zW9XTMdw7C50MMDCHn4+V8CH7rkImXHizEzn3N
         4UrDPgPhAgebA4g1e9jyTDrja6gBAtrn+Pr/HTt69R4CKbKNNdGqrSMYy+gjar8TO3ua
         MEDFJZe0/LWXLTWsob2BX9H9q1phHhmwglrpeoxGzUfa+FQPsVRM2L2khBlM7pmV2jEb
         scGQ==
X-Gm-Message-State: APjAAAXy95gefff/p9Xfq6/PkKOigAOvvu6LW+HCW6FUtHqhCj9AnmzZ
        rdui2gk6cH3ImpEzUM8sO3Pq8A==
X-Google-Smtp-Source: APXvYqxGtlgBuxs1ObTfTUdNmXl+vqtR/s3VtCKQ9QOnG7IF5eA/FjgTQhCKWo+G3t/i5gv/UkgNZQ==
X-Received: by 2002:a19:f813:: with SMTP id a19mr12166729lff.33.1571940136026;
        Thu, 24 Oct 2019 11:02:16 -0700 (PDT)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id m15sm10649914ljh.50.2019.10.24.11.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 11:02:15 -0700 (PDT)
Date:   Thu, 24 Oct 2019 20:02:03 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: rcar_vin: Document RZ/G1 per-board
 settings
Message-ID: <20191024180203.GA24998@bigcity.dyn.berto.se>
References: <20191024131423.16799-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191024131423.16799-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-10-24 15:14:23 +0200, Geert Uytterhoeven wrote:
> The R-Car Gen2 per-board settings apply to RZ/G1, too.
> 
> Fixes: 1d14a5eaa156b0b3 ("media: dt-bindings: media: rcar_vin: add device tree support for r8a774[35]")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/renesas,vin.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/renesas,vin.txt b/Documentation/devicetree/bindings/media/renesas,vin.txt
> index aa217b0962797712..221fcc416d1ac598 100644
> --- a/Documentation/devicetree/bindings/media/renesas,vin.txt
> +++ b/Documentation/devicetree/bindings/media/renesas,vin.txt
> @@ -43,7 +43,7 @@ on Gen3 and RZ/G2 platforms to a CSI-2 receiver.
>  Additionally, an alias named vinX will need to be created to specify
>  which video input device this is.
>  
> -The per-board settings Gen2 platforms:
> +The per-board settings for Gen2 and RZ/G1 platforms:
>  
>  - port - sub-node describing a single endpoint connected to the VIN
>    from external SoC pins as described in video-interfaces.txt[1].
> @@ -63,7 +63,7 @@ The per-board settings Gen2 platforms:
>      - data-enable-active: polarity of CLKENB signal, see [1] for
>        description. Default is active high.
>  
> -The per-board settings Gen3 and RZ/G2 platforms:
> +The per-board settings for Gen3 and RZ/G2 platforms:
>  
>  Gen3 and RZ/G2 platforms can support both a single connected parallel input
>  source from external SoC pins (port@0) and/or multiple parallel input sources
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
