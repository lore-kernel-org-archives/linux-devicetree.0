From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: Re: Device tree support for Atmel AC97 controller on AT91SAM9263
Date: Tue, 15 Apr 2014 00:47:11 +0200
Message-ID: <20140414224710.GX2967@piout.net>
References: <1397293707-26890-1-git-send-email-alexanders83@web.de>
 <s5h38hgnvz5.wl%tiwai@suse.de>
 <2216396.r6UFNn5RuG@kongar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2216396.r6UFNn5RuG@kongar>
Sender: linux-doc-owner@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Takashi Iwai <tiwai@suse.de>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Randy Dunlap <rdunlap@infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 14/04/2014 at 20:43:02 +0200, Alexander Stein wrote :
> Hello Takashi,
> 
> On Monday 14 April 2014, 10:42:06 wrote Takashi Iwai:
> > At Sat, 12 Apr 2014 11:08:23 +0200,
> > Alexander Stein wrote:
> > > 
> > > This set of patches add device tree support for the AC97 controller found
> > > on AT91SAM9263.
> > > The first two patches are minor cleanup, while the last ones add the 
> actual
> > > support.
> > 
> > Do you really need work on this driver?  The sound/atmel/* stuff is an
> > old one before ASoC was introduced, mostly obsoleted nowadays.
> 
> Ah, ok. I wasn't aware of that. But is there a replacement for the ac97c 
> driver? All I found in sound/soc/atmel is using the SSC peripheral. Not 
> something I can use.

I guess what Takashi wanted to say was: shouldn't we rewrite the driver
completely to take advantage of the ASoC infrastructure ?

I'm actually quite interesting in getting it to work as this is the la
peripheral that doesn't have DT support on the SAM9RL.

I'll make some comments on your patches but I'm not sure whether we
should keep that driver or move to ASoC. Maybe that could be an
intermediate step. I'll try to have a look this week.

Thank you for your work !

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
