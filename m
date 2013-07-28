Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:55213 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750831Ab3G1El3 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sun, 28 Jul 2013 00:41:29 -0400
Received: by mail-pb0-f52.google.com with SMTP id xa12so3432323pbc.11
        for <devicetree@vger.kernel.org>; Sat, 27 Jul 2013 21:41:29 -0700 (PDT)
From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: add vendor prefix for Altera Corp.
In-Reply-To: <51F2D686.4090104@wwwdotorg.org>
References: <1374867540-9477-1-git-send-email-dinguyen@altera.com> <51F2D686.4090104@wwwdotorg.org>
Date: Sat, 27 Jul 2013 22:41:25 -0600
Message-Id: <20130728044125.60F3A3E08FE@localhost>
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, dinguyen@altera.com
Cc: dinh.linux@gmail.com, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-ID: <devicetree@vger.kernel.org>

On Fri, 26 Jul 2013 14:05:26 -0600, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 07/26/2013 01:39 PM, dinguyen@altera.com wrote:
> 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> 
> > +altr	Altera Corp.
> 
> In the context of Marvel(?) wanting to change between a longer and
> stock-ticker vendor name, there was some discussion re: whether we had
> decided not to use stock tickers any more. Is there still consensus that
> we should? If so, I have no problem with this patch, but I wanted to
> make sure everyone was on the same page.

Stock ticker names are just fine by me. But once set they should not
change.

g.



