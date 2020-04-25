Return-Path: <SRS0=EFsK=6J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1B6C2BA1A
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 00:48:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C50B20857
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 00:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587775731;
	bh=eD2lkS1AtW+Wg0mPsmtRaci8d1euaDf6xsjtaP/gBWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=D4K32+D3Peb00jcgsWM6xIoE5PIAlzTvytvQ5Oqg5m2Krhd4aeL2Sr9lAuq22eF4j
	 8UILEuG/uMOWcBPncPKrvXUBlWdRL1FMKfSG9dqpqBzU/MYtUkzC/hdrHdDo9TPU4h
	 5gJtrvXYdz3Z8oxAWTJIMKN9ToTsQMhymg8584j4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgDYAsu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Apr 2020 20:48:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:33408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbgDYAsu (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Apr 2020 20:48:50 -0400
Received: from dragon (unknown [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2858F2076C;
        Sat, 25 Apr 2020 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587775730;
        bh=eD2lkS1AtW+Wg0mPsmtRaci8d1euaDf6xsjtaP/gBWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Num4sbIzgP3MZEsaxwl0zYPFaPrXyl4eEhFr/JXs2OrYA8LQPntmyX2/H18eos1Bh
         YqHYii9JyvgFR9udKmHE4O7rRmagSiK8zzGgwa6lvUfi3YabOq01gnmNJ8Db9xNZKG
         F6UqJXWnIkHejnCYCnePLSjYGpBTjtJ04S1v23j4=
Date:   Sat, 25 Apr 2020 08:48:37 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        festevam@gmail.com
Subject: Re: [PATCH] dts: ARM: e60k02: add interrupt for PMIC
Message-ID: <20200425004836.GI8571@dragon>
References: <20200329104250.15194-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200329104250.15194-1-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Mar 29, 2020 at 12:42:50PM +0200, Andreas Kemnade wrote:
> Since the PMIC driver now has IRQ handling, add the GPIO to
> listen to things like RTC alarm or ADC conversion completion.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Subject should be prefixed like 'ARM: dts: ...'

I fixed it up and applied the patch.

Shawn
