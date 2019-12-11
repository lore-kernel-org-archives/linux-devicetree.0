Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB723C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 02:37:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE4112077B
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 02:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576031867;
	bh=U8f1XcZK3n6lSl5R6lQHzlwPeNFYsDJY2wujLIgOgzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ycpbn+uw8s0hEd8PwYIVnF3U+Utg2Am0VhqHfh4pW8YzuAfTys8Yl0NFsNcsoW5hM
	 e2U4LyPy4TW84aK1sgkNp/txQbnrc03++cqf6wubOf96cMUnqOABw4m9lyOMyOSFZP
	 y0BSY6enwUZQNcHqd0RMp+mI/DaPuYRzcXRfngrc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfLKChr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 21:37:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:59586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727656AbfLKChr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 10 Dec 2019 21:37:47 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAC8E205ED;
        Wed, 11 Dec 2019 02:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576031866;
        bh=U8f1XcZK3n6lSl5R6lQHzlwPeNFYsDJY2wujLIgOgzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rWN08mI7F053i2jf5SNTd8dUIADCnpj4/50DSSEvKtWSB3EK/oddoKp6ph4bwGpAI
         +JXPoWFuQ5NvFb22jA1Rkz/c/xc84q1rekUPcYfzpjZZrxOCuKX+b6Q5NfsRFPU0gj
         T93+0G6f3NKGIWdq1gzTucfgqGRyGFj8IheACLaA=
Date:   Wed, 11 Dec 2019 10:37:38 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Subject: Re: [PATCH RESEND 1/1] ARM: dts: imx7s: Add power domain for imx7d
 HSIC
Message-ID: <20191211023737.GE15858@dragon>
References: <1575342112-14702-1-git-send-email-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1575342112-14702-1-git-send-email-peter.chen@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 03, 2019 at 11:01:52AM +0800, Peter Chen wrote:
> Otherwise, the system will hang if USB driver try to access
> portsc register.
> 
> Cc: André Draszik <git@andred.net>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Applied, thanks.
