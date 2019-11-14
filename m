Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE43C432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 19:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 252EE2071F
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 19:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573758020;
	bh=UFeUbZe9ITqhihC1b3WbTVTvcBkdXYGyvR/LC0Kwpwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UzP5oD8rIBwJ9scTEw5l18+3MIS/AS7UXt4SVOkpDRk1vvx4Zg7OZJ5VDnvARd8l2
	 VhfTDmf9xZh3PyE8nK5+x8U89+Akk8RJfCOfy7aglIqlWaWb40N6/mrqg/wyvd4fX4
	 88iHD/FA/4dCux9NnAUqZuhV4GrP46CspQ0/vFUM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbfKNTAT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 14:00:19 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39288 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbfKNTAT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 14 Nov 2019 14:00:19 -0500
Received: by mail-ot1-f65.google.com with SMTP id w24so5330901otk.6;
        Thu, 14 Nov 2019 11:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=q9MEfWUdUUfPCm5vU9LQzOSz48lJcPwE7Kg/TlNRovs=;
        b=L+vHFCSrfZ030f00L36ImvW5pu38OjPHH7XXqSeE/QbNxfT+5B3JrI7G7JOlKFK79y
         rXrYq1mbz1jtUOgQfP8iPafaynGoaxi+HY7qupbosA4vuCt2fx24Sqs7wBK7NY7Bu/jx
         1s3UQW6Zt+1esmInsps3OV60ofOs2G0JDcI8FqlcyFrTTt//HWjimdeVvVxz33JY+IHe
         5d/L6GA9ukkIohWuZSwG4VrFMrqsbZ1X8ggnIzbCj5cqMK7CHJt/XtxMSIJwTIj1j86k
         Y/SDrwQDuPwsDmVQc76kVVeFQAZSuu7TOWLcXyKtptlrbAMzeJGsxEyaWNn5M0Wkg1dg
         UWwQ==
X-Gm-Message-State: APjAAAX9mm/bBfBRGd9ILWhp80bTQep9Oo8giO1PpqidZX0gVrj2qAi8
        fIiJYn2N4uVzgcit5h6Nng==
X-Google-Smtp-Source: APXvYqwPs253ExVsUnKRmxwdF9HEpywcpmZqBHjmrgZnsSGc7MA4Jg0vyaU85b3EyxC6OBT0AAoT0Q==
X-Received: by 2002:a9d:bf0:: with SMTP id 103mr7950999oth.372.1573758018393;
        Thu, 14 Nov 2019 11:00:18 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m14sm2054476otl.26.2019.11.14.11.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 11:00:17 -0800 (PST)
Date:   Thu, 14 Nov 2019 13:00:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        andrew@aj.id.au, joel@jms.id.au, maz@kernel.org,
        jason@lakedaemon.net, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: Re: [PATCH 05/12] dt-bindings: soc: Add Aspeed XDMA Engine
Message-ID: <20191114190017.GA17283@bogus>
References: <1573244313-9190-1-git-send-email-eajames@linux.ibm.com>
 <1573244313-9190-6-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573244313-9190-6-git-send-email-eajames@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  8 Nov 2019 14:18:26 -0600, Eddie James wrote:
> Document the bindings for the Aspeed AST25XX and AST26XX XDMA engine.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/soc/aspeed/xdma.txt        | 24 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 ++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/xdma.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
