Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B04C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 16:27:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEE112054F
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589387250;
	bh=g6GiGczhmf+g+byN0roxP64vIPVCzaJ2Z5yZAZHgr6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=J41psIiNIOTEKrneOQsOEdFhGgVP8ZbVeyW3td1atg+eRtjdcATCxYACIht/yIlMt
	 zU3qIf0JdsEkw4sPBTr7Q4nhjceYxvc18edX3EJpQW5TBQq8GkS1Gs5cbUOQ6wBKCc
	 YlU65/tqKr3a+eKzhAc4qL+dJ4QwxbwTsjexfI9s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389579AbgEMQ1Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 12:27:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:44002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730831AbgEMQ1Z (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 12:27:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2BB082054F;
        Wed, 13 May 2020 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589387245;
        bh=g6GiGczhmf+g+byN0roxP64vIPVCzaJ2Z5yZAZHgr6A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XcTsglP7Uhy3v2UDLIBmw1dlptj+bzoBUL9ePPOwBjoBxDPQpJAM2In6Hj4H8w/V7
         ZJVmYXG5BZzhaSpxF/v0m7x/GaTC2vc9hVi9LsVsYNur6Rg5JqoAqQ1oMaL8Ng03kL
         2yqWfM3BUKWkbrK7dqG2jVM8He2LzjEU4ciTC+NU=
Date:   Wed, 13 May 2020 18:27:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v10 1/5] usb: xhci: Change the XHCI link order in the
 Makefile
Message-ID: <20200513162723.GF1362525@kroah.com>
References: <20200512150019.25903-1-alcooperx@gmail.com>
 <20200512150019.25903-2-alcooperx@gmail.com>
 <20200513122613.GA1023594@kroah.com>
 <7acc2a4c-caab-11e7-7b3f-4176f19c58cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7acc2a4c-caab-11e7-7b3f-4176f19c58cf@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 08:08:07AM -0700, Florian Fainelli wrote:
> 
> 
> On 5/13/2020 5:26 AM, Greg Kroah-Hartman wrote:
> > On Tue, May 12, 2020 at 11:00:15AM -0400, Al Cooper wrote:
> >> Some BRCMSTB USB chips have an XHCI, EHCI and OHCI controller
> >> on the same port where XHCI handles 3.0 devices, EHCI handles 2.0
> >> devices and OHCI handles <2.0 devices. Currently the Makefile
> >> has XHCI linking at the bottom which will result in the XHIC driver
> >> initalizing after the EHCI and OHCI drivers and any installed 3.0
> >> device will be seen as a 2.0 device. Moving the XHCI linking
> >> above the EHCI and OHCI linking fixes the issue.
> > 
> > What happens if all of these are modules and they are loaded in a
> > different order?  This makefile change will not help with that, you need
> > to have logic in the code in order to properly coordinate this type of
> > mess, sorry.
> 
> I believe we should be using module soft dependencies to instruct the
> module loaders to load the modules in the correct order, so something
> like this would do (not tested) for xhci-plat-hcd.c:
> 
> MODULE_SOFTDEP("post: ehci-hcd ohci-hcd");
> 
> and I am not sure whether we need to add the opposite for ehci-hcd and
> ohci-hcd:
> 
> MODULE_SOFTDEP("pre: xhci-plat-hcd");

That's a nice start, but what happens if that isn't honored?  This
really needs to work properly for any order as you never can guarantee
module/driver loading order in a system of modules.

thanks,

greg k-h
