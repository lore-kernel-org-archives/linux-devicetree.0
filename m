Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB05C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C6AF20705
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 20:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578516894;
	bh=yi7tnlDrdUMVzs3ejGEjAyMYwtvhzO8l6OlDpQ15tro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QEvEMtk4jEQ7GASi7L4YN5m+QrM5cbXwSYgSwrxq5+dnn7VgRdS9fD03+Kf229bkr
	 gD7ywvmYelRY3+2sAIzl7neAy0MLcctvgI4+SgViaabiY4/570iscEEf1KAUQ9zevo
	 eL+Z4OkAyAP2LKCbRKt3pJCh3sjR9x/fxlhnOyBY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgAHUyx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:54:53 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38382 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbgAHUyv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 15:54:51 -0500
Received: by mail-ot1-f68.google.com with SMTP id d7so4975365otf.5
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 12:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jf75AHX9cWk938eoPABkjnqB5jtoAKhCXPRF42yiNM0=;
        b=V5bqMjQ6tOT2byyUzpCQelQ17+XyzlJfBh/fX4hi4/yDJ1d4k1QsAN3w1ZOPg0Z6A9
         20jNejcJ8C2tkdHKuMrxX+aHp42JmXFsHMHG8Ww6ypsjZOCjQYuVoMRYEhZxOyunuU+l
         hbEuxK+9E7iIK2Nm6SLlSQEwVt6IPe878wZ2Qu92rq+fZLgJQqXFnlMC7z8xrNUQ/+Lr
         CxoXK9sYyJlPzG4cVgLfCX3xDVtw2vSyTr4n3sP3Mgz3bhmin/yAMF63HcH15G1Ay7gb
         sCahjJuYAbhNCzv610rmRW9fr3r2Cgc3ZS+5qMrm0ECPGzWV7woM+wwy+PHh0dMpv35G
         1NJg==
X-Gm-Message-State: APjAAAXzYOyXnFqP/06jSkRzOENKZJ4r/uIBRN6kXhNBsUPDuM/vs3kf
        4jwDa5+qQ7TF9ffK1YeJGLfj7lQ=
X-Google-Smtp-Source: APXvYqwgRsNCgnIzYurHwI24pGt4G3q9G7FH1/pI9ObUBoaDX2gXrCGXC5cUU8Iopk9g16Xhb5cH2g==
X-Received: by 2002:a05:6830:138b:: with SMTP id d11mr5412586otq.38.1578516890376;
        Wed, 08 Jan 2020 12:54:50 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w201sm1462952oif.29.2020.01.08.12.54.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:54:48 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:54:47 -0600
Date:   Wed, 8 Jan 2020 14:54:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Khouloud Touil <ktouil@baylibre.com>
Cc:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linus.walleij@linaro.org, Khouloud Touil <ktouil@baylibre.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: at25: add reference for the wp-gpios
 property
Message-ID: <20200108205447.GA16981@bogus>
References: <20200107092922.18408-1-ktouil@baylibre.com>
 <20200107092922.18408-5-ktouil@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107092922.18408-5-ktouil@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue,  7 Jan 2020 10:29:21 +0100, Khouloud Touil wrote:
> As the at25 uses the NVMEM subsystem, and the property is now being
> handled, adding reference for it in the device tree binding document,
> which allows to specify the GPIO line to which the write-protect pin
> is connected.
> 
> Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at25.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
