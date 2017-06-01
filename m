From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: dts: bcm2835-rpi-zero: Enable OTG mode
Date: Thu, 1 Jun 2017 10:38:03 +0200 (CEST)
Message-ID: <542130487.90500.1496306283902@email.1und1.de>
References: <1495385079-3697-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1495385079-3697-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 21. Mai 2017 um 18:44 geschrieben:
> 
> 
> This patch series enable OTG mode for Raspberry Pi Zero because dwc2 driver
> has been fixed now.
> 
> Patch 1 adds a new dtsi file to setup OTG mode (could also be used for boards
> like RPi Zero W or the Compute Module). The second patch adds the USB PHY and
> was part of Raspberry Pi Zero support patch series before split up [1].
> The enabling of OTG mode of RPi Zero is done by patch number 3. The last patch
> updates the BCM2835 defconfig.
> 
> [1] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-July/004153.html
> 
> Stefan Wahren (4):
>   ARM: dts: bcm283x: Add dtsi for OTG mode
>   ARM: dts: bcm283x: Add generic USB PHY
>   ARM: dts: bcm2835-rpi-zero: Enable OTG mode
>   ARM: bcm2835_defconfig: Enable serial & ethernet USB gadget support
> 

No comments to this patch series?

Regards
Stefan
