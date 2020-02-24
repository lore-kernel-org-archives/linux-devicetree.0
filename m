Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F711C3567B
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 07:43:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 127452072D
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582530221;
	bh=e0jaSeqZM376UDVXHw0hgmq9BjN9Q0bkHXtY3Y1ogRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PlUlPExuwgDFc5E9Mz/xJH/J35l7h9YL2Y0zIUWmj56yUw57hic49VoIGlnQBcjKN
	 ekodO+O9qnblavgifRfXiBbuHoVdaP9EKAoDVtWK0zBmHSsMyy/6SBjz6Qx5T8amEr
	 VnLU+Z6FecEZkbAzC033eu/kMgy/pcPjulm6WigI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgBXHnk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 02:43:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:51484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgBXHnk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 24 Feb 2020 02:43:40 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4860D20675;
        Mon, 24 Feb 2020 07:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582530219;
        bh=e0jaSeqZM376UDVXHw0hgmq9BjN9Q0bkHXtY3Y1ogRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lQ76U4eHAyYXRaZ5OyNnILC0k5zxnC8LqTkL6oLvAkeIh6a2LbB5PM74r50GH55Nr
         r2xAj91lJix1cKeyx24jxAPwN+FKtzukh7kbu8WtopZO+LPgE9oHPKyqhw3g0xtPbG
         bZR9jvt4pW8Mu8A+PdtBdsCB3JkAUBv6rmy5fLVY=
Date:   Mon, 24 Feb 2020 15:43:33 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] ARM: dts: imx: make wdog node name generic
Message-ID: <20200224074332.GX27688@dragon>
References: <1582251200-15562-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582251200-15562-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 21, 2020 at 10:13:20AM +0800, Anson Huang wrote:
> Node name should be generic, use "watchdog" instead of "wdog" for
> wdog nodes.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
