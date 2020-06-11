Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670EAC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 16:08:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A399206DC
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 16:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rJgQArWM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgFKQIl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 12:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgFKQIl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 12:08:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8C3C08C5C1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 09:08:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8742D24F;
        Thu, 11 Jun 2020 18:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591891718;
        bh=jlW4b5AG5wwpqPodl7+wSfpNr7n8QxJCTCiAHHSO2z0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rJgQArWMykr86hC6S/z6A49E9WFqEfSoOuOnDevnRMkgif9FNpo2FEG6Pg0Xsw9sx
         eEo8pW1eeQZnEYg9N/IRUoO5CJjblOK1CQQvO665RDb561+TnK6GMHRvavCcORARv3
         247hPGH3b9vehgfJAPnPBIJ71VnYsUkWQDdwof60=
Date:   Thu, 11 Jun 2020 19:08:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     kernel@collabora.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, jason@lakedaemon.net,
        tomi.valkeinen@ti.com, robh+dt@kernel.org, airlied@linux.ie
Subject: Re: [PATCH v3 5/5] dt-bindings: display: ti,tfp410.yaml: make the
 ports node optional
Message-ID: <20200611160817.GA6031@pendragon.ideasonboard.com>
References: <20200611102356.31563-1-ricardo.canuelo@collabora.com>
 <20200611102356.31563-6-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200611102356.31563-6-ricardo.canuelo@collabora.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Jun 11, 2020 at 12:23:56PM +0200, Ricardo Cañuelo wrote:
> Make the ports node optional, since there are some DTs that don't define
> any ports for ti,tfp410.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

Shouldn't we fix those DTs instead ? What's the point of a TFP410
without ports in DT ?

> ---
>  Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> index 605831c1e836..1c9421eb80fa 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.yaml
> @@ -83,7 +83,6 @@ properties:
>  
>  required:
>    - compatible
> -  - ports
>  
>  if:
>    required:

-- 
Regards,

Laurent Pinchart
