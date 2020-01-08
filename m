Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37647C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02B8D20643
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578515607;
	bh=fVKncEntsF/jZcur5TIDS9u5R9L02C5S7aH3aLivyI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Eu/kwz8evQpnKL8YS0J6Wqua+WJUu3Pp3q/td4LCY1ICHJi0Xw9ZLJ/nfYC651Onn
	 g+PlcrXr77mgmVv1TfPDemafNwi6PGwZ4+gaG+mxQRhn775l2u+DKOeL2cSdN8FYlm
	 ldVFBGLV11mkew//YHhlg/NnvheRQnI92I0Xc+7g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgAHUd0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:33:26 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38180 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgAHUd0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 15:33:26 -0500
Received: by mail-oi1-f194.google.com with SMTP id l9so3887358oii.5
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 12:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u9lGx1KGncwRhu5gmclKsigxLVgAIjFaP4Z6LNjc8ZM=;
        b=RIXLIgmG7LWXMJs+aVm9wHq6vSvAkylTnX+llZQ3Hy/wX+P/h5St7TTXRxmpQ1N0Lv
         FoghP8IAkYzRRfsUnUw7SgRSKDY5zh1VvsqD7ZQzGYGHYY7JgHA3EugEY4dUxOkfrgb0
         9Fq/YXEWCpc79dfOTcfXvfDj/Hmr4hthfFnYtSjdL727In9AQoY1uSpI8XddKAJhn9SM
         B8cKf+CgUCkZQuN4G0N82NO9RfyYrDXuJoEYatzlWKvax/L3Pt4cTOmMWlg8moyJDSml
         O/LPIFMQnnPP+GUVNkc/4h3b4PgQ4dz3b0TcGpQqlGdNdgkeus5Xufx65fJNOitkHlOZ
         lgQQ==
X-Gm-Message-State: APjAAAUZPvImoGjz+NfNNqwcKCfc7f2ct9AKxphmOjNvlkHo1HFzSTB1
        TKC4l1PhqPRbNQIYcUiGTe5xlHw=
X-Google-Smtp-Source: APXvYqxhZkDmCbVE72jfe099PH8r7cZZkBr6AivLKk83DeuiQQH+xJXqdAFKnmWDqx+nAZm9omkx7A==
X-Received: by 2002:a05:6808:ab1:: with SMTP id r17mr328266oij.141.1578515605485;
        Wed, 08 Jan 2020 12:33:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j5sm1479077otl.71.2020.01.08.12.33.23
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:33:24 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:33:23 -0600
Date:   Wed, 8 Jan 2020 14:33:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 2/3] Documentation: dt-bindings: media: add AST2600 Video
 Engine support
Message-ID: <20200108203323.GA18757@bogus>
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
 <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  6 Jan 2020 17:15:02 -0800, Jae Hyun Yoo wrote:
> The AST2600 has Video Engine so add the compatible string into the
> document.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/aspeed-video.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
