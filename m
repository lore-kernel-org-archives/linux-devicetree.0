Return-Path: <SRS0=lLbR=3C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B35BC33CAF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66576207FF
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jan 2020 22:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578954771;
	bh=qkihO5UblxyVXs4iUDvJZHK6ncEi1amhW/NsbryE1m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=s9vEDyG/MuGyHJpcmiD65aZQ3kUMXaWCMCzYKviAQIf5rQ3alvxNqFyqn0U2xyRHl
	 DLewmTK/TvL43rkhMkHlYbUxst8uYwcGaNzm842cl0zmgxybxSDviDgoGpbFFzydM3
	 Gparw9UddBZjtnN27gGIKhvPM9KHyVZlhel5SGNg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgAMWcu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jan 2020 17:32:50 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46191 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728800AbgAMWct (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jan 2020 17:32:49 -0500
Received: by mail-ot1-f67.google.com with SMTP id r9so10581179otp.13
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 14:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8OSe8nCMD8zFTJxmKCShhLga5sECo0uXyDP7h9INGG4=;
        b=oekmpOHJHoHlKgyqeDnXi02TbJkSZbJLTkSWGTZhRgMFZrr/aSOjog3PYL0SIV68z3
         X9llRDOMM1J1e3Xaf1ZM5gjGPYA8yOatIsqyoYl/UxxxNWmA7fRCozmJ60VgMrD9BZSO
         zkXAGspktCsDGnR5qNzkqmdMpuGsg2Z3+iHVEeiJALTds1rtYblCxlC66exCohGv/Sns
         qNGZkfYnqE7B8mvSCCz2FwtndUmn6FODc2D2/VhTsojwrKv6bGioHPJuPLmG1OQAf0Lk
         aWTAVM2x5A+BWfAjWR+CMO0Qcid830fLc6TfNOPe5VdJSs5/0TwvRvO45qVCmwS/xsMq
         gefg==
X-Gm-Message-State: APjAAAXvKjT1jb+JvxmU3i0J839GttsuNewjem8vmmMizQ6kRjW7ymZt
        /jQsvnrHBvBb4xOZ8hmMzzWnmug=
X-Google-Smtp-Source: APXvYqw45Obqp5moixyzrsLr5l1ECE+ECgehS8mbVoLoPFZFgjk0IDwX2fBjW0HFRHigflE2iIZHpw==
X-Received: by 2002:a9d:4c94:: with SMTP id m20mr15132583otf.341.1578954768123;
        Mon, 13 Jan 2020 14:32:48 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g8sm4576656otq.19.2020.01.13.14.32.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:32:47 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219d1
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:32:46 -0600
Date:   Mon, 13 Jan 2020 16:32:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alex Riesen <alexander.riesen@cetitec.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/8] dt-bindings: adv748x: add information about serial
 audio  interface (I2S/TDM)
Message-ID: <20200113223246.GA22019@bogus>
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141550.GH3606@pflmari>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113141550.GH3606@pflmari>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 13 Jan 2020 15:15:50 +0100, Alex Riesen wrote:
> As the driver has some support for the audio interface of the device,
> the bindings file should mention it.
> 
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt       | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
