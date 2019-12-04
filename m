Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC6AC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 02:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A7E220640
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 02:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575427561;
	bh=wlwTunRJ1oqhEAb1RU9crMmxCYCSQE4VrOn1tevulBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=k7LqKKMhMSZ3e7mp1GMEfDR2G5NLd1Nw7e89PKVyoQWlqX2aTIZge5KRG+SelA026
	 s0LGTydFoDFLfsVOJcsykXYtvcmbfQ5/x9+go//+xo265ho2g40H+oiiG4+zrYMB0e
	 8W5eX2+e/MNC6fqr4Nm4xtbX3jBVoy7OdZEg8WiQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfLDCqB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 21:46:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:40152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726291AbfLDCqB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Dec 2019 21:46:01 -0500
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A589120637;
        Wed,  4 Dec 2019 02:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575427560;
        bh=wlwTunRJ1oqhEAb1RU9crMmxCYCSQE4VrOn1tevulBE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RW/SpBg7OR/CkTFgMyPpgDwkv2dVJwp5AvGgDYalGyMXbFrTIEG+jBlOd8tdpSZ6/
         JMWhDrsqrGMfdmcziO5n9tl5q/ZWJl+9BOsYt3nbm4MQElIK6z2rnfLODhSqBfrY5f
         qSjpavQ+Po6H71AHXt2HdaSkHzNWeUTebTD230ro=
Date:   Wed, 4 Dec 2019 10:45:48 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] ARM: dts: imx6q-logicpd: Enable ili2117a Touchscreen
Message-ID: <20191204024547.GP9767@dragon>
References: <20191106142308.10511-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106142308.10511-1-aford173@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 06, 2019 at 08:23:08AM -0600, Adam Ford wrote:
> The LCD used with the imx6q-logicpd board has an integrated
> ili2117a touch controller connected to i2c1.
> 
> This patch adds the node to enable this feature.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied, thanks.
