Return-Path: <SRS0=E/bd=36=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB0DC352A5
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 11:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BE2620863
	for <linux-devicetree@archiver.kernel.org>; Mon, 10 Feb 2020 11:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbgBJLmQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 06:42:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:45570 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727003AbgBJLmQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Feb 2020 06:42:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 9A0A5AF00;
        Mon, 10 Feb 2020 11:42:12 +0000 (UTC)
Date:   Mon, 10 Feb 2020 12:42:11 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     lijiazi <jqqlijiazi@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        lijiazi <lijiazi@xiaomi.com>
Subject: Re: [PATCH v3 3/3] lib/vsprintf: add two device node flags
Message-ID: <20200210114211.ghtyu43g7c4veqdh@pathway.suse.cz>
References: <54fe6854ede6e2f22eb9775837da1ad7a13a3df4.1579423564.git.lijiazi@xiaomi.com>
 <2d432e67cab2eb51f36f5b2e904a185ef48df6e0.1579423564.git.lijiazi@xiaomi.com>
 <49e5a1c51283b3ea829dc7a04028121764cf5961.1579423564.git.lijiazi@xiaomi.com>
 <20200120141951.GO32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120141951.GO32742@smile.fi.intel.com>
User-Agent: NeoMutt/20170912 (1.9.0)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 2020-01-20 16:19:51, Andy Shevchenko wrote:
> On Mon, Jan 20, 2020 at 07:38:29PM +0800, lijiazi wrote:
> > Add two device node flags, and use OF_DEVICE_NODE_FLAG_MAX instead
> > of sizeof("xxxx").
> 
> ...
> 
> >  			tbuf[1] = of_node_check_flag(dn, OF_DETACHED) ? 'd' : '-';
> >  			tbuf[2] = of_node_check_flag(dn, OF_POPULATED) ? 'P' : '-';
> >  			tbuf[3] = of_node_check_flag(dn, OF_POPULATED_BUS) ? 'B' : '-';
> 
> > -			tbuf[4] = 0;
> 
> This is fine to leave untouched. See below.
> 
> > +			tbuf[4] = of_node_check_flag(dn, OF_OVERLAY) ? 'O' : '-';
> > +			tbuf[5] = of_node_check_flag(dn, OF_OVERLAY_FREE_CSET) ? 'F' : '-';
> 
> These two should be part of patch 1, which in turn should be last in the series.
> 
> > +			tbuf[OF_DEVICE_NODE_FLAG_MAX] = 0;
> 
> This one also, but in a form of explicit number, if you afraid of problems
> here, we may add something like

I agree that explicit number would be better here:

			tbuf[6] = 0;

And I like the build check. I would even check for the exact number.
It would help to keep the code updated when the number is modified.

	BUILD_BUG_ON(OF_DEVICE_NODE_FLAG_MAX != 6);

Finally, I would put all three changes into the same patch. And
remove the comment above OF_DEVICE_NODE_FLAG_MAX definition
completely.

Best Regards,
Petr
