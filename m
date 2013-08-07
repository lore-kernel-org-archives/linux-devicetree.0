Return-Path: <devicetree-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53583 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751281Ab3HGPmt (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 11:42:49 -0400
Date: Wed, 7 Aug 2013 17:42:47 +0200
From: Pavel Machek <pavel@denx.de>
Subject: Re: [RESEND PATCH 4/4] arm: socfpga: Add support for SD/MMC and
 ethernet to defconfig
Message-ID: <20130807154247.GB26017@amd.pavel.ucw.cz>
References: <1375739925-9110-1-git-send-email-dinguyen@altera.com>
 <1375739925-9110-5-git-send-email-dinguyen@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375739925-9110-5-git-send-email-dinguyen@altera.com>
Sender: devicetree-owner@vger.kernel.org
To: dinguyen@altera.com
Cc: dinh.linux@gmail.com, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
List-ID: <devicetree@vger.kernel.org>

Hi!

> Update the socfpga_defconfig to include dw_mmc driver and Micrel PHY.
> Also enable EXT3 and NFS FS support.
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

Reviewed-by: Pavel Machek <pavel@denx.de>

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
