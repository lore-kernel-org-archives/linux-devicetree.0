Return-Path: <SRS0=+eHa=B3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8FEC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 13:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96FD32075B
	for <linux-devicetree@archiver.kernel.org>; Mon, 17 Aug 2020 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597670955;
	bh=BymKps12XsZQl4YKZ1c0eB9rH+lInt76AzC41AOqUvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AGyZ38I7CmKDWFfH/ogrFj6ki8XhuEospd91HvXOQPkZrUzmRLfgpYovAijzhEEWM
	 6eKzQiTBib4DxrvBwVmyofNIAW7v8Pt6oeefjN8wd1dVwQ+gxjRgfG+12wAobka+8j
	 jOqAzvYUmqYppWG7DdfiSrIPMXHExuwUM/f9Ac6I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgHQN3O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 17 Aug 2020 09:29:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728358AbgHQN3O (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 17 Aug 2020 09:29:14 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85F8D2072D;
        Mon, 17 Aug 2020 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597670953;
        bh=BymKps12XsZQl4YKZ1c0eB9rH+lInt76AzC41AOqUvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wpv5465BkVtFkvEjq8ovwgg4Ym9eooROzit5pFuUECfQjFRTG1KLS8YItLAfTi+ad
         V9ROkqnVpc3j67L3rgYU7thJeb9JGWCKI/JCqzkZhlRLgMjQRn3WzhRmQs5JuGHa3G
         r+SwuGpuGeix5DRooPEVYZg8yLmPs8pz7FGFBMcc=
Date:   Mon, 17 Aug 2020 21:29:04 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Chris Healy <cphealy@gmail.com>
Cc:     s.hauer@pengutronix.de, stefan@agner.ch, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, festevam@gmail.com
Subject: Re: [PATCH v2] ARM: dts: ZII: Disable HW Ethernet switch reset GPIOs
Message-ID: <20200817132903.GG16951@dragon>
References: <20200722203341.578651-1-cphealy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722203341.578651-1-cphealy@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 22, 2020 at 01:33:41PM -0700, Chris Healy wrote:
> From: Chris Healy <cphealy@gmail.com>
> 
> Disable Ethernet switch reset GPIO with ZII platforms that have it
> enabled.  HW switch reset results in a reset of the copper PHYs
> inside of the switch.  We want to avoid this reset of the copper PHYs
> in the switch as this results in unnecessary broader network disruption on
> a soft reboot of the application processor.
> 
> With the HW GPIO removed, the switch driver still performs a soft reset of
> the switch core which has been shown to sufficiently meet our needs with
> other ZII platforms that do not have the HW switch reset GPIO defined. 
> 
> Signed-off-by: Chris Healy <cphealy@gmail.com>

Applied, thanks.
