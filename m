Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B08C33CA2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:59:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44C1120692
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578502795;
	bh=fml7quVSmpOHFOMfX/NoIXZg4+D06pcWxtfmE/xysNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Xf5F4gMSwg7FeZa3UoLw/GaRLcON1hNNs+aHb4vBbRQdpXYinZP75yyqQUXgfmWGy
	 fJJqLAlpU1tcv/Q/uw3R2dGaJeub6nsqVSH1AS7+oCb2DgdLnqZGUntcws0iaZYVjd
	 uS9CAw0q/soOky5vF83yZ+7vCQFVcp/lfNCZP1QI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729581AbgAHQ7y (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:59:54 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41266 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729566AbgAHQ7y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:59:54 -0500
Received: by mail-ot1-f68.google.com with SMTP id r27so4223851otc.8
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d2GY+NVVosTDVmvibNwMNQRy5RHqvmx65T16ZeJgxvo=;
        b=JWwu5/7ZKCBPidgmkfe37vFTf+ZSjStnzAlIE4KhcqZTApCvAAdxSnI/KuOu6SgUfa
         zeShurccfFWeV/pCJxv2Cx0UjwzovggfiADMfabbi4gY2bBcbPjXe5g88rZuW57LEOFw
         D+Pxo8GaHd/5ObdK4m3BTWyp46F9FA9BRkgrhry0A5kr5gVa8ggC5eJBc3im/Cdd7fQN
         4cNN0RzFnJ32hwpNjcRe6b2reeyZzexbF596BF6tk/wEPqGjdqyFZJkXeOdYM56BEt2t
         oqKQvRrpgJMabUXYYgHw4ndlH57ALjsu9VTDl6PjklfKJny/HdFHevQH0yIeIOzXNU1l
         iJsw==
X-Gm-Message-State: APjAAAXQR7evBweOMoKlQHN76T+HS2fA3rrdW0tFILvi8ouawx2QwpyS
        g6kemd41Hmf/jm2IITGQ0zeckBw=
X-Google-Smtp-Source: APXvYqxLi4iQR/gTRhhps0SZhFylwbp7MpA+SB30CWNYM77V3VZrqhSX0ynZobCp/WNJw21p7bd88g==
X-Received: by 2002:a9d:73d9:: with SMTP id m25mr4997457otk.350.1578502793281;
        Wed, 08 Jan 2020 08:59:53 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o20sm1242372oie.23.2020.01.08.08.59.51
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:59:52 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:59:51 -0600
Date:   Wed, 8 Jan 2020 10:59:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH 2/5] dt-bindings: iio/adc: Add touchscreen idx for JZ47xx
 SoC ADC
Message-ID: <20200108165951.GA10221@bogus>
References: <20200105001639.142061-1-contact@artur-rojek.eu>
 <20200105001639.142061-2-contact@artur-rojek.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105001639.142061-2-contact@artur-rojek.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun,  5 Jan 2020 01:16:36 +0100, Artur Rojek wrote:
> Introduce support for touchscreen channels found in JZ47xx SoCs.
> 
> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
> Tested-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  include/dt-bindings/iio/adc/ingenic,adc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
