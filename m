Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FA0C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAACE20692
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578515024;
	bh=ZLr9BMWOVS7n6pXaLQX/xV84CpdanYIZt+grLBd5fY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AIZEWkjJizS09jo8kEruUpVGyNCB3vRTNhzIUZ7R5zDRzhN0V2xH9h57BUafsBMtS
	 iotEDMSmpgmpLs8yrTPsil2Pa8WZ6JNw6ceiXq6YmMpmZRlQrdMWjlNzlPXiQVLgfW
	 uERB9vWyhx651ix17sGwIUlD61xPnKT0sFlaoBkA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgAHUXo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:23:44 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35822 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgAHUXo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 15:23:44 -0500
Received: by mail-ot1-f65.google.com with SMTP id i15so4911309oto.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 12:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jqJ3Kb99ht0XkZVU8yBDUn07MFCSBOIqQAw6O1B1GBc=;
        b=UCANUzGbW61vs/1QMFsc/tO+zltvyIWyI651ehTzu/FKbLmYlpyz2JVrCGbEFWTI4e
         KrnwfVFxUsJ2MVlkTaTWv9fXf1zn+maCvZJu7fkkwmi1Rrff7gGOyOx0A0h8q8aNXZf4
         oX9i9lJbDcIrvP5YPYl9T/FP38d/FbTr6A3RqJfSWbx3AYfl0bFOSE2EADlPJUtEQlt8
         9ues2ie1uaZS8EKk0h9UXE0Rwo+Ts7RlHYO2/xTmyf2YoD1zAd9NdnqhwGOesX+zhsCZ
         vH3N9lZUr1kyeARDKo4xS1D/Nn++uDlDwmig911HxEkrZg9btns1UooA6CFqaQ02ef5e
         G/jQ==
X-Gm-Message-State: APjAAAWPUzyp5WOe77KHB8864Dg4Xp3ceJOvr3lXPuEGBauhgnEF5Kqo
        3LvUgqB/dIw9/L/UR8hQpR7iVhc=
X-Google-Smtp-Source: APXvYqxhlnC+VFUC4Kp3ZK3JZKIOR2JU5a9u+w5Rqi3eQWOhpudWeW0dhmQxnB2fkBgCegubRjBrIw==
X-Received: by 2002:a9d:7b51:: with SMTP id f17mr5562665oto.302.1578515022957;
        Wed, 08 Jan 2020 12:23:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t25sm1435048oij.17.2020.01.08.12.23.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:23:42 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:23:41 -0600
Date:   Wed, 8 Jan 2020 14:23:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     linux-iio@vger.kernel.org, jic23@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] iio: chemical: atlas-sensor: add DO-SM module support
Message-ID: <20200108202341.GA28838@bogus>
References: <20200106090335.21717-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106090335.21717-1-matt.ranostay@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jan 06, 2020 at 01:03:35AM -0800, Matt Ranostay wrote:
> Atlas Scientific DO-SM OEM sensor reads disolved oxygen in
> a solution. This is reported back as mg/L which maps directly
> to ppm and so the IIO_CONCENTRATION channel type can be used.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> ---
>  .../bindings/iio/chemical/atlas,do-sm.txt     | 21 ++++++

Please split bindings to separate patch and make this a DT schema.

It seems like all these Atlas sensors are the same. Can you combine them 
into one schema?

>  drivers/iio/chemical/atlas-sensor.c           | 64 +++++++++++++++++--
>  2 files changed, 81 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,do-sm.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,do-sm.txt b/Documentation/devicetree/bindings/iio/chemical/atlas,do-sm.txt
> new file mode 100644
> index 000000000000..fc741ea794c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/chemical/atlas,do-sm.txt
> @@ -0,0 +1,21 @@
> +* Atlas Scientific DO-SM OEM sensor
> +
> +http://www.atlas-scientific.com/_files/_datasheets/_oem/DO_oem_datasheet.pdf
> +
> +Required properties:
> +
> +  - compatible: must be "atlas,do-sm"
> +  - reg: the I2C address of the sensor
> +  - interrupts: the sole interrupt generated by the device
> +
> +  Refer to interrupt-controller/interrupts.txt for generic interrupt client
> +  node bindings.
> +
> +Example:
> +
> +atlas@64 {
> +	compatible = "atlas,do-sm";
> +	reg = <0x67>;
> +	interrupt-parent = <&gpio1>;
> +	interrupts = <16 2>;
> +};
