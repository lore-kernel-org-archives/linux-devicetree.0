Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BBFC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 09:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A1C42464B
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 09:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576055820;
	bh=kj+qx89zaMyUD9oKXKDD+HUhzoTArIEgWz6C9wC7zmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=XAZxcaNkJkQ+c+xPBRkGhqRib3dkByI8Mk8rU79l6CK5p35xFGzoUmUKxj5M6XzDs
	 mpjN68S8RfCnkHOVaoXtm+CGdO8W/EaWVfGu7evKdvXkeMR5aajhPdTPi9cLcTRW2+
	 0ivE1uQ4v4dmP+GXJNmblEE70L9Fw0+v2G58ab64=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbfLKJQ7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 04:16:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:59972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728432AbfLKJQ7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Dec 2019 04:16:59 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA294214AF;
        Wed, 11 Dec 2019 09:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576055819;
        bh=kj+qx89zaMyUD9oKXKDD+HUhzoTArIEgWz6C9wC7zmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UP4FUUL+vK4L0G6KVpix9Cu83sXXr3LhOX75HqqwfyZJdiIqZ2nxINgjgJQTFtQ0g
         XyPTM3m8duiAKuetKlnjzRxmUyXSOpwqqYKBszj2ONjRN/ulR5TwCkkIHNWvdjqcsC
         RYGUhxOKFHMmOL6AJt81RihL9VxD04513YFRPOAA=
Date:   Wed, 11 Dec 2019 17:16:50 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Michael Walle <michael@walle.cc>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Yuantian Tang <andy.tang@nxp.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: ls1028a: add missing sai nodes
Message-ID: <20191211091649.GW15858@dragon>
References: <20191209234350.18994-1-michael@walle.cc>
 <20191209234350.18994-3-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209234350.18994-3-michael@walle.cc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 10, 2019 at 12:43:47AM +0100, Michael Walle wrote:
> The LS1028A has six SAI cores.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied, thanks.
