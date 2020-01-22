Return-Path: <SRS0=6ipe=3L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBEFFC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 16:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA1E3206A2
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jan 2020 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579709759;
	bh=FzcAHfoG+HixPUGS6d0mPbyybyEyC17KVnM+ZhCahe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=h6sAFwx3BI7LqvjaqDVP61EE5RM6VReEIv5oU80VQgZ/Kb9fFZ4hGf6/IJ3BdQ3uo
	 GnhT6olR3ysNHTB92fCeowSHSZI0QOSPAIHrqoC46Cs5eYLVlYspEim/zXsc1mTvqS
	 zdv9T6gkXfeRmUZi0R/sWhl9Klk3cnq2jZWinb6I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgAVQP7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 11:15:59 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38563 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgAVQP7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 11:15:59 -0500
Received: by mail-ot1-f66.google.com with SMTP id z9so6774832oth.5
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 08:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p1OCjMXmKiHziHpAWhapeWkfYMdZv9uLGeBBuoIovnE=;
        b=blOUMc8jqdHmm6K9WBTQWyE0ua8O8lcZrZwhfMjx2ndqgCdreyvfcnR9rcyx+ZV8p+
         cAaKwC3m44E/DmCXi3sdNgXZ8EyJIx76btoy3jBV0G/ClcnfHHj6gBPRswxj54OKUmY6
         Tfccz+kisnADlRdo9W9Ks1qr73MZsgM+ipZLjon4zkKLWTO8w1d8JxLAJCKhBKmCG4Jd
         5StbwBwsGLozmxhSNWkykXOgdFdpEoxsLVuDKpcDvSe5uzDX5aC50R3oeQrVqYWrRohv
         06VqdUdAzu9K/GOR6HIGqEclGCSCUSfUS+6GgsWTuja6+X9XU9Az8ITk4BaSgA1ZBQEn
         bjZg==
X-Gm-Message-State: APjAAAUnbIoPx712MOytc3p0w2x5OFLk3Poi8NPV2uU+YTSihcLd612I
        j3RY4QlkgJdluiR0of9xBVXPOEM=
X-Google-Smtp-Source: APXvYqw58Rk8CdOh5qD6B4KibM7Z80Epls8nYTSXNGBeCyLyJ1Lk0PZfZPeci8FyEvSsoiqg65LGBw==
X-Received: by 2002:a9d:d0b:: with SMTP id 11mr8248931oti.287.1579709758154;
        Wed, 22 Jan 2020 08:15:58 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u75sm13106196oie.15.2020.01.22.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 08:15:57 -0800 (PST)
Received: (nullmailer pid 27987 invoked by uid 1000);
        Wed, 22 Jan 2020 16:15:56 -0000
Date:   Wed, 22 Jan 2020 10:15:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Charles-Antoine Couret <charles-antoine.couret@essensium.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: tas5756m: Add DT binding document
Message-ID: <20200122161556.GA23997@bogus>
References: <20200118092315.10384-1-charles-antoine.couret@essensium.com>
 <20200118092315.10384-2-charles-antoine.couret@essensium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200118092315.10384-2-charles-antoine.couret@essensium.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jan 18, 2020 at 10:23:15AM +0100, Charles-Antoine Couret wrote:
> Document the bindings for the tas5756m driver.
> ---
>  .../devicetree/bindings/sound/tas5756m.txt    | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.txt

Can you make this a DT schema.

> 
> diff --git a/Documentation/devicetree/bindings/sound/tas5756m.txt b/Documentation/devicetree/bindings/sound/tas5756m.txt
> new file mode 100644
> index 000000000000..293eaf20d008
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tas5756m.txt
> @@ -0,0 +1,25 @@
> +TAS5756M audio CODEC
> +
> +Required properties:
> +
> +  - compatible: should be one of the following:
> +    - "ti,tas5756m"
> +    - "ti,tas5754m"
> +  - reg: the I2C address of the device for I2C.
> +
> +Optional properties:
> +
> +  - mute-gpio : GPIO wired to the mute pin.

mute-gpios is the preferred form.

> +  - hybridflow : an integer between 1 and 9 to select the HybridFlow program.
> +      if not supplied default DSP program is used.

Needs a vendor prefix.

Is this something fixed for the life of a board or something users would 
want to change at runtime?

> +
> +Example:
> +
> +	tas5756m: tas5756m@4c {
> +		compatible = "ti,tas5756m";
> +		reg = <0x4c>;
> +		#sound-dai-cells = <0>;

Not documented.

> +
> +		hybridflow = <6>;
> +		mute-gpio = <&gpio1 11 GPIO_ACTIVE_LOW>;
> +	};
> -- 
> 2.24.1
> 
