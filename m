Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E804CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 10:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33454217F4
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 10:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbfKDKEL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 05:04:11 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36313 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfKDKEL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 05:04:11 -0500
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iRZDS-0003t8-MM; Mon, 04 Nov 2019 11:04:06 +0100
Message-ID: <b357f9fc50ea9e13fc06e0a07db2bbf1f14b8ef5.camel@pengutronix.de>
Subject: Re: [PATCH v5 09/10] media: hantro: add initial i.MX8MQ support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Date:   Mon, 04 Nov 2019 11:04:05 +0100
In-Reply-To: <ec9812f1-7592-b5e5-aa9c-8c37c3e8f630@xs4all.nl>
References: <20190612093915.18973-1-p.zabel@pengutronix.de>
         <20190612093915.18973-10-p.zabel@pengutronix.de>
         <ec9812f1-7592-b5e5-aa9c-8c37c3e8f630@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hans,

On Fri, 2019-10-25 at 10:01 +0200, Hans Verkuil wrote:
> Hi Philipp,
> 
> I'm marking this patch and the next 10/10 patch as 'Changes Requested' in
> patchwork. Please repost once you are ready to add i.MX8 support for this.
> 
> To be honest, I can't remember why the i.MX8MQ support hasn't been added yet.

I still have to get the i.MX8MM board to run this. Since i.MX8MM has the
Hantro cores in separate power domains, I expect the DT bindings have to
be changed.

regards
Philipp

