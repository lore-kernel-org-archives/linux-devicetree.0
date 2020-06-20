Return-Path: <SRS0=+D0Y=AB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E9EC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 19:10:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF854223AC
	for <linux-devicetree@archiver.kernel.org>; Sat, 20 Jun 2020 19:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbgFTTKk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 20 Jun 2020 15:10:40 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:55550 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgFTTKj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 20 Jun 2020 15:10:39 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 0D5A520021;
        Sat, 20 Jun 2020 21:10:31 +0200 (CEST)
Date:   Sat, 20 Jun 2020 21:10:30 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     Laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        jason@lakedaemon.net, airlied@linux.ie,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
        tomi.valkeinen@ti.com, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] dt-bindings: display: ti,tfp410.txt: convert to
 yaml
Message-ID: <20200620191030.GB27870@ravnborg.org>
References: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617094633.19663-1-ricardo.canuelo@collabora.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=8nJEP1OIZ-IA:10 a=e5mUnYsNAAAA:8 a=g4gMLcP0b6Kv2YKJtkEA:9
        a=wPNLvfGTeEIA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo.

On Wed, Jun 17, 2020 at 11:46:29AM +0200, Ricardo Cañuelo wrote:
> This series converts the DT binding for the TI TFP410 DPI-to-DVI encoder
> to json-schema.
> 
> It also fixes a minor bug in the ti-tfp410 driver that causes a
> wrong calculation of the setup and hold times when the de-skew feature
> is enabled. The retrieval of the de-skew value from the DT has also been
> updated to reflect the binding changes.
> 
> Changes in v4:
> 
>   - ti,tfp410.yaml:
>     - "ports" node set back as required (Laurent Pinchart). This means
>       that dove-sbc-a510.dts will not comply with the binding and will
>       have to be fixed at some point.
> 
> The bindings have been tested with:
> 
>   make dt_binding_check ARCH=<arch> DT_SCHEMA_FILES=<...ti,tfp410.yaml>
>   make dtbs_check ARCH=<arch> DT_SCHEMA_FILES=<...ti,tfp410.yaml>
> 
> for <arch> = arm and arm64.
> This uncovered a number of dts files that use the TFP410 but not through
> I2C and don't define the ti,deskew property. These should also be fixed.
> 
> Ricardo Cañuelo (4):
>   dt-bindings: display: ti,tfp410.txt: convert to yaml
>   dt-bindings: display: ti,tfp410.yaml: Redefine ti,deskew property
>   drm/bridge: tfp410: fix de-skew value retrieval from DT
>   drm/bridge: tfp410: Fix setup and hold time calculation

Thanks for following up and this.
Applied to drm-misc-next.

	Sam

> 
>  .../bindings/display/bridge/ti,tfp410.txt     |  66 ---------
>  .../bindings/display/bridge/ti,tfp410.yaml    | 131 ++++++++++++++++++
>  drivers/gpu/drm/bridge/ti-tfp410.c            |  10 +-
>  3 files changed, 136 insertions(+), 71 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> 
> -- 
> 2.18.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
