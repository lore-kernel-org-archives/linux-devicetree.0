Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E125CC10F25
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 07:44:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B631920873
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 07:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583912649;
	bh=+KyRlV2jiWd0oJcPNhfaoXeqN5z9XYcvHTTz8nuuRz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gCyahnI9TAxR19/qU/xsxxIP3JtvABWMFLs4z/lIGzNUi8oCkJmOooDxc/M/3fWjI
	 oGkhpLJqA0WjMKy9c/PznToav6lX4LlhT6oNdmeAKMz3mV6lfDPOz5mOTJOpkHNmVt
	 l/XXy7xA0xFS2ZhEi87wL+xYgpm1zKscuef5BB10=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgCKHoJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 03:44:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:46542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728146AbgCKHoJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 03:44:09 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC15C20578;
        Wed, 11 Mar 2020 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583912648;
        bh=+KyRlV2jiWd0oJcPNhfaoXeqN5z9XYcvHTTz8nuuRz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dbuwx1Pe3m+xyRW7tFy+IMR3iWMXreENd3PhWBInTks5XsFBOIBiAiVFanqhmsj1c
         +ZDUT2IyLjt7OH/F5iof3Q0m6z8A4TU2Vfb6y2XhpCmSDzx41OvY4GeW44ogIqpH4O
         2OdOckaivbA8AmpGQVDWYKUcVePloLF3IplZGzsU=
Date:   Wed, 11 Mar 2020 15:44:03 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: lx2160a-cex7: add on-module eeproms
Message-ID: <20200311074402.GT29269@dragon>
References: <E1j7Hvv-0004Vy-BO@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1j7Hvv-0004Vy-BO@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 27, 2020 at 12:06:27PM +0000, Russell King wrote:
> From: Rabeeh Khoury <rabeeh@solid-run.com>
> 
> This patch adds 4 eeprom support on i2c mux channel #0 -
> 1. Bootable 512Kbit eeprom at address 0x50.
> 2. Memory SO-DIMMs SPD channels at 0x51 (upper SO-DIMM) and 0x53.
> 3. 2Kb eeprom at 0x57 will be used by SolidRun to hold manufacturing
>    data.
> 
> Signed-off-by: Rabeeh Khoury <rabeeh@solid-run.com>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied, thanks.
