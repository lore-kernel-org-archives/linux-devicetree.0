Return-Path: <SRS0=jMr8=BA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F7AC433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 02:26:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 374CB20734
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Jul 2020 02:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595298374;
	bh=EBspbZRaoJDchjXfv6Jkm9EQRS6sJiS6iwD1SjsKF/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ogxibETIhSVV8tsA5mIa055JcyuXIs0migWNSJKWbK5mO/VtP48ybrWIgUS1fD+v3
	 38QFbvyoioGkWemV7+/OJ+2blBHmp+ZUYwHxPUbh3gmNrpuTSDkkZgQ6cSe7pl2QT6
	 UWZhu0nmFYOZPsCJ1ybEeDjPSyyXRBb66JZ0RfCc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgGUC0N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 22:26:13 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42834 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbgGUC0N (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jul 2020 22:26:13 -0400
Received: by mail-io1-f67.google.com with SMTP id c16so19750375ioi.9;
        Mon, 20 Jul 2020 19:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6vj3lSfjw4PLnJDUUmMQTm22WpU74Eu/O6YRnloAE+8=;
        b=gkWDpNnyOWG35IPOo2gcwtOFNt0+fw7h1PK3oBzt6Cpgffv1ZcUi8Kcn/Yk9i7wqSw
         vshIn7BiFTZZKuz/BFAVVEbsfWC1C08heIHydPozh/Z6IXsUZxNon2WTE+lPOSEI8jL5
         LfBqn/flaVAxL1hcS7DNf9SPLMg6JESMO1SCA/YlyuJQcBVlLGU78q+WcE43twhW+f/P
         IXQya63RbMyn+Aed4UVyjj8AcvG3eSzec/8XQigXpyQPbcm3fe5TYGiJtJ4mqAfIKjzo
         G5cp5Cjn4nZvQ7aUoF+LpwCUkPDXxVLpyF7C/vJMskWgv9+uVT4WWGF8cZIcre93JXBp
         8RhQ==
X-Gm-Message-State: AOAM531Ig0xJSrnqpyHCB4j0952ep5+Gt7tEBoQxhIyOSozvrLPhlefH
        57IponO0DQZlquCGVOVl6A==
X-Google-Smtp-Source: ABdhPJxEK/00Pa5eCbleB8Ee3ciASshoFTq8WjsSJbiKtjebrHlTOsS+V3X97KsODGx7M1gYJjheog==
X-Received: by 2002:a05:6638:2615:: with SMTP id m21mr28883208jat.134.1595298372319;
        Mon, 20 Jul 2020 19:26:12 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a10sm9731688iln.20.2020.07.20.19.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 19:26:11 -0700 (PDT)
Received: (nullmailer pid 3409339 invoked by uid 1000);
        Tue, 21 Jul 2020 02:26:10 -0000
Date:   Mon, 20 Jul 2020 20:26:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: usb-connector: Add support for Type-C
 alternate-modes
Message-ID: <20200721022610.GA3391383@bogus>
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714113617.10470-2-hdegoede@redhat.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 14, 2020 at 01:36:14PM +0200, Hans de Goede wrote:
> This commit adds the minimum bindings required to allow describing which
> altmodes a port supports. Currently this is limited to just specifying:
> 
> 1. The svid, which is the id of the altmode, e.g. displayport altmode has
> a svid of 0xff01.
> 
> 2. The vdo, a 32 bit integer, typically used as a bitmask describing the
> capabilities of the altmode, the bits in the vdo are specified in the
> specification of the altmode, the dt-binding simply refers to the
> specification as that is the canonical source of the meaning of the bits.

What if this information should be derived from information already in 
DT (or would be there if alt mode connections are described)?

> 
> Later on we may want to extend the binding with extra properties specific
> to some altmode, but for now this is sufficient to e.g. hook up
> displayport alternate-mode.

I don't think this is sufficient as it doesn't describe how alternate 
modes are connected to various components. This has been discussed some 
here[1] with the CrOS folks. Maybe this is orthogonal, IDK, but I really 
need something that is somewhat complete and not sprinkle a few new 
properties at a time.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note I hope I got the yaml correct, this is my first time writing a
> dt-binding in the new yaml style. I did run:
> make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/connector/usb-connector.yaml
> and that was happy.

That aspect of it looks fine.

Rob

[1] https://lkml.org/lkml/2020/4/22/1819

