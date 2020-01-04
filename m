Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049BEC00523
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:37:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C053F20866
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 00:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578098244;
	bh=w+DnMBG5f5m51ZCgawmyI1Mpraj+f/jr+3j7BeywOr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jVgmHGJA7Bfgknxd6oYstuiiwRoAMceiQkSqmVUigPdFfWPOVC49kq1hVUPvVt/ma
	 uZxBWF0lEF/fQPa74P95FB2soKQ/IhODYDjhG1Qw/xYsl/Lx2QmCDIpBMhwhT1RQZ9
	 pojl0RkYyMCviigppudlGIaXjyVC+jbCi32uxRfk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgADAhT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Jan 2020 19:37:19 -0500
Received: from mail-il1-f177.google.com ([209.85.166.177]:39754 "EHLO
        mail-il1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbgADAhT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Jan 2020 19:37:19 -0500
Received: by mail-il1-f177.google.com with SMTP id x5so38017364ila.6
        for <devicetree@vger.kernel.org>; Fri, 03 Jan 2020 16:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DyH66go0qsvcEZgmTI6bctw9NNe8CYLjRZjlFnsO2lI=;
        b=UDglMDdlyRrw1jFoiF+YY2IQThUyVLVG6hq74IjA05G7vSNAypqrdQ36O0wJq4ztPZ
         zNOM09fMAC3msHxYSb/p5FOtdTnOPxtAAmPqfgxpF9wwwkjCCaEhLfJdCLgnYpy+/IOW
         XBoT8kiQDFX/7Mp96ejRYKqM9ko27gMboT+HL6W2UxRJ+hUgJIsN/o8jaPOSSeya2gFc
         mk5Q9jTx+6v5crNJ4shl07b8S1PLM/uTQPiw7S/i9OTAzmQY6dR7dtnYK74xKDV/nZM2
         K+HXAOq4IdBdvhFioes6Lxus6iU1VPnbaktd7vODGy9iXgXIrzSAYqJiBkGprjgWNLKE
         5X3Q==
X-Gm-Message-State: APjAAAV9EVzIZU0od/PGNOWwmQFETZwTjnCXOX6Vb/b5MwT1w5lsa1Yz
        4ViGuJFrtFRZMijmh3oHRD64cjM=
X-Google-Smtp-Source: APXvYqzN4fZBGifBkeOhHwyapBsAtMXlQnr1vGmYyMVvm6PUX5OmfS5Fxe5MBXiW4r6WbNdVkzg5Hg==
X-Received: by 2002:a92:4e:: with SMTP id 75mr76312856ila.276.1578098238674;
        Fri, 03 Jan 2020 16:37:18 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id j79sm21584785ila.52.2020.01.03.16.37.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:37:17 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:37:17 -0700
Date:   Fri, 3 Jan 2020 17:37:17 -0700
From:   Rob Herring <robh@kernel.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [Patch V3 01/18] dt-bindings: phy: tegra-xusb: Add
 usb-role-switch
Message-ID: <20200104003717.GA11747@bogus>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
 <1577704195-2535-2-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577704195-2535-2-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 30 Dec 2019 16:39:38 +0530, Nagarjuna Kristam wrote:
> Add usb-role-switch property for Tegra210 and Tegra186 platforms. This
> entry is used by XUSB pad controller driver to register for role changes
> for OTG/Peripheral capable USB 2 ports.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> V3:
>  - Added Acked-by updates to commit message.
> ---
> V2:
>  - Moved usb-role-switch to seperate Required section as suggested by Thierry.
>  - Added reference to usb/usb-conn-gpio.txt for connector subnode.
> ---
>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
