Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FB4C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 04:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD74120781
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 04:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587442197;
	bh=vVgjWSj4t0zjuBGj/5XSxzINm4DTHP8FETFc8y1UveM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=vBEv/ickIeYRzDFrYf6dJjQ66g8eQgav+IGZBfpE3hlvMqXiLKlirpv4bKCHUwQdk
	 QWZiQM8se6QsuOepeBhPRiabfX6MfpFAHoUF2XIRL3ofi3o5LvIz5tWtmSqLvKCJOv
	 ACqox+s3m3edbt8xxk4wQRY4DNM9l00Dn545PEww=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgDUEJ5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 00:09:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgDUEJ5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 00:09:57 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3DDF206CD;
        Tue, 21 Apr 2020 04:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587442197;
        bh=vVgjWSj4t0zjuBGj/5XSxzINm4DTHP8FETFc8y1UveM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ExykRY9mHe/Aln2NddYbWVwcTzDJAWsP8CWtrzAF7RdmLiUkyimHD81+at419FqWT
         nX5UG5BEgozEhrEZotdBx0T+xAcNlIskvj0zdmPubCepG6bGJmgUYF0/mYkjG6foHC
         dVoaTnBdIeebASzJKpw5Nn9ZfNuEmduB7nEKKbx0=
Date:   Tue, 21 Apr 2020 12:09:50 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        David Jander <david@protonic.nl>, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 2/5] ARM: dts: add Protonic PRTI6Q board
Message-ID: <20200421040944.GF8571@dragon>
References: <20200324110432.25062-1-o.rempel@pengutronix.de>
 <20200324110432.25062-3-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324110432.25062-3-o.rempel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 24, 2020 at 12:04:29PM +0100, Oleksij Rempel wrote:
> Protonic PRTI6Q is a development board and a base class for different
> specific customer application boards based on the i.MX6 family of SoCs,
> developed by Protonic Holland.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/arm/fsl.yaml          |   1 +

Have bindings changes (all Protonic compatibles) in a separate patch.

Shawn
