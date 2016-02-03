From: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: bcm2835: dt: Add the ethernet to the device tree
Date: Thu, 04 Feb 2016 00:41:39 +0100
Message-ID: <m37fil8iq4.fsf@euphor.blino.org>
References: <1454511759-24827-1-git-send-email-lkundrak@v3.sk>
 <1454511759-24827-3-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1454511759-24827-3-git-send-email-lkundrak-NGH9Lh4a5iE@public.gmane.org> (Lubomir
 Rintel's message of "Wed, 3 Feb 2016 16:02:39 +0100")
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> writes:

> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> index ef54050..32bbd2a 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts

Hi,

Shouldn't this be common to all RPi1 B and RPi2 models, instead of being
specific to just RPi B+?

> +&usb {
> +	usb1@01 {
> +		compatible = "usb1d6b,0002";
> +		reg = <01>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethernet: usbether@01 {
> +			compatible = "usb0424,9514";
> +			reg = <01>;
> +		};
> +	};
> +};

For reference, on RPi2:
Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp. SMSC9512/9514 Fast Ethernet Adapter
Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

Thanks

-- 
Olivier Blin - blino
