Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82255C32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B20124653
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 21:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578174934;
	bh=d8DC5PsHzB+CZJKJU3WrbaIjr67x6r0i/d5cJleFLMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KZeHAD7A2RaZeH8Cz9XhGn279L2Pq8n/xWZzZj98iqfuJjLB29AKgDrAKwDVH2Kxf
	 LHLYPB2JZSO9E3nlRZODfIZgPVm5KAU9VpsMBHb+hVmBQQyjrxgAr74bdZRECnDxrM
	 s5DjMOvN+fNOjQzgcOmxKvqd75B5obbMRwdgS+g8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgADVzd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 16:55:33 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:33254 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbgADVzd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 16:55:33 -0500
Received: by mail-il1-f193.google.com with SMTP id v15so39444621iln.0
        for <devicetree@vger.kernel.org>; Sat, 04 Jan 2020 13:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DpHIoc7R3nvhDkYlx8d7RkRksbRX6Kou1+9AvQFNTV8=;
        b=CjaWyA3zzKz/KL9ggQb5xJSN/Vcb+gKH0/qiBIN5R1cvv8vsZtGvy7k6mpUQ4EcHfI
         He0dtg/CnrB0oPwCkG3ep9cd8j+dTlg2GD1K72548RyZkE6ljyCyoGG75A5NFR1P1MdH
         p8aerrmYbWncUhNhq/ezl8gX811I/HYvyqy8klh8NFNm9Mes7ja9NAvrSkFvtfwUhpnt
         iWua7EfIJLXbITeiYiX9h+W8aWbmyxlc5Wk6h83NczEgLrg1KO1WUZolhLTCp9Anrf9r
         7Z2gpl+qjV/QuIYucJJCerSAg3xMC5jeUhNS87wD2j5Qq63PgmPTg9fmdKNqV+ObEcXk
         6LWg==
X-Gm-Message-State: APjAAAV/TVYesPzARsRCSIf8y9+5jWwmWN9g7x9knwEm+1c7K1yyUflR
        ynZLZx1hMIfBa6jLp7WYzMLcw5w=
X-Google-Smtp-Source: APXvYqzDpKY6wJJAQpXvbQLZ+X9+3REXyxpwpbACA844mx/iGsK5vGfGnsZzYeZUHBSnZMWj1/9Khg==
X-Received: by 2002:a92:4583:: with SMTP id z3mr63936442ilj.17.1578174932891;
        Sat, 04 Jan 2020 13:55:32 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u5sm13348032ion.51.2020.01.04.13.55.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:55:32 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:55:31 -0700
Date:   Sat, 4 Jan 2020 14:55:31 -0700
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, ulf.hansson@linaro.org,
        linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: mmc: clarify disable-wp text
Message-ID: <20200104215531.GA28533@bogus>
References: <20191219145843.3823-1-jbx6244@gmail.com>
 <20191228093059.2817-1-jbx6244@gmail.com>
 <20191228093059.2817-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191228093059.2817-2-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, 28 Dec 2019 10:30:59 +0100, Johan Jonker wrote:
> "disable-wp" has been removed from all Rockchip eMMC and SDIO dts nodes,
> but people still continue to submit new patches with "disable-wp" added
> to other nodes then for the SD card slot,
> what it was designed for in the first place.
> So clarify the "disable-wp" text by adding that this option should
> not be used in combination with eMMC or SDIO.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
