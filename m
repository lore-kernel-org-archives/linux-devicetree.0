Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B15DC352BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:40:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D92922076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 18:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586889651;
	bh=LOMuRSLTUCRGXLA7zRhfhbeyWO9SNkOoCTP8uwprb4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=y+kLaVkqraovAO8CT2HPdwdkRB/KMpMfm3om+6ZYWteUvZlh1tYeeYxOyDqIp1vMO
	 px9HV+yVSJa1YYYTmziEKmOSQcDVg6syE5/e6QU0xFfkaBxGrMWXPaNwyOLUhA6ult
	 d6AgLkR68zAGG3msDRi7OyDXzvXF48WEjDVNsKKc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504142AbgDNSku (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 14:40:50 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33813 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729777AbgDNSkt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 14:40:49 -0400
Received: by mail-ot1-f68.google.com with SMTP id m2so762809otr.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 11:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KkcW3PdTI/Hsj4/ijXufE9rkYCN5W1Y05YTfaknuX9A=;
        b=bkLMdE/8Bw/2mNO70JW1gQqnCOX3xmXN2Tr61PTjp0xLqXhEBEvoMI73aBIbY7ahZ+
         8L8JDEfl+gvst1vJIwU41qmRCQnWrhvAhEa4txJ7DpoKEx5ydV3kOBosk+bRaiYk46NS
         TIcw4R+eUyMKJRKbDUvups4uZRogchccf2XXbmMJAU0nf5mKCpHckbO/P7CXdIP+IEGH
         rrTXEQ1qsjZDyHD/RdJPjCAxstah+3s+B/2ray6uMT7N9VHHmSSh/q5X88cJRyC4Kfag
         nHgOyFt/pXcnIc44i74T0AMlLfu7JLK1AMxDhLuzYxoP/7vJNZwRAccpaxIta4Hei/3T
         olnw==
X-Gm-Message-State: AGi0Pua4endC81MCEdyW0lo+ztuhbykJ8/jEun7BfyplpJoJ6KB+FVFF
        VYbgogoEYhW07tSfu7Lg0Q==
X-Google-Smtp-Source: APiQypIPw4X/A2RKry8QYu2nDNT1IsuWpYGzapkLof0bj2UPf8N8i6SL1lsfy++AWvi6blm+mRV0uw==
X-Received: by 2002:a9d:4b98:: with SMTP id k24mr18841219otf.26.1586889648697;
        Tue, 14 Apr 2020 11:40:48 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i23sm5669790otp.74.2020.04.14.11.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:40:47 -0700 (PDT)
Received: (nullmailer pid 22369 invoked by uid 1000);
        Tue, 14 Apr 2020 18:40:47 -0000
Date:   Tue, 14 Apr 2020 13:40:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 22/36] dt-bindings: display: convert samsung,ld9040 to
 DT Schema
Message-ID: <20200414184046.GA22330@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-23-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-23-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed,  8 Apr 2020 21:50:55 +0200, Sam Ravnborg wrote:
> v2:
>   - drop use of spi-slave.yaml (Maxime)
>   - added unevaluatedProperties (Maxime)
>   - added type to width/height properties (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../bindings/display/panel/samsung,ld9040.txt |  66 -----------
>  .../display/panel/samsung,ld9040.yaml         | 107 ++++++++++++++++++
>  2 files changed, 107 insertions(+), 66 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ld9040.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ld9040.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
