Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE912C32771
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 07:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAD7824655
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 07:44:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgAVHoX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 02:44:23 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43197 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgAVHoX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 02:44:23 -0500
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <str@pengutronix.de>)
        id 1iuAgT-0005KZ-NX; Wed, 22 Jan 2020 08:44:17 +0100
Received: from str by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <str@pengutronix.de>)
        id 1iuAgS-0004jx-MU; Wed, 22 Jan 2020 08:44:16 +0100
Date:   Wed, 22 Jan 2020 08:44:16 +0100
From:   Steffen Trumtrar <s.trumtrar@pengutronix.de>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: OK to relicense text from display-timings.txt?
Message-ID: <20200122074416.GA6520@pengutronix.de>
References: <20200121211421.GA15494@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121211421.GA15494@ravnborg.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:42:07 up 132 days, 20:30, 293 users,  load average: 1.90, 2.66,
 4.36
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: str@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
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

Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de> 


Best regards,
Steffen

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
> 
> 
> Note: I need positive reply from all of you to re-license.
> In case I get it your postive feedback it will be documented in
> the commit message for panel-timing.
> To keep a record for the background for the re-licensing.
> 
> 	Sam
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
