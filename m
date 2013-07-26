Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp1-g21.free.fr ([212.27.42.1]:41150 "EHLO smtp1-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751265Ab3GZG2K convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 26 Jul 2013 02:28:10 -0400
Date: Fri, 26 Jul 2013 08:28:18 +0200
From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 2/4] ASoc: kirkwood: simplify probe error
Message-ID: <20130726082818.480d2a02@armhf>
In-Reply-To: <20130725191059.GO9858@sirena.org.uk>
References: <20130725111357.7c976963@armhf>
	<20130725191059.GO9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Rob Herring <rob.herring@calxeda.com>, Russell King <rmk+kernel@arm.linux.org.uk>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, 25 Jul 2013 20:10:59 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Thu, Jul 25, 2013 at 11:13:57AM +0200, Jean-Francois Moine wrote:
> > The function kirkwood_i2s_dev_remove() may be used when probe fails.
> 
> This seems fine but doesn't apply against current code but otherwise
> seems fine.

My base is 3.11-rc2.

> > +	if (!IS_ERR(priv->extclk)) {
> > +		clk_disable_unprepare(priv->extclk);
> > +		clk_put(priv->extclk);
> > +	}
> 
> Could use devm_clk_get() for extclk.

I will do it.

-- 
Ken ar c'hentañ	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
