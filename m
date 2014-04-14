From: Bo Shen <voice.shen@atmel.com>
Subject: Re: Device tree support for Atmel AC97 controller on AT91SAM9263
Date: Mon, 14 Apr 2014 16:39:43 +0800
Message-ID: <534B9ECF.806@atmel.com>
References: <1397293707-26890-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1397293707-26890-1-git-send-email-alexanders83@web.de>
Sender: linux-doc-owner@vger.kernel.org
To: Alexander Stein <alexanders83@web.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Alexander,

On 04/12/2014 05:08 PM, Alexander Stein wrote:
> This set of patches add device tree support for the AC97 controller found
> on AT91SAM9263.
> The first two patches are minor cleanup, while the last ones add the actual
> support.

I just test the whole patch series, and find issues to work with device 
tree kernel.
When we use dt kernel, no where assign the device id (so take it as 
"-1"), so when register devices, it will be /dev/snd/pcmC0D-1p and 
/dev/snd/pcmC0D-1c. So, the sound won't work.

The root cause is that when call "snd_pcm_new", it will pass 
"chip->pdev->id" as parameter.

So, I am thinking whether this should be fix in <sound/atmel/ac97c.c> or 
in <sound/core/pcm.c>

> Regards,
> Alexander

Best Regards,
Bo Shen
