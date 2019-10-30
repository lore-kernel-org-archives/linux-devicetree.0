Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057AFCA9EC5
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 13:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFE0820663
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 13:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572441578;
	bh=ra6moXYzy0hIbE0AHUgGHDt0UskEi5om0CXsfEWjvuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VjL+KVtR7j3OP7ebDcxLWrlQT30N+Y3tXQTQgaebuqyyqWEe/b3kkXYnCQ0VoV3/e
	 h1C3RBQg6JTFaIq8dIXY5taBa7Yo9cQVEECKiCafc/cXqEOC0V4B2Wk48VkmjGQ1wL
	 xFF9awms4c/J9Xzb6MpV7fBvwvD+SNFc/sfryr4Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfJ3NTi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 09:19:38 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:38144 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfJ3NTi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 09:19:38 -0400
Received: by mail-oi1-f178.google.com with SMTP id v186so1913111oie.5
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 06:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4uZvf2SLPbgSvND5suWyk4sKJhzdV6KvlHdl+dAYBkk=;
        b=EIW7htKEy49hi2y/zQrhyRyBa2rWgRY8WMfhGgZfwh9w+uK1xeTaQsHXyH7L3nkAIl
         b2gvOsQL466kntWK+NcU5S+kk7x7DGEHSI8I3EI0hZzVvzWajer5qDpdbHxBbVaBDpYx
         CHRJZGnlLNzmC5W4OtQ15DbfiNc075uZ9f2RPceE24CRSdOuK89tJZEgtspFo1zgjxj2
         zxJ7PPDWJEENp4Dlq+G03Zuj+l0Gay+1tqA5sl9k1F2pZ8fbXbFSIinhqRXKLsY536E+
         R0R12N6/rXQxfHokgZ0rCSL09R7cXzvYNRI6soMgXRDt39+1UvyKSeYxVwyzR8/X4lkl
         DSWA==
X-Gm-Message-State: APjAAAVRI0yP3tgHrCB7le7ng3eX7x9wn7PClddWfqhBFcyxt+GxnU7Z
        33pWkCCMobiR9UlfbzCPwg==
X-Google-Smtp-Source: APXvYqzah+931Ecw5URXBxJeZ05no8oezkxJvtKBsBAP5qh1b39S9YctxqXpOZJ1qDVRIGAeGMZ20Q==
X-Received: by 2002:aca:cdc2:: with SMTP id d185mr8819443oig.35.1572441577484;
        Wed, 30 Oct 2019 06:19:37 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b12sm1309oie.52.2019.10.30.06.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 06:19:36 -0700 (PDT)
Date:   Wed, 30 Oct 2019 08:19:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     DTML <devicetree@vger.kernel.org>
Subject: Re: DT schemas for multi-transport bindings
Message-ID: <20191030131936.GA26946@bogus>
References: <CAKdAkRQNrDGWFOcoVTfjMS25E4JqSFs98yOQ8_1q7V612az_0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKdAkRQNrDGWFOcoVTfjMS25E4JqSFs98yOQ8_1q7V612az_0A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Oct 25, 2019 at 01:43:33PM -0700, Dmitry Torokhov wrote:
> Hi Rob,
> 
> I am trying to wrap my mind around converting multi-transport bindings
> (let's say TSC2004/5 controller which is pretty much the same part, but
> one is I2C while another is SPI interface). There is a set of common
> properties, and then we can have transport-specific ones (for example,
> spi-max-frequency for SPI case). 

I'm pretty sure we already have some examples of this.

You could have 3 files with common props, i2c props, and spi props, but 
that's probably an overkill. I'd just list all the possible properties 
in one file and then they can be made conditional as needed.

For bus properties you really only need to list them if required or you 
have additional constraints.

> Is it possible to annotate that some
> properties are only needed for certain compatible, similarly to how
> patternProperties work (but instead of matching node name we'd match on
> compatible)?

Yes, with if/then schema. There's numerous examples of this. It's a 
little more verbose than I'd like, but that's because generally each 
property schema is independent.


> Also, from syntax POV, how do I reference file ooutside of current
> directory? I.e. how do I reference .../spi/spi-controller.yaml from
> .../input/touchscreen/tsc2005.yaml?

You don't. TSC2005 is not a SPI controller/master. Every SPI controller 
should reference spi-controller.yaml and that defines the bus structure 
and allowed SPI bus properties in child nodes.

If you did though, it would be '../spi/spi-controller.yaml'

Rob
