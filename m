Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:63454 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753574Ab3HQPNZ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 17 Aug 2013 11:13:25 -0400
Received: by mail-bk0-f45.google.com with SMTP id mx11so940950bkb.4
        for <devicetree@vger.kernel.org>; Sat, 17 Aug 2013 08:13:24 -0700 (PDT)
From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: fsl: Add S/PDIF CPU DAI driver
Date: Sat, 17 Aug 2013 17:13:20 +0200
Message-ID: <2782793.dUculLxO6S@flatron>
In-Reply-To: <20130817150002.GU26614@pengutronix.de>
References: <cover.1376565456.git.b42378@freescale.com> <137675716.iLf1T1CVZo@flatron> <20130817150002.GU26614@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolin Chen <b42378@freescale.com>, ian.campbell@citrix.com, pawel.moll@arm.com, galak@codeaurora.org, broonie@kernel.org, lars@metafoo.de, p.zabel@pengutronix.de, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, timur@tabi.org, rob.herring@calxeda.com, shawn.guo@linaro.org, festevam@gmail.com, swarren@wwwdotorg.org, mark.rutland@arm.com
List-ID: <devicetree@vger.kernel.org>

On Saturday 17 of August 2013 17:00:02 Sascha Hauer wrote:
> On Sat, Aug 17, 2013 at 02:26:40PM +0200, Tomasz Figa wrote:
> > > You mean tx<0-7>.
> > > 
> > > Also I would make this option required. Use a dummy clock for mux
> > > inputs that are grounded for a specific SoC.
> > 
> > Why do you need a dummy clock?
> > 
> > The driver can simply try to grab all the possible clocks and discard
> > those that failed, so you can just keep those grounded clocks
> > unspecified.
> We don't need dummy clocks. My motivation saying this that I was afraid
> people try to configure the driver by skipping the clocks they don't
> want from the devicetree.

I'm not really sure if the same abuse couldn't be easily achieved by 
putting dummy clocks in place of those skipped clocks.

Adding a note in binding documentation that says that all clocks that are 
fed to the IP shall be specified should be fine IMHO.

Best regards,
Tomasz

