Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3DCC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 08:52:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 535E724672
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 08:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgAVIws convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 03:52:48 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34339 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgAVIws (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 03:52:48 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iuBkh-0004yi-9T; Wed, 22 Jan 2020 09:52:43 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iuBkg-0003Dq-Ak; Wed, 22 Jan 2020 09:52:42 +0100
Message-ID: <1f23898897af5ad0ec2be82cb4c7bd32657e4c8b.camel@pengutronix.de>
Subject: Re: OK to relicense text from display-timings.txt?
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        devicetree@vger.kernel.org
Date:   Wed, 22 Jan 2020 09:52:42 +0100
In-Reply-To: <20200122074416.GA6520@pengutronix.de>
References: <20200121211421.GA15494@ravnborg.org>
         <20200122074416.GA6520@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 2020-01-22 at 08:44 +0100, Steffen Trumtrar wrote:
> Hi Sam,
> 
> On Tue, Jan 21, 2020 at 10:14:21PM +0100, Sam Ravnborg wrote:
> > Hi Steffen/Philipp.
> > 
> > In commit:
> > cc3f414cf2e404130584b63d373161ba6fd24bc2 ("video: add of helper for display timings/videomode")
> > 
> > You added display-timings.txt - which include a nice drawing that explains
> > the timing signals.
> > 
> > I am working on a DT schema variant of the same - see:
> > https://www.spinics.net/lists/devicetree/msg331526.html
> > 
> > In the revised version the preferred license is:
> > (GPL-2.0-only OR BSD-2-Clause)
> > 
> > Is it OK to re-license to (GPL-2.0-only OR BSD-2-Clause) in the
> > DT schema variant?
> > 
> 
> Acked-by: Steffen Trumtrar <s.trumtrar@pengutronix.de> 

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
