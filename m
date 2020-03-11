Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F054C10F25
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 07:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8A5320873
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583912787;
	bh=wPWavU0XnNFcX/SZ6TFjnJus+JRvVZy3+xSxDbg/boM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=u7qpqvw6fvQgqLQ0FjNP7JkFpcE9LI1Ma1lgkO1IGXI1vLhhSFjjBhZhEUCrXFN3S
	 1oBEjvJY/Whw0ZjbWJ3w4joaDZgQDvn0SnsZk6TFcy7+euv2swym9v1GyscCHAq1Yx
	 mp5NN4aqDEEiwSEFG0Aw9QwIfJ4nl81umU0OOiQ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCKHq1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 03:46:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:47366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgCKHq1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 03:46:27 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B27B9206B7;
        Wed, 11 Mar 2020 07:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583912786;
        bh=wPWavU0XnNFcX/SZ6TFjnJus+JRvVZy3+xSxDbg/boM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h+4oCQZiitlQdZsnfxzykvSh+zavohpJ0bhv88o/Z8aQdiDBJPrjQ6u9vn/ze5HZy
         bcDa55DQjSL/qM6V0RtxfCMBcc4+qv7LE5FC34a2UYQppOJosBWSzFS6RyKS481isn
         O9wTYS+JNCD+0gBBv9SFTHBEC3aAr6VR94ZM/XDk=
Date:   Wed, 11 Mar 2020 15:46:18 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: imx6qdl-sr-som-ti: indicate powering off wifi
 is safe
Message-ID: <20200311074617.GU29269@dragon>
References: <E1j7I7v-0004dS-5u@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1j7I7v-0004dS-5u@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 27, 2020 at 12:18:51PM +0000, Russell King wrote:
> We need to indicate that powering off the TI WiFi is safe, to avoid:
> 
> wl18xx_driver wl18xx.2.auto: Unbalanced pm_runtime_enable!
> wl1271_sdio mmc0:0001:2: wl12xx_sdio_power_on: failed to get_sync(-13)
> 
> which prevents the WiFi being functional.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied, thanks.
