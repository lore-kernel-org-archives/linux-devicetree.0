Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f50.google.com ([209.85.214.50]:48969 "EHLO
	mail-bk0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753004Ab3HQM0p (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 08:26:45 -0400
Received: by mail-bk0-f50.google.com with SMTP id mz11so959931bkb.9
        for <devicetree@vger.kernel.org>; Sat, 17 Aug 2013 05:26:44 -0700 (PDT)
From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Date: Sat, 17 Aug 2013 14:26:40 +0200
Message-ID: <137675716.iLf1T1CVZo@flatron>
In-Reply-To: <20130816085632.GO26614@pengutronix.de>
References: <cover.1376565456.git.b42378@freescale.com> <20130816080124.GE1846@MrMyself> <20130816085632.GO26614@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolin Chen <b42378@freescale.com>, ian.campbell@citrix.com, pawel.moll@arm.com, galak@codeaurora.org, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, swarren@wwwdotorg.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Friday 16 of August 2013 10:56:32 Sascha Hauer wrote:
> On Fri, Aug 16, 2013 at 04:01:25PM +0800, Nicolin Chen wrote:
> > Hi Sascha,
> > 
> >    Thank you for the detailed comments.
> > 
> > On Fri, Aug 16, 2013 at 09:08:18AM +0200, Sascha Hauer wrote:
> > > Which of them the driver should use is configuration and thus
> > > normally
> > > should *not* be described in the devicetree. However, there may be
> > > no
> > > good way for the driver to know which clock to use in which case.
> > > There
> > > may be additional board requirements which are unknown to the
> > > driver. So in this case it might be valid to put the information
> > > which clock to use into the devicetree. But be aware that from the
> > > moment you put this information into the devicetree the driver is
> > > no longer free to chose the best clock, even if in future we find a
> > > good way to automatically guess the best clock. Do you have some
> > > insights in which case I would use which input clock? Is this only
> > > about which clock has the best suitable input frequency or is this
> > > also about synchronization of the audio signal with some other
> > > unit?
> > 
> > I understand. What I'm thinking now is to let the driver find the best
> > clock source for tx clock and a correspond divisor like this:
> > 
> > "tx<0-8>"	Optional	Tx clock source for spdif playback.
> > 
> > 				If absent, will use core clock.
> > 				The index from 0 to 8 is identical
> > 				to the clock source list described
> > 				in TxClk_Source bit of register STC.
> > 				Multiple clock source are allowed
> > 				for this tx clock source. The driver
> > 				will select one source from them for
> > 				each supported sample rate according
> > 				to the clock rates of these provided
> > 				clock sources.
> 
> You mean tx<0-7>.
> 
> Also I would make this option required. Use a dummy clock for mux inputs
> that are grounded for a specific SoC.

Why do you need a dummy clock?

The driver can simply try to grab all the possible clocks and discard 
those that failed, so you can just keep those grounded clocks unspecified.

Best regards,
Tomasz

