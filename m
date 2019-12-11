Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BFAC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 09:16:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80382214D8
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576055801;
	bh=kOERCDjA00aG8Ioga+ne2Tj7EeKJabiHflhZVyi4e10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GlkyIF2ui+vzxEaOLLvM9QZSy/yj5AUEkUE0k2Fgf8YYqBI4dTm7l4pz+/VV1nVWH
	 3ua2/Zct1e9JwGM+PvHEg89J594j9T7cC0Fr8iJm/h+0S/X5Je0ji9s0LfRRc5w30Q
	 TzCf9DKCxocR/pcci0njYbFoz6vHpbIAM4DNcGD4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfLKJQl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 04:16:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:59722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbfLKJQk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 04:16:40 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3CE58214AF;
        Wed, 11 Dec 2019 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576055800;
        bh=kOERCDjA00aG8Ioga+ne2Tj7EeKJabiHflhZVyi4e10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QCuTKGDstLhwyH6nYr4xaDdAtGMJHSs3zygvBjfCESAPG1VH0oEh7xCT0xUFent04
         ltKTQTEWfkcdZe+a0Gbcc0ETgWEbaKXazF5vaTslmStBrW1KcQwlpVoCf8B0KB3+rG
         6lYgkRrsYWCvoJBn3dGPb8m8gq+Ax4WVPFC42sPM=
Date:   Wed, 11 Dec 2019 17:16:30 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Yuantian Tang <andy.tang@nxp.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: ls1028a: fix typo in TMU calibration
 data
Message-ID: <20191211091630.GV15858@dragon>
References: <20191209234350.18994-1-michael@walle.cc>
 <20191209234350.18994-2-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209234350.18994-2-michael@walle.cc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 10, 2019 at 12:43:46AM +0100, Michael Walle wrote:
> The temperature sensor may jump backwards because there is a wrong
> calibration value. Both values have to be monotonically increasing.
> Fix it.
> 
> This was tested on a custom board.
> 
> Fixes: 571cebfe8e2b ("arm64: dts: ls1028a: Add Thermal Monitor Unit node")
> Signed-off-by: Michael Walle <michael@walle.cc>
> Acked-by: Tang Yuantian <andy.tang@nxp.com>

Applied, thanks.
