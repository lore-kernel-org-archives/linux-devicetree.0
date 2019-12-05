Return-Path: <SRS0=PToE=Z3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BA0C2D0BF
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 14:48:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27E762245C
	for <linux-devicetree@archiver.kernel.org>; Thu,  5 Dec 2019 14:48:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com header.i=@netronome-com.20150623.gappssmtp.com header.b="fgnbnepY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbfLEOso (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 5 Dec 2019 09:48:44 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43032 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729574AbfLEOso (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 5 Dec 2019 09:48:44 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so3912321wre.10
        for <devicetree@vger.kernel.org>; Thu, 05 Dec 2019 06:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oHdIrCO6kQ2Rshm7QZhBaPgPSsJahjIjSW1nStTA8NM=;
        b=fgnbnepY9/THLXfaK+hiYjanJJ0I1nyLSyQYlGcsIGmWDFwPmtKQ0Ye+RP3ViSJsip
         HNzrDUCzrzJIDOCSXuBj3TOFM3WjxI2R0pG5U8idEvHYCLwvH09/0ymUNzFrS7LFyoei
         Dd852ZXd3sEw1MJOiVpe7e7uovotdYntQBJ+MNyexvp82k7LmM9yf/LS0hA5MX5H88m/
         1TpFsUBDe7arywTtwD2yzaiJCXeUf8J+w1N+hoyh88D0TUcAurDq7+VibAPtMNjVLNw8
         OVIWowpFo95XeUcJY2BCPtzIKIAd0IGhp66JvW5QGdHYA9I3cux8VR/IHwNRq3Bxnny3
         rvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oHdIrCO6kQ2Rshm7QZhBaPgPSsJahjIjSW1nStTA8NM=;
        b=SCqp60gI/3M645DADEbyKO/lO54/Mx2VgxULLhFrWxRZftRtK+6dEYSXN/xs9RbGEw
         XKdQpAwUqnfJePDQkS8MfBIYz1MatzlPP93lBBrvunRFucc0RRdzPVmqhk9ZP3Uo9RGi
         p+EXHDPH5yN2KrWGJh6KR32HC5YUde46Bq13XkCM1R289kcHi45vITSO+KBYrSVuIVJ4
         qBzNHEjcvaPJzDdTV3O/QlBuFFyXuAncgXdnG1DEVAJBTVnDJeZimUVWmCI/Hm5HUZQA
         zbI72pUOZUtoToDIWYPgufJWnUPjidpS+r6syR28rUJgSZcTw9OjvVTzYwZBPuBH7NQB
         fuyw==
X-Gm-Message-State: APjAAAU7jK/FLFStAhBbBn72DXxOfU1pczpbzTJL43LdZ57NBY4dbG3I
        wUGBV0gIXOIpIu65RNzATDZ59w==
X-Google-Smtp-Source: APXvYqxW+7gCTDwfdwZ9xn5nP1blFVvd2gKJZp5hqR+snnPERZdt+Sfx5QTBUvGLfYS8jhPOC9+PdQ==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr8241306wru.40.1575557320401;
        Thu, 05 Dec 2019 06:48:40 -0800 (PST)
Received: from netronome.com ([2001:982:756:703:d63d:7eff:fe99:ac9d])
        by smtp.gmail.com with ESMTPSA id c4sm75334wml.7.2019.12.05.06.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 06:48:39 -0800 (PST)
Date:   Thu, 5 Dec 2019 15:48:38 +0100
From:   Simon Horman <simon.horman@netronome.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: mdio: use non vendor specific
 compatible string in example
Message-ID: <20191205144837.GA28725@netronome.com>
References: <20191127153928.22408-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127153928.22408-1-grygorii.strashko@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Nov 27, 2019 at 05:39:28PM +0200, Grygorii Strashko wrote:
> Use non vendor specific compatible string in example, otherwise DT YAML
> schemas validation may trigger warnings specific to TI ti,davinci_mdio
> and not to the generic MDIO example.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

This seems sensible to me.

Reviewed-by: Simon Horman <simon.horman@netronome.com>

Are there any plans to address the errors DT YAML schema validation reports?

$ ARCH=arm make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/mdio.yaml
.../linux/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-asus-rt-ac56u.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-netgear-r6250.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-netgear-r6250.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-linksys-ea6300-v1.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-asus-rt-ac68u.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-linksys-ea6500-v2.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47081-asus-rt-n18u.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4709-asus-rt-ac87u.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47081-buffalo-wzr-900dhp.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4709-netgear-r7000.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4709-netgear-r7000.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4709-linksys-ea9200.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4709-linksys-ea9200.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47081-luxul-xap-1410.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47081-luxul-xap-1410.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4709-netgear-r8000.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4709-netgear-r8000.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm4709-tplink-archer-c9-v1.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-abr-4500.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-abr-4500.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-linksys-panamera.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-linksys-panamera.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm94709.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm94709.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-phicomm-k3.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-phicomm-k3.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm911360k.dt.yaml: mdio@18002000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm911360k.dt.yaml: mdio@18002000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm47094-netgear-r8500.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm47094-netgear-r8500.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm94708.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm94708.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm953012k.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm953012k.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm953012er.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm953012er.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm911360_entphn.dt.yaml: mdio@18002000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm911360_entphn.dt.yaml: mdio@18002000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm953012hr.dt.yaml: mdio@18003000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm953012hr.dt.yaml: mdio@18003000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm958305k.dt.yaml: mdio@18002000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm958305k.dt.yaml: mdio@18002000: #size-cells:0:0: 0 was expected
.../linux/arch/arm/boot/dts/bcm958300k.dt.yaml: mdio@18002000: #address-cells:0:0: 1 was expected
.../linux/arch/arm/boot/dts/bcm958300k.dt.yaml: mdio@18002000: #size-cells:0:0: 0 was expected
