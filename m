From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RFT] ARM: bcm2835: enable all bcm2835-relevant in
 defconfig
Date: Tue, 20 Oct 2015 20:32:20 -0600
Message-ID: <5626F934.6090706@wwwdotorg.org>
References: <1444942061-23085-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444942061-23085-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/15/2015 02:47 PM, Stefan Wahren wrote:
> Rebuild bcm2835_defconfig using "make bcm2835_defconfig;
> make savedefconfig", and add the following features:
> 
> * Enable all bcm2835-relevant drivers (MBOX, WDT, DMA,
>   PWM, SND)
> * Re-enable some features to keep the current settings
>   (stackprotector, LED GPIO, LED triggers)

Can you explain that second bullet a bit more?

When regenerating defconfig files, it is quite common for entries not
related to your changes to appear or disappear due to other changes in
the kernel or some of the remove options being selected by some of the
new options you enabled.

To check what's going on, I usually do the following when editing defconfig:

1) Rebuild bcm2835_defconfig without editing the .config file at all
(make bcm2835_defconfig; make savedefconfig; mv defconfig
arch/arm/configs/bcm2835_defconfig; git commit). This allows me to see
all the unrelated changes that will happen simply due to rebuilding the
defconfig. You should double-check these, but likely ignore them.

2) Now edit the .config (e.g. make menuconfig) and re-generate the
defconfig and commit. This change should now only include changes that
are a direct result of your .config edits.

To submit the patch, I often squash the two together after the separate
validation.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
