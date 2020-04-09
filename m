Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BADC2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 16:11:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 752FC218AC
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586448683;
	bh=dY4y3+4XbjvyakdB/uUdMrfzN4g/tqUzd0PNclNSbKY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=DMOkkBaLCWtkinJzTxq72/DTyLr5cu2COIfpLBAYm3MvCtcXlQ8nkWhm0Q3PScA/D
	 QeMjCSagFQ60ZNujrubioJwFXu5NV39NiPZx5my13e93chtbka3CKzh/bAvm3ECjQD
	 WIBZSbnEWlk46m2ooyCvu+7DEYvcLhVDmgog6h6E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbgDIQLW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 12:11:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:40970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728254AbgDIQLW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Apr 2020 12:11:22 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E81521973
        for <devicetree@vger.kernel.org>; Thu,  9 Apr 2020 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586448682;
        bh=dY4y3+4XbjvyakdB/uUdMrfzN4g/tqUzd0PNclNSbKY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Y6Kkz4YffGxvN/26LWVTywp6KjT9Bo0OWatb6LvFCbHM5RTBHAhNv1dUsPr/8Ihqs
         j5P/0ncVLiCgI6SGumdrR+scvugGw58Y0uXtyHaQ+fpsSj+5FVBPrE39jVh6URWWmN
         /0VgOzgKjsf3HYM+csRMdIkODW12sdmHj1MfDENk=
Received: by mail-qk1-f169.google.com with SMTP id c63so4526607qke.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2020 09:11:22 -0700 (PDT)
X-Gm-Message-State: AGi0Pua5dJ6s3HKjKQh+Mry+xqG09DVsbMpasv+FDOK2TbKyyV5h5k/w
        Tc4/72atkEsO46TjMTRjovc2c7dTJder3e3QDQ==
X-Google-Smtp-Source: APiQypLHsZq1dcUUjmhrUwi046XKEZhwxT7wbBhFjz2qi6S6YZ3km9QRZscpkxJrdVKvm7zomaEcxWOLtAO8qAUOKpA=
X-Received: by 2002:a37:c43:: with SMTP id 64mr539234qkm.119.1586448681197;
 Thu, 09 Apr 2020 09:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200408195109.32692-1-sam@ravnborg.org> <20200408195109.32692-2-sam@ravnborg.org>
In-Reply-To: <20200408195109.32692-2-sam@ravnborg.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 9 Apr 2020 10:11:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKp9r6sQuyKtqZnx26-2kzwkQSaa7N6Lbs2g6rC-Rpx1w@mail.gmail.com>
Message-ID: <CAL_JsqKp9r6sQuyKtqZnx26-2kzwkQSaa7N6Lbs2g6rC-Rpx1w@mail.gmail.com>
Subject: Re: [PATCH v2 01/36] dt-bindings: display: allow port and ports in panel-lvds
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Apr 8, 2020 at 1:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Both port and ports names may be used.
> port - for a single port
> ports - if there is more than one port in sub-nodes
>
> Fixes the following warning:
> advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property
>
> advantech,idk-2121wr.yaml needs several ports, so uses a ports node.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/devicetree/bindings/display/panel/lvds.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)


>
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index d0083301acbe..f9132d50821c 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -102,6 +102,12 @@ required:
>    - width-mm
>    - height-mm
>    - panel-timing
> -  - port
> +
> +if:
> +  required:
> +    - port
> +else:
> +  required:
> +    - ports

Humm, I guess 'then' is not required. That's a bit weird IMO.

I usually do a 'oneOf' for these cases.

Either way, please apply this to drm-misc-fixes (or
drm-misc-next-fixes depending on the state of the tree). Or I can take
it. I'd like to get all the warnings cleared up by rc2.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
