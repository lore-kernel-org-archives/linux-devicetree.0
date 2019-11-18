Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B35C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 17:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBA0C21D7A
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 17:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kibfHyKX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbfKRRxe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 12:53:34 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55738 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfKRRxe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 12:53:34 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so196898wmb.5
        for <devicetree@vger.kernel.org>; Mon, 18 Nov 2019 09:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cNxPWLOWv0k0np4gxN1EKWDNGg29Wv6YJvCRwVBUdDc=;
        b=kibfHyKX/xzHDpBxjpj1AXHCxkg8WvKE+3Kt/CXF+W/LmvFTDrI8MzR2MqyrYuBHGt
         cRWxTpxc66eHaJI/7/Yny11QFBwAsFXCoVN2jDNVz4hs8aPkLKb18/hVhkm8uDKwarXd
         2IEBZMpBxvZoQ4jtMocgVbcRBulyT2HIMaIIpO554RtVJOXsm3Hldqu3bEv3Z2W9Nj8z
         WpKEdmYY/16aM8ov4cTuGAJQlTbxwpPkPKX8tC2GmxmSvRZ252OwMEOj8i6pDMc0alaU
         E0IoIkOEcikNL1KJCDyyIfuzvGyE8lsNbTM73Dmlq/WKd0VqR0eXokTgT03z6ad1AAGN
         zIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cNxPWLOWv0k0np4gxN1EKWDNGg29Wv6YJvCRwVBUdDc=;
        b=plRs1AS1UtWTiklpMBdKo5uy3odEFzQTEMKpm1bVrOx44RBVfZPrSnLGRFIMeDxxj1
         5+7Op1LiITyQoZ85HiiOblOjkmTBKPioGwxRCtE5dvOg5jw2jKQUNwwqgG4adKs0V5rj
         a2fRfQfzTKwvM7N4ap7UeFlq2/NKiWDkWSUJ67II13vXtwrjxDbv8F7P1icbMrJpHh9c
         8nJkNfrfXQJkGyRBtT/0TDglyrpmvEem9TPxPIL6GyHHT0kL1boeBF0TaTp00ZseEWwa
         WKq3z41ybewnAoyX7wHrBuWa/33y2Ae6X1hTvqV16/yrldFgh3pBsQgrjwcUBgw6MADr
         x/1Q==
X-Gm-Message-State: APjAAAVCWR8DXMdfJZo8DSZR2I7nHf+PsGxrgT81YyZnIEI7iVVeIhQ1
        6nB4bi3xM4b1+Gk5S7a+nlk=
X-Google-Smtp-Source: APXvYqyCKw2sIvnMXLgPDU0JTiC91bUCKDWA9QM16mDES/ngkaqC0Mh2VKn/1bzTsVCl6Q6TshmY5g==
X-Received: by 2002:a1c:3cc4:: with SMTP id j187mr286757wma.95.1574099611923;
        Mon, 18 Nov 2019 09:53:31 -0800 (PST)
Received: from localhost ([37.238.189.2])
        by smtp.gmail.com with ESMTPSA id a2sm20332574wrt.79.2019.11.18.09.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 09:53:30 -0800 (PST)
Date:   Mon, 18 Nov 2019 20:53:29 +0300
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH 2/4] dt-bindings: net: Add compatible for BCM4335A0
 bluetooth module
Message-ID: <20191118175329.fbg6qhdzra3wa5xs@manjaro.localdomain>
References: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
 <20191117175606.5050-3-mohammad.rasim96@gmail.com>
 <94c5d608-304f-68b8-9595-4d011b60c7e8@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94c5d608-304f-68b8-9595-4d011b60c7e8@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/18 11:03AM, Neil Armstrong wrote:
> Hi,
> 
> On 17/11/2019 18:56, Mohammad Rasim wrote:
> > 
> > Available in the Ampak AP6335 WiFi/Bluetooth combo
> > 
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > index 4fa00e2eafcf..0717399191a2 100644
> > --- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > +++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
> > @@ -14,6 +14,7 @@ Required properties:
> >     * "brcm,bcm4330-bt"
> >     * "brcm,bcm43438-bt"
> >     * "brcm,bcm4345c5"
> > +   * "brcm,bcm4335a0"
> 
> Is there a specific reason to add a new compatible here ? it the BT interface of the BCM4335A0 different for the actual compatible modules ?
>
> If not, simply use a common "brcm,bcm43438-bt" compatible string.
I added a new compatible so that the dts of the device can describe the
exact model of the module, anyone reading the dts might think that the
device has a bcm43438 module which is incorrect and just looks weird to
me.
previous compatibles like 'bcm4330-bt' are only used for probing and
don't appear to be used anywhere else so I guess this is ok by the
bluetooth maintainers, if not I will use a previous compatible and add a
comment in the dts with the exact model of the chip.

Regards
> 
> Neil
> 
> >  
> >  Optional properties:
> >  
> > 
> 
