Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5C4C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 23:45:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 398132465E
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 23:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576799127;
	bh=NGy45U9sLs8EFP+KO9rDavGV+YX6tWDybnj00qXdXS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FByYed0BMT/oU7CTguaz4IrmDelXYBG0Aresm1B9cXd2U3dNUNomp3HvKrAhSq8NX
	 hbt1ZYUD3oFyvB1zb2Hlv69g0L4mIK5VuYLDvXlbtRmEm+Bo9HWfKfjZ92BTa5bwAR
	 WyCe09T8EffV++kfU51nux5UkFiEiOcNqVi9hLX0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfLSXp0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 18:45:26 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36806 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbfLSXp0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 18:45:26 -0500
Received: by mail-ot1-f66.google.com with SMTP id w1so9366859otg.3
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 15:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CPTZbnsZwMAdm3+ywA9AmFZNzHoVlF3t8i/+Bbatuus=;
        b=AbwDghDVzBriIRJs72mvl9Tm6o0AtILKfBrjaLolXhxUJn5K/KxWLjEP+IoFIuvS/8
         Twk3eQhEHXiKk+9q0Rpn6mNDlun2IaI9kH6TcXYFtNVk6NlpLbM9/ydrigkOMTk97BHe
         gUFQybUcXi8t9ECNp6WG1qI+yio2brJk06RZkjLm1NhBOzSYwt//56Bjm43jWG5bvnkG
         +UwhBem46gV4duZM6GQdFyAeuZK1pGyedgiw17PIVR1UZ5Ysc8BRkrNqkocs4uruzkNz
         gjvtN1Hrrmt3Cb7IWaza0u+ENnf2rNm8pP+BxccaNw/JQOIxPZOThUPrTwnIhQw6edTV
         eYjA==
X-Gm-Message-State: APjAAAXa0bj1gAahkYNvaSxydvz/vE0AaQM0b8IlS+CnR0xpwGcs7AZG
        xfT4YIpdkzbbZbqwsO1vnw==
X-Google-Smtp-Source: APXvYqzPrntJQUPYSBFKGHAAmivi/dtE3tpOOaqLhKu8OeZYLW39N4PiJJx99SeXD52l7Rmf2JkyHg==
X-Received: by 2002:a05:6830:1116:: with SMTP id w22mr11981631otq.216.1576799125808;
        Thu, 19 Dec 2019 15:45:25 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id 47sm2730192otf.54.2019.12.19.15.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:45:25 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:45:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] dt-bindings: phy: Use a real life PX30 DSI PHY
 example
Message-ID: <20191219234415.GA22014@bogus>
References: <20191213180019.25080-1-miquel.raynal@bootlin.com>
 <20191213180019.25080-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213180019.25080-2-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Dec 13, 2019 at 07:00:19PM +0100, Miquel Raynal wrote:
> Update the example phandles to reference actual nodes and give a
> working starting point.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
> index 72aca81e8959..2e35bfdf47a1 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip,px30-dsi-dphy.yaml
> @@ -60,9 +60,9 @@ examples:
>      dsi_dphy: phy@ff2e0000 {
>          compatible = "rockchip,px30-dsi-dphy";
>          reg = <0x0 0xff2e0000 0x0 0x10000>;
> -        clocks = <&pmucru 13>, <&cru 12>;
> +        clocks = <&pmucru SCLK_MIPIDSIPHY_REF>, <&cru PCLK_MIPIDSIPHY>;
>          clock-names = "ref", "pclk";
> -        resets = <&cru 12>;
> +        resets = <&cru SRST_MIPIDSIPHY_P>;

Without the appropriate include files, this will break building the 
example.

>          reset-names = "apb";
>          #phy-cells = <0>;
>      };
> -- 
> 2.20.1
> 
