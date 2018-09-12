From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 0/2] Improve VCHIQ cache line size handling
Date: Wed, 12 Sep 2018 18:14:41 +0200 (CEST)
Message-ID: <1498939614.170466.1536768881431@email.1und1.de>
References: <1536764809-132672-1-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1536764809-132672-1-git-send-email-phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Phil,

> Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> hat am 12. September 2018 um 17:06 geschrieben:
> 
> 
> Both sides of the VCHIQ communications mechanism need to agree on the cache
> line size. Using an incorrect value can lead to data corruption, but having the
> two sides using different values is usually worse.
> 
> In the absence of an obvious convenient run-time method to determine the
> correct value in the ARCH=arm world, the downstream Raspberry Pi trees used a
> Device Tree property, written by the firmware, to configure the kernel driver.
> This method was vetoed during the upstreaming process, so a fixed value of 32
> was used instead, and some corruptions ensued. This is take 2 at arriving at
> the correct value.
> 
> Part one of the fix is deriving the correct value from the ARM's cpuid register.
> Part two is a (seemingly cosmetic) correction of the Device Tree reg declaration
> used by the driver, but it doubles as an indication to the Raspberry Pi firmware
> that the kernel driver is running a recent kernel driver that chooses the
> correct value. As such I would like very much for the DT patch not to be merged
> before the driver patch - just tell me what hoops I need to jump through.
> 

thanks for sending this series. But please resend with Russell King, Arnd Bergmann, linux-arm-kernel and bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org mailing list in CC.

Stefan
