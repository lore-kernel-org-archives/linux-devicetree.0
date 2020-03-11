Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501B9C10F25
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 07:43:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24A9B21D56
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583912601;
	bh=eb6X39X/EDrlVTNIumxU0I8Ahmihb5TtN/ubR16x01U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zxV0roMJeaTbKc6cG053YkFz1BMVuar24unp6802JuMfY9nyHyOdaA1I1IqmUvQ0Y
	 X9X+qnuIjMbPO0w2q8Ec/HzafzizdFSBwUO82mhsGpPlskUL1135qWrSy3VNbY9+h2
	 S8WDmyZahr0SxV7VuihzoNe3HXlWYJwmJwSi+7ck=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgCKHnU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 03:43:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:46252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbgCKHnU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 03:43:20 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76BD520578;
        Wed, 11 Mar 2020 07:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583912600;
        bh=eb6X39X/EDrlVTNIumxU0I8Ahmihb5TtN/ubR16x01U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=beALctgQujcAortLMexlUJW267GT3Z/xzHrgHX63e8Lk8Sm2TH8L2qD1dKeXqbAYe
         TrDe8YzRPcF8KZKOYC4Zkf6l/LA9IXwM/6MT8ifEk538EI0sfqDC/zXjHgz0mvQmur
         DNMraLsm0zoWhgZfXn4r/Tt62Zl0ughWyG3nV0Qc=
Date:   Wed, 11 Mar 2020 15:43:15 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: lx2160a-cex7: add support for ltc3882
 regulator
Message-ID: <20200311074314.GS29269@dragon>
References: <E1j7Hvq-0004Vn-5w@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1j7Hvq-0004Vn-5w@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 27, 2020 at 12:06:22PM +0000, Russell King wrote:
> Add support for the LTC3882 regulator so that the hardware monitoring
> can be used with this device.  This regulator provides the 0.78V
> supply for the LX2160A.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied, thanks.
