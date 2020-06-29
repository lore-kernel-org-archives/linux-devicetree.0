Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0424C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 22:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADFC92078B
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 22:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593468048;
	bh=ksD8/YhOmPyxDpDhDWAW8V+BdGDwMP3O1CnBq8iX7BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2I1NBSEolGZRrFrTnY5u0Z54LV+M/TxJmzUHkH8M0uWmYqBgkgFvrhErwcOWPkW0B
	 7LME10Gp6ktqp+9EXNmadqJvPktb99oqoNw1lBaXDwJPv6Etd9hBHOwvh7HMTqNGhq
	 aVvRq6HTAPKgFfzMSkX/jsiQcbz3RhjnWM7br3aM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404828AbgF2WAq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 18:00:46 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:43106 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404812AbgF2WAo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 18:00:44 -0400
Received: by mail-il1-f195.google.com with SMTP id i18so15885149ilk.10
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 15:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XibhlPkg3VOTmV4eLtvatFLe5OTKIBnR1/3S5Ja9w/I=;
        b=JQ4Em5kANRpQ1QGNwHXw3VnCdXCJrB4J70fVrPEVmxKmCxJHYoFfBQcCodDkSQiyi7
         c6u23mYbZn8P3RDV+5hWYy4holFXFZ+tmxuVcyfOnPEcavSTjAbjNnfIxMuQqQlunXY3
         mwVsW8U832eG4hUjLWwf5QZI+3GhrBoI9ye0bZLvWgMH5Sydq3PEE+wXkeoxSR32esf8
         1qMhlRbZmCam8KOomr516tRpHXBRze3dm0dsTCbQdZi/V9dn3CW25tmFIz7TzZ38OVz6
         TPWLLKrJjTq58XP3i4nHv9iVkaIVfk/ijD7frrFcM0xMCcY3Pdu45L9jWquaAycWREwF
         D/Qw==
X-Gm-Message-State: AOAM531p2+5PamQqRgsW5OSrPnLrcUsKhVGX1HAonDijXIg3IHthMZGZ
        WcLaHdX5WLShEMhazw1NDK6Mq7aZFg==
X-Google-Smtp-Source: ABdhPJw/3aWE5XK3CTeLWAvSAH1gjgTz2xAun9mWY7bxA0/ul+apY1Zq5c7rq/5DZCJLxWdy1hNz4Q==
X-Received: by 2002:a05:6e02:e43:: with SMTP id l3mr17582767ilk.11.1593468043226;
        Mon, 29 Jun 2020 15:00:43 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id s190sm674589ilc.28.2020.06.29.15.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 15:00:42 -0700 (PDT)
Received: (nullmailer pid 3011558 invoked by uid 1000);
        Mon, 29 Jun 2020 22:00:40 -0000
Date:   Mon, 29 Jun 2020 16:00:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] dt-bindings: sound: convert rk3328 codec binding to
 yaml
Message-ID: <20200629220040.GA3011219@bogus>
References: <20200623124734.1736470-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623124734.1736470-1-katsuhiro@katsuster.net>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 23 Jun 2020 21:47:33 +0900, Katsuhiro Suzuki wrote:
> Just convert Rockchip rk3328 audio codec binding to DT schema.
> 
> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
> ---
>  .../bindings/sound/rockchip,rk3328-codec.txt  | 28 ---------
>  .../bindings/sound/rockchip,rk3328-codec.yaml | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.example.dts:22.26-27 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/sound/rockchip,rk3328-codec.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1315234

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

