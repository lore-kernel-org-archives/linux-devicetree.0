Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BEDC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:39:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD75B2467B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 21:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576791589;
	bh=D0yRbMGY+j2Iw4E/WvP+rfJTbEk+yS0KTSGRDvpQ9C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PmKXsSZM0lkSY37q/+Wnjj8bn22X+5sw7WDQQp4cgoI59lwPvovt2WSgIEfyqzAgJ
	 1miybGPTshT+7SF9TbMrpkVzZVKAzqUOeDDKNgP6GgRUhtRaNUjgm4N5FDAPl08it7
	 v78r5TWrrmClKV+vT8B+g2y8XHnogYyuPoFsUGFk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfLSVjt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 16:39:49 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41999 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfLSVjt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 16:39:49 -0500
Received: by mail-pf1-f194.google.com with SMTP id 4so4014430pfz.9;
        Thu, 19 Dec 2019 13:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=EuIV5z2o0n05Q9RgPuXojkh3xFdd9Wka6GyEt+XAvNE=;
        b=C8XXFdqHWbT8DupYoaiBHiVlPT0stZDPCLrk7fWefOu+LRtWN6bR27zr/xaWG1TkhG
         avBIiejIkhIwibj+DHOGHvFeBnNB4k6DAZZEoMwL7xiCOgLPJbUPFGEs1752zjhvXrCe
         rXSHyJX9nTc0joyvrxpKp051gm6sRLZppTJqxWmItcXTmi0siCSLG5iTOrbhDOqR1VEU
         HWixwOj6lemFeiXsthKRlLaoA36OqCuZHGmUYvX3qX3Z2Om16V7hWTcXCBatzpJouk9Q
         tCUpa//rY3DvBrMg2Z9h4hXxz5gUN+8kHIsOWMiFqXwU++ts4m98u0dkR58xY87kJrcR
         K+fw==
X-Gm-Message-State: APjAAAVg/Gp8jRF4x8jKsNhSL7477xTjtBRyTUvmRHxFHwcr+QFxgJE+
        mE/KH7wVb5pc/1vFR4KG4w==
X-Google-Smtp-Source: APXvYqxxAOxABEc802Ph0wmapPf5umgK1GdjemojL9KJ6nHuC1DTkhwFw5J9trVzvp8gHkLcl67EVw==
X-Received: by 2002:a63:484b:: with SMTP id x11mr11438297pgk.148.1576791588519;
        Thu, 19 Dec 2019 13:39:48 -0800 (PST)
Received: from localhost ([172.58.27.162])
        by smtp.gmail.com with ESMTPSA id o134sm3871743pfg.137.2019.12.19.13.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 13:39:48 -0800 (PST)
Date:   Thu, 19 Dec 2019 13:39:44 -0800
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>
Subject: Re: [PATCH v2 8/9] dt-bindings: input: elants-i2c: Document common
  touchscreen properties
Message-ID: <20191219213944.GA21390@bogus>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <ecacdd9b1baea0cf332c30f3c7e01d5e734957be.1576079249.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecacdd9b1baea0cf332c30f3c7e01d5e734957be.1576079249.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 11 Dec 2019 17:03:25 +0100, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
> 
> Document support of the common touchscreen properties.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  Documentation/devicetree/bindings/input/elants_i2c.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
