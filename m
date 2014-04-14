From: Alexander Stein <alexanders83@web.de>
Subject: Re: Re: Device tree support for Atmel AC97 controller on AT91SAM9263
Date: Mon, 14 Apr 2014 20:43:02 +0200
Message-ID: <2216396.r6UFNn5RuG@kongar>
References: <1397293707-26890-1-git-send-email-alexanders83@web.de> <s5h38hgnvz5.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <s5h38hgnvz5.wl%tiwai@suse.de>
Sender: linux-doc-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jaroslav Kysela <perex@perex.cz>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Takashi,

On Monday 14 April 2014, 10:42:06 wrote Takashi Iwai:
> At Sat, 12 Apr 2014 11:08:23 +0200,
> Alexander Stein wrote:
> > 
> > This set of patches add device tree support for the AC97 controller found
> > on AT91SAM9263.
> > The first two patches are minor cleanup, while the last ones add the 
actual
> > support.
> 
> Do you really need work on this driver?  The sound/atmel/* stuff is an
> old one before ASoC was introduced, mostly obsoleted nowadays.

Ah, ok. I wasn't aware of that. But is there a replacement for the ac97c 
driver? All I found in sound/soc/atmel is using the SSC peripheral. Not 
something I can use.
Regards,
Alexander

