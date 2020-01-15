Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CDBC33C9E
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 02:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D30E222C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 02:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579053718;
	bh=Yk2l+smHmslPMi9PrxyeXNImui4BouR9wa2W3jXsvbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=q2Rm9tHKMrAKUmz3k1z4rUg/eDozdrImfGzJfID6ucrz15KGJ3Rt/rFaUSUgd8h1F
	 B9jRkNVrI6Z5Ah9uojkNPPpg8r1c+UC+cBDqtrmAMjtZj1UqCmJID0d4py7+B4DsR1
	 q5qD+2+banqEmcLZhuNkkWjgyMk4aEjZ3Y4C+Q2c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgAOCB6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 21:01:58 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34382 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728834AbgAOCB6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 21:01:58 -0500
Received: by mail-oi1-f193.google.com with SMTP id l136so13953834oig.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jan 2020 18:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TXUKuJW35exIxCuuFGP0F9ChBxkOTZKYHQSXMibvkgw=;
        b=brV1w5l+fawO86lxamtelMA3bSnzmucCPg8R9aGssbKxuLZIZ5HT8+Ro30Xxj70ybb
         hexaZQ3rpxDMFH3KJ38iPBawcQRsGF1ueM9h2pwklABmbPaMcCwetqV5XrzrA3JOLAU9
         TrMNe0dEu7FPCQccGiY9zvThJCeLvxc9maC729sKFutAGfYkUjxzj/o1uLaL8RX34GOx
         6I6EKH9sWtL6ciXq5NvgzVfXOpDJRZhyXFJRk/ZJO50mureYW+ja6zxe4hIi2VZ00gD0
         hEHxQSx572vbWqmita8rKyQ7/vi1bB5XBCJdz3MXvZPlx5gCXLuYdURUcSsAx8K9XCfl
         Bc1w==
X-Gm-Message-State: APjAAAU/GPKAhd+64uDmmpDM3DLNJhqSQ6Z6lq6wdl/bm3qFusnltDiS
        V0RcAk+yAiw2bipd1+Et7zo9uNY=
X-Google-Smtp-Source: APXvYqzOqt6A4dbCviY2iacNHhXNg8KCS21yTsQu5SV9XQdH9cxrk91fSnvtMqQlRSr4+r4WW1Ci9w==
X-Received: by 2002:a05:6808:2d2:: with SMTP id a18mr19464733oid.120.1579053717170;
        Tue, 14 Jan 2020 18:01:57 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i20sm6053022otp.14.2020.01.14.18.01.56
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 18:01:56 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220a2e
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 20:01:55 -0600
Date:   Tue, 14 Jan 2020 20:01:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tobias Schramm <t.schramm@manjaro.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND 2/2] dt-bindings: power: supply: cw2015_battery: add
 device tree binding documentation
Message-ID: <20200115020155.GA7802@bogus>
References: <20200109113955.2882-1-t.schramm@manjaro.org>
 <20200109113955.2882-3-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109113955.2882-3-t.schramm@manjaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 09, 2020 at 12:39:55PM +0100, Tobias Schramm wrote:
> This patch adds the ds binding document for the cw2015 Fuel Gauge.

ds?

> 
> Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
> ---
>  .../bindings/power/supply/cw2015_battery.txt  | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/cw2015_battery.txt

Please make this a DT schema. See 
Documentation/devicetree/writing-schema.rst.

> 
> diff --git a/Documentation/devicetree/bindings/power/supply/cw2015_battery.txt b/Documentation/devicetree/bindings/power/supply/cw2015_battery.txt
> new file mode 100644
> index 000000000000..e847391268f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/cw2015_battery.txt
> @@ -0,0 +1,37 @@
> +cw2015_battery
> +~~~~~~~~~~~~~~~~
> +
> +The cellwise CW2015 is a shuntless single/multi-cell battery fuel gauge.
> +
> +Required properties :
> + - compatible : "cellwise,cw2015"
> + - cellwise,bat-config-info : Binary battery info blob
> +
> +Optional properties :
> + - cellwise,monitor-interval : Measurement interval in seconds

Use standard unit suffix.

> + - cellwise,voltage-divider : Voltage divider for multi-cell packs,
> +   specified as two integer values <high side>, <low side> in ohms.

Use standard unit suffix (-ohms).

> + - cellwise,virtual-power : Default to disconnected battery state (gauge in pack mode)
> + - cellwise,design-capacity : Design capacity of the battery cell in milliampere hours

I think we have a standard property for this. Properties of the battery 
should be in a battery node.

> + - cellwise,alert-level : Low battery alarm level in percent
> +
> +Example:
> +	cw2015@62 {
> +		status = "okay";

Don't show status in examples.

> +		compatible = "cellwise,cw201x";
> +		reg = <0x62>;
> +		cellwise,bat-config-info = <
> +			0x17 0x67 0x80 0x73 0x6E 0x6C 0x6B 0x63
> +			0x77 0x51 0x5C 0x58 0x50 0x4C 0x48 0x36
> +			0x15 0x0C 0x0C 0x19 0x5B 0x7D 0x6F 0x69
> +			0x69 0x5B 0x0C 0x29 0x20 0x40 0x52 0x59
> +			0x57 0x56 0x54 0x4F 0x3B 0x1F 0x7F 0x17
> +			0x06 0x1A 0x30 0x5A 0x85 0x93 0x96 0x2D
> +			0x48 0x77 0x9C 0xB3 0x80 0x52 0x94 0xCB
> +			0x2F 0x00 0x64 0xA5 0xB5 0x11 0xF0 0x11
> +		>;
> +		cellwise,monitor-interval = <5>;
> +		cellwise,virtual-power;
> +		cellwise,design-capacity = <9800>;
> +		power-supplies = <&mains_charger>, <&usb_charger>;

Not documented.

> +	}
> -- 
> 2.24.1
> 
