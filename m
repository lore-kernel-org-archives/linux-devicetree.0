Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39840CA9EC7
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 23:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07C7E2087E
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 23:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uozl1ELV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfJ3XSl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 19:18:41 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:39196 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJ3XSl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 19:18:41 -0400
Received: by mail-pg1-f177.google.com with SMTP id p12so2588207pgn.6
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 16:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lxWw3sg/wp8ytVWvO/eQePkMjgvMppjhidwi9Ib/AEw=;
        b=uozl1ELV4qWUt9I3+u5lCHlca6pNCmzY7w/XOe3YftjYD7ZA1wUfzQn0G6K08B3TQN
         Y/juKm6qUvqAgIclUAoweJI2PHNpUmQ9WtwAfgB/WJQirOWLmV7Qz3V2v2YTPpZc0GFr
         /V8SRSeFz70a7Em9m8AXp24HpoAxQxzcXFdity9sN51E74KAm59SfERs4rwA50JV9FXN
         Wk7lYaQ8lGBRff08ExcJapUOrjg6SZbSjbWRyvE05CgyvrQ8GNDJHVMqJihEbvBvpinY
         OCnla5EzSjSCVFfpfiCtwimDT3moW3zA1+jiIleQnxLEJbfb4mq+ZL1sTHGpXJj5CeiJ
         MYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lxWw3sg/wp8ytVWvO/eQePkMjgvMppjhidwi9Ib/AEw=;
        b=AoDse3dyueXI36+XfmcXT6YHZq6dogGO9qPy0hbXafCelsAOmmsi+l/HugKd1rVkRI
         AkiC7W6b3uVCavZDDc76c9cI7tP0EGj2bBFHvc/YAvm6M6Uvl1BTj08sgkGZdtL7uW1I
         JE0PZwTvpDf6Ngm2bML3kq4caExder/zGZNXpDvGmQrJCPOr5JqWXayA2R9tCITuDJBK
         GM27BZaPaXCXNi/hfau/8XyA32JH6d8JWeeMidUknRhZDQ1FBHTbpGFsLmmaAJYt8zXX
         zZo1vrS2BOhOqyiSFoRJRZ7R30PL8AKyOdCmfuJdYb8Kku7anpa1lRTte56rRdarFt6U
         PSpQ==
X-Gm-Message-State: APjAAAVFIpf+6SJkUJOoCzlp0GJdfEMV0t8FtMhFUvvbutaWkEc4tBBN
        vjgvdC9Uy8DRCodBSlROKGM=
X-Google-Smtp-Source: APXvYqyMAs9IoioyotgVSJ75Y35x5xHj3VIx2PNJ+H2CBPu26c3LLGkGAWynqX/VbLjgYHUC8WrlWg==
X-Received: by 2002:a63:ab43:: with SMTP id k3mr2215920pgp.170.1572477520032;
        Wed, 30 Oct 2019 16:18:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e1sm859138pgv.82.2019.10.30.16.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 16:18:38 -0700 (PDT)
Date:   Wed, 30 Oct 2019 16:18:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>
Subject: Re: DT schemas for multi-transport bindings
Message-ID: <20191030231836.GJ57214@dtor-ws>
References: <CAKdAkRQNrDGWFOcoVTfjMS25E4JqSFs98yOQ8_1q7V612az_0A@mail.gmail.com>
 <20191030131936.GA26946@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030131936.GA26946@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 30, 2019 at 08:19:36AM -0500, Rob Herring wrote:
> On Fri, Oct 25, 2019 at 01:43:33PM -0700, Dmitry Torokhov wrote:
> > Hi Rob,
> > 
> > I am trying to wrap my mind around converting multi-transport bindings
> > (let's say TSC2004/5 controller which is pretty much the same part, but
> > one is I2C while another is SPI interface). There is a set of common
> > properties, and then we can have transport-specific ones (for example,
> > spi-max-frequency for SPI case). 
> 
> I'm pretty sure we already have some examples of this.
> 
> You could have 3 files with common props, i2c props, and spi props, but 
> that's probably an overkill. I'd just list all the possible properties 
> in one file and then they can be made conditional as needed.
> 
> For bus properties you really only need to list them if required or you 
> have additional constraints.
> 
> > Is it possible to annotate that some
> > properties are only needed for certain compatible, similarly to how
> > patternProperties work (but instead of matching node name we'd match on
> > compatible)?
> 
> Yes, with if/then schema. There's numerous examples of this. It's a 
> little more verbose than I'd like, but that's because generally each 
> property schema is independent.

Ah, I see, I think that's what I've been looking for.

> 
> 
> > Also, from syntax POV, how do I reference file ooutside of current
> > directory? I.e. how do I reference .../spi/spi-controller.yaml from
> > .../input/touchscreen/tsc2005.yaml?
> 
> You don't. TSC2005 is not a SPI controller/master.

Right, but spi-controller.yaml contains not only properties for SPI
controllers, but also for the device (behind patternProperties: on
"^.*@[0-9a-f]+$").

> Every SPI controller 
> should reference spi-controller.yaml and that defines the bus structure 
> and allowed SPI bus properties in child nodes.
> 
> If you did though, it would be '../spi/spi-controller.yaml'

OK, I'll try this out.

Thanks.

-- 
Dmitry
