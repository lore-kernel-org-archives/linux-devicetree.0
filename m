Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66835C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 16:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3036F22B48
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583339741;
	bh=tOFJvLY9RH4hMUR4uSuuD0+HIcm6GvVBhY9luIFNp0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=a5SKYRCC4SqmMHgLSyvZV/qTLwbw5k3VyGOXDDyW8f8QbfVXAb/Zcdk6URwO4ebyZ
	 aOvt5mGmVKWsUrTPhBvy0O1x6a8BHtf0wmo5e0Pc+x1yWrJcL4HXXrS+cjdGqbaVh3
	 +C1EnsWaK8x1y0xk2gT5A7pvQcvITBJqeRCf+Auc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbgCDQfk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 11:35:40 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43588 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgCDQfk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Mar 2020 11:35:40 -0500
Received: by mail-ot1-f68.google.com with SMTP id j5so2605452otn.10
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 08:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=h1Gvo7Uhl99kC+f2DHRk2dtpXA+8wwG3dDT0Nr8Q1sw=;
        b=iQuwPEf0l7gdOZ2ILADDA1tMQjNoC5zFjxZkadUxhEDFYXIGHAqKknSrpvqbZjKUvJ
         JJj0hNb1La0R+RKZWFlrlfKeteCKmHYT/Rcxt1z00isJ3U/JDtn4xD/y2UbXytGUT+3l
         T6uNjRamx4IOoOqZe4R9qJDUBgHWy5kEQm/DJihrZDs0KfNQYmkjk5Db1EaYkCzTqNUp
         BOpWE/4Lr2v1gfZslzOoOtVxWcGdtPjRlgbySzetrvnrCjVKgH/fwQ6K6Nma4vfV4jNg
         gk3OSsf3WunK9jsiBDhE647a57z08eQLXEQ30sOmfl1nsG9CG9VXPoVF7/eHdDC4HZIP
         WCEA==
X-Gm-Message-State: ANhLgQ2oxYH1Zui4bRqLAr8j8zR4cRCbr6rEqqJl9pb6o4FMuEOqit6r
        XDJEyhQpIlouIf7GqL/7kA==
X-Google-Smtp-Source: ADFU+vvs0zKwSe7pdBbmhxfAEsM04vKmv9ZOGaPA/anuEGyMrANs8OpulogLb0VTYVxwyF6vIThI4w==
X-Received: by 2002:a9d:aa7:: with SMTP id 36mr3152106otq.52.1583339739892;
        Wed, 04 Mar 2020 08:35:39 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p24sm4959687oth.21.2020.03.04.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 08:35:39 -0800 (PST)
Received: (nullmailer pid 22504 invoked by uid 1000);
        Wed, 04 Mar 2020 16:35:38 -0000
Date:   Wed, 4 Mar 2020 10:35:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, christoph.muellner@theobroma-systems.com,
        robin.murphy@arm.com, linux-rockchip@lists.infradead.org,
        heiko@sntech.de, francescolavra.fl@gmail.com,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: Add binding document
 for Elida KD35T133
Message-ID: <20200304163538.GA22445@bogus>
References: <20200229151506.750242-1-heiko@sntech.de>
 <20200229151506.750242-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200229151506.750242-2-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 29 Feb 2020 16:15:05 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The KD35T133 is a 3.5" 320x480 DSI display used in the RK3326-based
> Odroid Go Advance handheld device.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/elida,kd35t133.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/elida,kd35t133.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
