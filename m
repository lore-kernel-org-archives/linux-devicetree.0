From: Alexander Stein <alexanders83@web.de>
Subject: Re: Re: Device tree support for Atmel AC97 controller on AT91SAM9263
Date: Mon, 14 Apr 2014 20:34:10 +0200
Message-ID: <3514422.OSZGxjlElf@kongar>
References: <1397293707-26890-1-git-send-email-alexanders83@web.de> <534B9ECF.806@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <534B9ECF.806@atmel.com>
Sender: linux-doc-owner@vger.kernel.org
To: Bo Shen <voice.shen@atmel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Bo,

On Monday 14 April 2014, 16:39:43 wrote Bo Shen:
> On 04/12/2014 05:08 PM, Alexander Stein wrote:
> > This set of patches add device tree support for the AC97 controller found
> > on AT91SAM9263.
> > The first two patches are minor cleanup, while the last ones add the actual
> > support.
> 
> I just test the whole patch series, and find issues to work with device 
> tree kernel.
> When we use dt kernel, no where assign the device id (so take it as 
> "-1"), so when register devices, it will be /dev/snd/pcmC0D-1p and 
> /dev/snd/pcmC0D-1c. So, the sound won't work.
> 
> The root cause is that when call "snd_pcm_new", it will pass 
> "chip->pdev->id" as parameter.
> 
> So, I am thinking whether this should be fix in <sound/atmel/ac97c.c> or 
> in <sound/core/pcm.c>

Ah. thanks for figuring out. I also noticed later that e.g. aplay actually doesn't work, but could not figure out why. pcmC0D-1c looked valid at first glance I wasn't aware that this includes a -1 :)
I was already happy that the controller found the codec.

Best regards,
Alexander

