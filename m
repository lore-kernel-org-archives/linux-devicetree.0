Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4E0CA9EB6
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 16:43:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F43521872
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 16:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405279AbfJWQny (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 12:43:54 -0400
Received: from muru.com ([72.249.23.125]:39418 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730796AbfJWQny (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 23 Oct 2019 12:43:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D344380CF;
        Wed, 23 Oct 2019 16:44:28 +0000 (UTC)
Date:   Wed, 23 Oct 2019 09:43:50 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     yegorslists@googlemail.com
Cc:     linux-omap@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        bcousson@baylibre.com
Subject: Re: [PATCH 1/3] ARM: dts: add DTS for NetCAN Plus devices
Message-ID: <20191023164350.GM5610@atomide.com>
References: <20191022072130.17438-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022072130.17438-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

* yegorslists@googlemail.com <yegorslists@googlemail.com> [191022 00:22]:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This DTS file covers both NetCAN Plus 110 and 120 WLAN models.

Thanks applying all three into omap-for-v5.5/dt.

Tony
