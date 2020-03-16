Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78191C10DCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 01:16:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 425FF206B1
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 01:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584321387;
	bh=K/2TyTWuO7HMKTMpKR0lHTm952L2DxBq1R6oWuYbQbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=izYXG0ESBU/Ek8zANUUfzMY52eQeb0DS1YoukIGhY27OUVupptxhL4aGUezsPKM42
	 DwbqYncvdBesvyoRe2KOEs6HN2/FMklG/pI9qtt0UVfqyWrfQVG4rGaCD44MqujHnA
	 xoFMZgqRFwnvDYjzEsqQ9RYZMS+5nBUbbyMyGGrk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgCPBQ0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 15 Mar 2020 21:16:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:55948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729300AbgCPBQ0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 15 Mar 2020 21:16:26 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A850620663;
        Mon, 16 Mar 2020 01:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584321386;
        bh=K/2TyTWuO7HMKTMpKR0lHTm952L2DxBq1R6oWuYbQbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tu3qyTlZGxxvR5ZetlNI0bbW26PcCKHp7Yn33e9SInPwRHln6DUKyYEXSntj+/aS2
         0UGQQ7DseT+64bEYGCypHa1XQtQKheTfwSNcyAaiUn0U34hjBiFaxqAC2xWVbWo4gb
         Aq6Jx6v9xX6dmW9q1gTp/9H9/qCPYn0Z2qiTGUkE=
Date:   Mon, 16 Mar 2020 09:16:20 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: ls1028a: various sl28 fixes/updates
Message-ID: <20200316011620.GM17221@dragon>
References: <20200311074929.19569-1-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311074929.19569-1-michael@walle.cc>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Mar 11, 2020 at 08:49:25AM +0100, Michael Walle wrote:
> Hi,
> 
> this patchset contains device tree fixes and updates for the Kontron
> SMARC-sAL28 board.
> 
> Changes since v1:
>  - added "arm64: dts: freescale: sl28: add SPI flash" which was forgotten
>    in the first series.
> 
> Michael Walle (4):
>   arm64: dts: freescale: sl28: add SPI flash
>   arm64: dts: ls1028a: sl28: fix on-board EEPROMS
>   arm64: dts: ls1028a: sl28: expose switch ports in KBox A-230-LS
>   arm64: dts: ls1028a: sl28: add support for variant 2

Applied all, thanks.
