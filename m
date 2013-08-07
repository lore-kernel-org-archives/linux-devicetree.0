Return-Path: <devicetree-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57529 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932158Ab3HGTAh (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 15:00:37 -0400
Date: Wed, 7 Aug 2013 21:00:36 +0200
From: Pavel Machek <pavel@denx.de>
Subject: Re: [RESEND PATCH 3/4] ARM: socfpga: dts: Fix entries for the
 ethernet entries.
Message-ID: <20130807190036.GA12632@amd.pavel.ucw.cz>
References: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
 <1375739925-9110-4-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375739925-9110-4-git-send-email-dinguyen@altera.com>
Sender: devicetree-owner@vger.kernel.org
To: dinguyen@altera.com
Cc: dinh.linux@gmail.com, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
List-ID: <devicetree@vger.kernel.org>

Hi!

> From: Dinh Nguyen <dinguyen@altera.com>
> 
> Use the gate-clock emac_0_clk and emac_1_clk. Fix phy-addr binding to the
> correct snps,phy-addr binding.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@altera.com>
> Tested-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> CC: Arnd Bergmann <arnd@arndb.de>
> CC: Olof Johansson <olof@lixom.net>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ian.campbell@citrix.com>
> Cc: devicetree@vger.kernel.org
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Pavel Machek <pavel@denx.de>
> Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

With this patch, ethernet starts to work for me.

Reviewed-by: Pavel Machek <pavel@denx.de>
Tested-by: Pavel Machek <pavel@denx.de>

Thanks!
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
