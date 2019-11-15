Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC23C432C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:21:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BCB22073C
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 16:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727635AbfKOQVC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 11:21:02 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33339 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfKOQVC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 11:21:02 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iVeL8-0003uL-50; Fri, 15 Nov 2019 17:20:54 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1iVeL7-00012y-SE; Fri, 15 Nov 2019 17:20:53 +0100
Date:   Fri, 15 Nov 2019 17:20:53 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Mark Brown <broonie@kernel.org>
Cc:     robh+dt@kernel.org, KCHSU0@nuvoton.com,
        thomas.fehrenbacher@siedle.de, kernel@pengutronix.de,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: nau8810: add aux input control, available on
 NAU8812
Message-ID: <20191115162053.fgsd45seg526gafv@pengutronix.de>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-4-m.felsch@pengutronix.de>
 <20191115161210.GB4210@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115161210.GB4210@sirena.co.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:15:40 up  7:34, 20 users,  load average: 0.13, 0.07, 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Mark,

On 19-11-15 16:12, Mark Brown wrote:
> On Fri, Nov 15, 2019 at 05:08:19PM +0100, Marco Felsch wrote:
> 
> > This commit adds the support to control the aux-port on the nau8812
> > devices. We don't need to differentiate the aux-port registers since
> > those bitfields are set to '0' on the nau8810 devices [1,2].
> 
> It'd still be better to only register these controls if the device isn't
> a nau8812 so that userspace doesn't see them.

That's the thing I tought about 10min.. Imagine that: You have an
embedded device with a very good codec driver (all codec controlls are
available) but the hw-guys didn't connect all the in-/outputs. So
switching those controls are useless too. IMHO this is exactly the same
thing here.

Regards,
  Marco
