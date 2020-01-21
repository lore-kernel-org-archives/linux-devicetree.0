Return-Path: <SRS0=tTw7=3K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CC4C2D0CE
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 22:42:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64CD524655
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jan 2020 22:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ewrOpBss"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgAUWmZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Jan 2020 17:42:25 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:33040 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgAUWmY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Jan 2020 17:42:24 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF15952A;
        Tue, 21 Jan 2020 23:42:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1579646543;
        bh=ljRZq7iJy7qF55eMw9jVKUOMCGOdJiZTD8j4G9n8b/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ewrOpBsswfVGPPPFB2rqpA1TUhwS7+MnXrGoQIjJVbHB8BiWc79ShypILyVNYQRse
         jLOeDY0q85J2MsaM2FNn5wR5kyNkpXrKgIXGhmFivLpgcf6BZHAJQTMqCY43yvvbmi
         dkVi9V40ff9IXUNjXTy0Y2lr8hrQ+GuecUohRAgg=
Date:   Wed, 22 Jan 2020 00:42:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: OK to relicense text from display-timings.txt?
Message-ID: <20200121224207.GJ5003@pendragon.ideasonboard.com>
References: <20200121211421.GA15494@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200121211421.GA15494@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Sam,

On Tue, Jan 21, 2020 at 10:14:21PM +0100, Sam Ravnborg wrote:
> Hi Steffen/Philipp.
> 
> In commit:
> cc3f414cf2e404130584b63d373161ba6fd24bc2 ("video: add of helper for display timings/videomode")
> 
> You added display-timings.txt - which include a nice drawing that explains
> the timing signals.
> 
> I am working on a DT schema variant of the same - see:
> https://www.spinics.net/lists/devicetree/msg331526.html
> 
> In the revised version the preferred license is:
> (GPL-2.0-only OR BSD-2-Clause)
> 
> Is it OK to re-license to (GPL-2.0-only OR BSD-2-Clause) in the
> DT schema variant?
> 
> 
> Hi Peter.
> 
> You contributed with following patch:
> 86f46565dff313a149b4bd09d4a8655274ef8f33 ("dt-bindings: display: display-timing: Add property to configure sync drive edge")
> 
> Part of the text is re-used in the panel-timing.yaml file.
> OK to relicense?
> 
> 
> Hi Laurent.
> 
> You contributed the following patch:
> 9cad9c95d7e8d6d61d8c9729e0b6bbd18f47d86d ("Documentation: DocBook DRM framework documentation")
> This patch added a nice timing diagram - which Daniel Vetter later moved to drm_modes.h.
> 
> The timing diagram is re-used in panel-timing.yaml.
> As the original author are you OK that this is relicensed?

I'm usually not a fan of BSD licenses, but for DT bindings this is fine
with me.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Note: I need positive reply from all of you to re-license.
> In case I get it your postive feedback it will be documented in
> the commit message for panel-timing.
> To keep a record for the background for the re-licensing.

-- 
Regards,

Laurent Pinchart
