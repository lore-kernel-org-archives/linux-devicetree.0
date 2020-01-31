Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DCBC3F68F
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 14:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 349DD21734
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580481434;
	bh=ylK95ZjRxTXe3+y7rsfKzJHRJBkVlqUlI6znaz1nTXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=e2ElL7Sh7ZLYMkNUPb6lXHKGvjAkwLL8P+BiVRqgRJ/QeU48XapDVIKfq6IRkzy/O
	 t5/qKMDT8JWU9ajCr0uqb9Ifd38I7Oi+6LJcOsdL46XEmO2QIV8ieAbXR8Q/OEQIjZ
	 53SxgExtYHk+VEsl7K/WBgAUoDvDx/xMt3vJT+Z4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbgAaOhN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 09:37:13 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43163 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728825AbgAaOhN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 09:37:13 -0500
Received: by mail-oi1-f193.google.com with SMTP id p125so7403079oif.10;
        Fri, 31 Jan 2020 06:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hGvNGrNQh9w/cT7YnGvDepDZTp70ocpHTM/PadWQKDE=;
        b=eu7QgISFfTs5M61ZcP1CydsN6/NU4PSfjjjJaEQTftb6tg9e8nu1l745mmWQBW5ANX
         ZxH+xZkRnUHztnm/cnEZ23IEE3QDcoH1WbVHOWAQ1B3qBIOcU5aUTz93GP9buCDMWauL
         gxPrO5/4Ueh7hLTHhYcHFkIxxku6d35cJKLAyIptzP416J67JJunlrBqvbJArxypiTh0
         jVmq0Ekx81unOUjuAV9zHkeUyx6cpbIyNflcQuyl/VE+JonKGBF3xw/K9RehO6oWW+ed
         lkVVdQHVUgIrydmnXPJ7yaqnU8HNIPtusQRD0RSoEDO8haIADkM3YOlA9plHJ4mrIFGS
         9GyQ==
X-Gm-Message-State: APjAAAXb+R45WAnoBAS3xokLWNfTz0NumAy/bd8IaFYZRc0gW3tDB0J8
        6AB+40S3+9fU/DQJjHfrNw==
X-Google-Smtp-Source: APXvYqxTjk7Xs/oFr2rF2ZYTojPRFhl5+cRH623gMN4PJXVOczIQatGEhe6lRKx4II8dbEJovMQu7Q==
X-Received: by 2002:a54:410e:: with SMTP id l14mr6398971oic.42.1580481432570;
        Fri, 31 Jan 2020 06:37:12 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w72sm2663524oie.49.2020.01.31.06.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 06:37:11 -0800 (PST)
Received: (nullmailer pid 26729 invoked by uid 1000);
        Fri, 31 Jan 2020 14:37:11 -0000
Date:   Fri, 31 Jan 2020 08:37:11 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>
Cc:     Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/9] dt-bindings: iio: imu: inv_mpu6050: add missing
 entry for mpu6000
Message-ID: <20200131143711.GA24467@bogus>
References: <20200120093620.9681-1-jmaneyrol@invensense.com>
 <20200120093620.9681-2-jmaneyrol@invensense.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120093620.9681-2-jmaneyrol@invensense.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 20, 2020 at 10:36:12AM +0100, Jean-Baptiste Maneyrol wrote:
> mpu6000 is spi only.
> 
> Signed-off-by: Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>
> ---
>  Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt | 1 +
>  1 file changed, 1 insertion(+)

Just combine all the DT patches if you're only adding new compatible 
strings.
