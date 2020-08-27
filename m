Return-Path: <SRS0=DNiR=CF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE5BC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 20:18:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6F2120786
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Aug 2020 20:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgH0USB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Aug 2020 16:18:01 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:56894 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgH0USB (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 27 Aug 2020 16:18:01 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kBOLD-00C9Xz-SK; Thu, 27 Aug 2020 22:17:47 +0200
Date:   Thu, 27 Aug 2020 22:17:47 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     f.fainelli@gmail.com, hkallweit1@gmail.com, davem@davemloft.net,
        robh@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 2/2] net: phy: DP83822: Add ability to
 advertise Fiber connection
Message-ID: <20200827201747.GX2403519@lunn.ch>
References: <20200827134509.23854-1-dmurphy@ti.com>
 <20200827134509.23854-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827134509.23854-3-dmurphy@ti.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Aug 27, 2020 at 08:45:09AM -0500, Dan Murphy wrote:
> The DP83822 can be configured to use a Fiber connection.  The strap
> register is read to determine if the device has been configured to use
> a fiber connection.  With the fiber connection the PHY can be configured
> to detect whether the fiber connection is active by either a high signal
> or a low signal.
> 
> Fiber mode is only applicable to the DP83822 so rework the PHY match
> table so that non-fiber PHYs can still use the same driver but not call
> or use any of the fiber features.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
