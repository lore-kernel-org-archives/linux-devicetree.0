Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30CAFC6194
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 08:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B812C207FA
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 08:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="xb6ldzK8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfKHI33 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 03:29:29 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39608 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727421AbfKHI33 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 03:29:29 -0500
Received: by mail-lf1-f66.google.com with SMTP id z24so834105lfh.6
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 00:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zxeEfWsa7VjzhrdJtRRrSoIXfZ05RVStGSw687ppLB8=;
        b=xb6ldzK8yAx9DRAphSYdhgJNxAG/hZZbI3+r+SQfVlcFeJMZZaegi8dfqrSPPDJVHT
         VLmv3sS43FKG9dgAqv8N/I2AbDFp3uugY1ed2NU/jvCjmeWTCNl62KjkG1B+LvMlpphB
         JoMu13wrQTpdnEeF8Z02wxeGo+Onbx6OyQIT7D7CVARCzijIBuOJPOkNn8E0apR8y4xD
         VQem25IjObMb8kdYi+SIoS+Ks8u5A+DzVqTIzXrdzNDGXWnlFwy9+ZAkwZtCxYcYE4Ta
         yEyMyZfhL0TW85XMzQ70o7w6TEZASJ7PTfK2YdNVoUN5J2x+/yCP+qIeZyPUaUijtWXy
         WrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zxeEfWsa7VjzhrdJtRRrSoIXfZ05RVStGSw687ppLB8=;
        b=iv51pGUpP4vL1Onte44L66wkyQcJCndM9z2yKvpVd2EjohNIFUpvNH0uxKTrm/utj0
         bU5pZ30j85tSEOhOHVqBx8/V0qJe9IHXuK/eUxbvVL2p5rvHJNmfdTTC8UgS3uu5uL0X
         CTVOqDEBL5Adjv3hg6Y9IVfn6cr/l7iET9XXdXdniG44m/C25ktce+fcW+is09idRciv
         9PnG1GcqcfGZThEsZKZkYOK9DsyUc5HFUo2R9gaJ3UL6wPLuZ1TA3pZmFTwQp9UKataf
         9OzfOLz68fzm++hyrx9C7rP/OTk6jAQgDInkoIoSYQX4wOYRz3cCi3ZrPrlW6+EGGswT
         lx0A==
X-Gm-Message-State: APjAAAWQAd49hukQA7jt/8rd8g2abAmF2+cVrDt+WnI7ORsTtbBQDtAQ
        cn4SewhJ1T4XXvxNY4bX/tgn7w==
X-Google-Smtp-Source: APXvYqxn3X7t2eeYkVSs8EGGMN2YmD4eBs9wgN9WHox/TL/aZ7jv7fRKTQFb31OKCDaXpUtnH+6Y4g==
X-Received: by 2002:a19:f608:: with SMTP id x8mr6038466lfe.112.1573201766579;
        Fri, 08 Nov 2019 00:29:26 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id s7sm2215314ljo.98.2019.11.08.00.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 00:29:25 -0800 (PST)
Date:   Fri, 8 Nov 2019 09:29:24 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: Fix Allwinner A10 CSI binding
Message-ID: <20191108082924.GB22781@bigcity.dyn.berto.se>
References: <20191107222027.2529654-1-niklas.soderlund+renesas@ragnatech.se>
 <20191108074749.GB4345@gilmour.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191108074749.GB4345@gilmour.lan>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime,

On 2019-11-08 08:47:49 +0100, Maxime Ripard wrote:
> Hi Niklas,
> 
> On Thu, Nov 07, 2019 at 11:20:27PM +0100, Niklas Söderlund wrote:
> > Running 'make dt_binding_check' on the binding results in error and
> > message:
> >
> >   Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> >
> > Fix this by using the correct path in $id.
> >
> > Fixes: c5e8f4ccd7750487 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Which tag / tree are you using to see this? We should have a fix in
> -rc5 already

I was working at the media-tree master when I spotted this and check 
Rob's tree dt/next branch [1] if it was fixed before sending this. But 
I'm glad to learn it is fixed elsewhere, so please drop/ignore this 
patch.

1. git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git

-- 
Regards,
Niklas Söderlund
