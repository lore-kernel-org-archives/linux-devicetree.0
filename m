Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C58C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 21:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FA122065F
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 21:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="sL1VXfAP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729891AbgF3Vmg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 17:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgF3Vmf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 17:42:35 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1517BC03E979
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 14:42:35 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lx13so3516316ejb.4
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9KeedTR4d1M1A9lgyC4RIPQ4BDuEfuh1R0OQqgZUzi0=;
        b=sL1VXfAPgIwpkRUrHOBR0S3KARGoo22IZpw9Ln2g/8uJA+D8cryT0fwcS0mYEYkDzG
         yDLdBOh9q71MnBNOFTtF3unADRfC9gu1GBSCTtGsBgHS9W4mu5t3tnpxAPmNwTnskgOg
         TWLztxM8wF0bes2alk/X6xmeT/w7HGsFTAP9aHS7URr8YM32N2R6EUsq6g4f4QUgGMEg
         jC+kF4hshwIXAwkSQ6D7laY0O9CRdk/7l47RZfA9MYkQXo8AGYdrfFphSiBj1/CSAYgv
         M8ObwDuq30pWBlHirX5f+k+3nE9rAnR4cJ68dXg/jRkbS6wRCI8Kc38ZpYV+0kkQCvMQ
         //Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9KeedTR4d1M1A9lgyC4RIPQ4BDuEfuh1R0OQqgZUzi0=;
        b=dRzpKMECe+NUtUoqpxxNqlaoLVm054wnFIrxWvX3it4nvCuRhk31qn65O5NiG8VL87
         0WnQYim/N0FptLXDnkqwT6Oo2zk+091M+XsxBJ5ID6Qoxm+0xdXzjRhooWI0I7z1qdrq
         YJ7JffAxSGuCAXb1iaSxf0+ZMdySoRJN+qi8Kq1Y/knt/XcSrgKNZfN8Ln7BL6fv32Qo
         c5fP7bkXzuFOSEOfFkXXtsZWgchMXhjovexoEWzRDmslm72dcLEyjBd9pQuaLLBKM1/s
         onOI4yndVrq64Paklm/+dd7aAwdC5hIr9WsvqMIBrfBiWNWzvh15iMWChilcen5lTno2
         blhw==
X-Gm-Message-State: AOAM530BEH98wsGNH4No5ERw1ffBnSiKOVg5dh9xad0cPhpuft+GZ/Hk
        S4q8c/662aQQuZXaw4jsKVM2ug==
X-Google-Smtp-Source: ABdhPJwD7IscC90qcbmTMPk4qGK1hD1gSWxsH3Y+4s9sG7AqHB/LiBso4JvYQ5CVJ4vCPdVo2IZqJw==
X-Received: by 2002:a17:906:95d9:: with SMTP id n25mr20683406ejy.437.1593553353709;
        Tue, 30 Jun 2020 14:42:33 -0700 (PDT)
Received: from x1 ([2001:16b8:5c28:7601:2d3c:7dcb:fbf0:3875])
        by smtp.gmail.com with ESMTPSA id cw19sm3024133ejb.39.2020.06.30.14.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 14:42:33 -0700 (PDT)
Date:   Tue, 30 Jun 2020 23:42:31 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: am335x-pocketbeagle: set default mux for
 gpio pins
Message-ID: <20200630214231.GA116238@x1>
References: <20200628152442.322593-1-drew@beagleboard.org>
 <20200629170358.GT37466@atomide.com>
 <20200630020102.GA45128@x1>
 <20200630182037.GF37466@atomide.com>
 <20200630213155.GA115731@x1>
 <20200630213423.GG37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630213423.GG37466@atomide.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 30, 2020 at 02:34:23PM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200630 21:32]:
> > On Tue, Jun 30, 2020 at 11:20:37AM -0700, Tony Lindgren wrote:
> ...
> > > > > Needing to change the dts does not sound good to me.. But maybe you mean
> > > > > this is needed until the gpio-omap and pinctrl-single patches are merged?
> > > >
> > > > I agree that I would like for userspace to be able to do run-time
> > > > changes.  However, I think something would need to be added to the
> > > > pinconf support in pinctrl-single for that to be possible.  There are
> > > > bias properties but non for receiver enable.
> > > > 
> > > > Does it seem sensible to add that?
> > > 
> > > Well let's see with Linus W says. To me it seems this might be a good
> > > reason to allow a sysfs interface to change the pinctrl if we don't
> > > have it yet? With the proper gpio line naming it should be quite simple
> > > to use too :)
> > 
> > I think if pinctrl-single allowed mux to be set through debugfs that
> > could be one solution to the use case of users prototyping with a
> > beaglebone.  Maybe that could be acceptable?
> 
> I think this should not depend on debugfs though, it should be a
> generic interface.

Ok, thanks.  I'm trying to imagine a solution as there no existing
pinctrl uAPI.  gpiod uAPI has gained some pinctrl functionality with
the work that Kent Gibson has been doing beyond just bias flags.

Do you think trying to plumb this through gpio-omap is a reasonable
approach?

thanks,
drew
