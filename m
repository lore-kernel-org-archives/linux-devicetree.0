Return-Path: <devicetree-owner@vger.kernel.org>
Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]:52005 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750748Ab3IFInA convert rfc822-to-8bit
	(ORCPT <rfc822;devicetree@vger.kernel.org>);
	Fri, 6 Sep 2013 04:43:00 -0400
Date: Fri, 6 Sep 2013 16:42:51 +0800
From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: mxs: add pinctrl header files
Message-ID: <20130906084249.GB4624@S2101-09.ap.freescale.net>
References: <20130812072957.GB25061@S2101-09.ap.freescale.net>
 <1378127036-24861-1-git-send-email-LW@KARO-electronics.de>
 <20130904022120.GI17900@S2101-09.ap.freescale.net>
 <21032.19314.841280.270142@ipc1.ka-ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <21032.19314.841280.270142@ipc1.ka-ro>
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Cc: devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Sep 05, 2013 at 11:14:26AM +0200, Lothar Wa�mann wrote:
> Hi,
> 
> Shawn Guo writes:
> > On Mon, Sep 02, 2013 at 03:03:53PM +0200, Lothar Wa�mann wrote:
> > > Changes vs. v2:
> > > - move header files to arch/arm/boot/dts
> > > - update documentation file to use the defined names rather than
> > >   numeric values and remove the pinmux-id list
> > 
> > The series does not apply against my imx/dt-3.13 branch.  Can you please
> > rebase?
> > 
> Where can I find that, or what is your branch based on?

It might be easier for you to just use my for-next branch below.

git://git.linaro.org/people/shawnguo/linux-2.6.git for-next

Shawn

