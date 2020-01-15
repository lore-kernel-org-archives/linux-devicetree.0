Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0FBC33CB3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 16:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38D1B24656
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 16:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579104353;
	bh=Dtcn/YnZDwg9WFLU5oqFR6vBCUquKYQu4iAKHdq2xsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bJSCViteR68ZB7hvMMpYoZd0s5a/P852f/yQj2OAsTWnd5TpM7J2ekfFWqll/cxgD
	 kY07tZDZi2N8fHbtn1L+IcN9yIREgX+b1o4v2e8LXpa0tpiv5sSdw0HbKSsrdtf0n2
	 P7rU065FSdr63LvTX641yEdB0SPP0iKnmruHWQ3w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgAOQFw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 11:05:52 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33836 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgAOQFw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 11:05:52 -0500
Received: by mail-ot1-f65.google.com with SMTP id a15so16562148otf.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 08:05:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P3c88juq31x4Ss0d0V98lCGrkb22T0s+IsQbeNCxdqg=;
        b=ITJ1VxEC+9mIngLxHbE1qOa09t34BWeJd6q45wK/JjiekMsxux3LBWVjKWqp71S/0Q
         r4tOiMqWmAWmjFDND8jjM/bSVjpPLh0HNXN4kyXbAjTII1CqaZ4g5PnVpLpg51ZgAj4l
         B5erOk76AFQkBjCGIKh0Mjkyl6PhtKNaJhOFb54CmtncOg9P5N+qRsuDx75WE6c77PH+
         K27MJFdHaeljXKB9QiTFq8dYzUy2ELm4pdzRF5F6Yia3eT2ZGVOxQxs5vuszH6ANtnPC
         3X5DZYI/jMNXx/WhY/1kqG409J9r5uFOxoa8XjJtho6fGKUSA80P2bYM2/rOiI2NK7pO
         XFkg==
X-Gm-Message-State: APjAAAX7wvYlb1T+Jp5JdRmlpJ6p+UqBLHUuc/ovmvluciF4PmdyDwqU
        5PBz2C9UbF60sxNA4zWK9Orsc0c=
X-Google-Smtp-Source: APXvYqxqO3IbLuJ0K7osdgFsu9aRUzX7JshbLoWtcpc+77NOF6GDhCOcb/Yp0q6dm25Fsy15JSdprw==
X-Received: by 2002:a9d:3a66:: with SMTP id j93mr3337378otc.25.1579104351185;
        Wed, 15 Jan 2020 08:05:51 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm6671448otp.14.2020.01.15.08.05.50
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 08:05:50 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 10:05:49 -0600
Date:   Wed, 15 Jan 2020 10:05:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: Re: [PATCH hwmon-next v1 5/6] dt-bindings: Add TI and Infineon VR
 Controllers as trivial devices
Message-ID: <20200115160549.GA19960@bogus>
References: <20200113150841.17670-1-vadimp@mellanox.com>
 <20200113150841.17670-6-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113150841.17670-6-vadimp@mellanox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 13 Jan 2020 15:08:40 +0000, Vadim Pasternak wrote:
> Add Texas Instruments Dual channel DCAP+ multiphase controllers:
> TPS53679, TPS53688, and Infineon Multi-phase Digital VR controllers
> XDPE12284, XDPE12254 as trivial devices.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
> RFC-v1:
>  Changes added by Vadim:
>  - Drop others than xdpe12284, xdpe12254 devices, since there is not
>    clear confirmation from Infineon regarding availability of the
>    others.
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Applied, thanks.

Rob
