From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 6/9] ASoC: dt-bindings: bcm2835-rpi: add onboard audio
 bindings
Date: Tue, 16 Oct 2018 17:56:56 +0200
Message-ID: <4039d99c-5e57-c9d3-3af5-bc160e1adb57@i2se.com>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
 <20181016150228.16994-7-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181016150228.16994-7-nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Content-Language: de-DE
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Nicolas,

Am 16.10.2018 um 17:02 schrieb Nicolas Saenz Julienne:
> Adds a device tree binding file for Raspberry pi's Headphones and HDMI
> audio output devices.
>
> Based on raspberry's downstream kernel implementation:
> https://github.com/raspberrypi/linux/blob/rpi-4.14.y/arch/arm/boot/dts/bcm2708-rpi.dtsi
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
> ---
>  .../bindings/sound/brcm,bcm2835-audio.txt         | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt b/Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt
> new file mode 100644
> index 000000000000..ee6fa085aaa9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/brcm,bcm2835-audio.txt
> @@ -0,0 +1,15 @@
> +Broadcom BCM283x audio device
> +
> +Required properties:
> +
> +- compatible: Should be "brcm,bcm2835-audio"
> +- brcm,pwm-channels: number of PWM channels, they are behind RPi's Video Core
> +		     IV, not actual Linux PWM devices.
> +
> +Example:
> +
> +audio: audio {
> +	compatible = "brcm,bcm2835-audio";
> +	brcm,pwm-channels = <8>;
> +};
> +

i apologize but it seems to me that the TODO mentioned in the cover
letter isn't update to date anymore.

Phil Elwell posted an important bugfix for vchiq before [1], but only
the driver part has been applied yet. After applying the DT changes i'm
not sure if it still works.

AFAIK the audio driver uses VCHIQ as a software interface and the
binding doesn't describe the real hardware.

Since the camera driver will be registered as a platform device [2], i
prefer this way for the audio driver, too.

I'm actually working on this here [3] (currently only compile tested).

Stefan

[1] - https://patchwork.ozlabs.org/cover/970434/
[2] - https://lore.kernel.org/patchwork/patch/904411/
[3] - https://github.com/anholt/linux/commits/bcm2835-audio
