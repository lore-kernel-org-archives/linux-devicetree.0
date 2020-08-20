Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6891DC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 18:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34821206DA
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 18:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="FGGRRbgE";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="LqOtEcUo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgHTSoL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 14:44:11 -0400
Received: from pb-smtp21.pobox.com ([173.228.157.53]:57463 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgHTSoK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 14:44:10 -0400
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id E4FCFD7782;
        Thu, 20 Aug 2020 14:44:06 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=UomrMm5bcgzpxgdvjlxwU/yEVXE=; b=FGGRRb
        gELH5cyjzd1Avhb6ilcDU5hDjN9cGhPp55eKeFVvqkfctRrvWenlYmywhmcqNWA6
        Oagp7Y/d1vJAW6bJ7rU6gZS+9bG5XkCdGaTKVrI6ZFOxlg/SiQNxZZY16Gfd3/l+
        D/wu+zJS7u7Z9WXn9HeAfzEmzi5lX+vHVN07M=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id DD0C9D7780;
        Thu, 20 Aug 2020 14:44:06 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=c/Nfirp6joUaEo3iAz0m08gMi6Aof9jBfhAxKUXLcJA=; b=LqOtEcUodIZ1k+UveOqJcwsi3xXN8Ai+9MMDlSsCa+XmHZxLaymygxKJXwkiY+HsMatTBw3hdtRfaL0yFs4RSo0//P78uETIFHPl1o5VKcUuH/asb3mK6SjeuujqfN4MPZb+OH1kP/DO25BUYOSWgLG7zM0bLhT7qMa0UOLmZZg=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id C9F45D777D;
        Thu, 20 Aug 2020 14:44:03 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id EDCAD2DA01C4;
        Thu, 20 Aug 2020 14:44:01 -0400 (EDT)
Date:   Thu, 20 Aug 2020 14:44:01 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Boris Brezillon <boris.brezillon@collabora.com>
cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Subject: Re: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
In-Reply-To: <20200820191424.29c42972@collabora.com>
Message-ID: <nycvar.YSQ.7.78.906.2008201425490.1479@knanqh.ubzr>
References: <20200814034854.460830-1-nico@fluxnic.net> <20200814034854.460830-3-nico@fluxnic.net> <20200820100829.0e44200a@xps13> <20200820103944.08a55ba4@collabora.com> <nycvar.YSQ.7.78.906.2008201234370.1479@knanqh.ubzr>
 <20200820191424.29c42972@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 1EC7AEEA-E315-11EA-B4B7-843F439F7C89-78420484!pb-smtp21.pobox.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 20 Aug 2020, Boris Brezillon wrote:

> On Thu, 20 Aug 2020 12:47:49 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > On Thu, 20 Aug 2020, Boris Brezillon wrote:
> > 
> > > On Thu, 20 Aug 2020 10:08:29 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >   
> > > > > +		/*
> > > > > +		 * TODO: Extend the subsystem layer to allow for registering
> > > > > +		 * new device and provide BCR/DCR/PID at the same time.    
> > > > 
> > > > Not sure this is needed if you don't use it directly as the core will
> > > > anyway (in its current form) send the relevant CCC to read these
> > > > registers.  
> > > 
> > > We considered optimizing that in the past but that means making the DAA
> > > and SETDASA registration different. I'm not sure it's worth it to be
> > > honest, PID/DCR/BCR only happens when initializing devices and I
> > > suspect the overhead of querying those DATA twice in case of DAA is
> > > negligible anyway.  
> > 
> > Wellllll... I know some people who do feel strongly about this 
> > particular issue for some reasons.
> 
> Mind developing a bit why? Boot-time maybe?

Mind you, I'd prefer for those people to argue their use case themselves 
as I'm still not fully convinced myself. But yeah, this has something to 
do with latency.

And v2 of the spec goes a step further by making the DAA procedure give 
you the PID/DCR/BCR of the winning device before you provide it the 
address to be assigned, so you could skip SETDASA/SETNEWDA altogether by 
giving it the final address up front. But in order for this to work the 
subsystem would have to provide a query method that would go like: 
here's some PID/DCR/BCR: please give me the best address to assign this 
device... oh and do so within a 150ms delay.

> > So I'd prefer giving them some hope 
> > and leave the door open to some i3c_master_add_i3c_dev_and_info() 
> > interface. In the end, it's just a matter of pre-filling the info struct 
> > and skipping the PID retrieval in i3c_master_getpid_locked() if already 
> > available, etc.
> 
> I'm definitely not closing the door, but I'd like to understand why this
> is so important to them :-). Anyway, if the changes are not invasive, I
> don't have a good reason to refuse it.

Right. At least now you've been warned this might be coming.


Nicolas
