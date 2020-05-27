Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E39BC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 14:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3389C2073B
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 14:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgE0OLF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 10:11:05 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:38607 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgE0OLF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 May 2020 10:11:05 -0400
X-Originating-IP: 93.23.196.54
Received: from localhost.localdomain (54.196.23.93.rev.sfr.net [93.23.196.54])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 995B11BF216;
        Wed, 27 May 2020 14:11:01 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        linux-mtd@lists.infradead.org
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [RESEND v5 06/21] mtd: rawnand: Add an invalid ECC mode to discriminate with valid ones
Date:   Wed, 27 May 2020 16:11:00 +0200
Message-Id: <20200527141100.23764-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200526195633.11543-7-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 086624b9b8c4872e7cf78a2add290138ba58710f
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 2020-05-26 at 19:56:18 UTC, Miquel Raynal wrote:
> NAND ECC modes (or providers) have their own enumeration but, unlike
> their algorithms counterpart, there is no invalid or uninitialized
> value to discriminate between an error and having chosen a no-ECC
> situation. Add an "invalid" entry for this purpose.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel
