From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2] Documentation: add Device tree bindings for
 hwmon/nct7802
Date: Mon, 7 Sep 2015 13:35:31 +0100
Message-ID: <20150907123531.GA11540@leverpostej>
References: <1441576829-15789-1-git-send-email-const@MakeLinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441576829-15789-1-git-send-email-const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Constantine Shulyupin <const-XSqIthwXjGBDPfheJLI6IQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 06, 2015 at 10:59:49PM +0100, Constantine Shulyupin wrote:
> Changed in v2:
> - Removed nct7802,reg-init
> - Added registers initialization by names
> 
> Introduced in v1:
>  - nct7802,reg-init
> 
> Signed-off-by: Constantine Shulyupin <const-GkuDRZ1haSFDPfheJLI6IQ@public.gmane.org>
> ---
> ---
>  .../devicetree/bindings/hwmon/nct7802.txt          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nct7802.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/nct7802.txt b/Documentation/devicetree/bindings/hwmon/nct7802.txt
> new file mode 100644
> index 0000000..56214bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/nct7802.txt
> @@ -0,0 +1,24 @@
> +Nuvoton NCT7802Y Hardware Monitoring IC
> +
> +Required node properties:
> +
> + - "compatible": must be "nuvoton,nct7802"
> + - "reg": I2C bus address of the device
> +
> +Optional properties:
> +
> +One byte registers:
> + - nct7802,Start
> + - nct7802,Mode
> + - nct7802,EnPECI
> + - nct7802,EnFan
> + - nct7802,EnV

The binding doesn't describe what these actually represent, what type
they are, etc.

Also, "nct7802" is not a vendor prefix, and the camelcase naming is
unusual.

Why do you think you need these? Why must raw valeus be used rather than
giving the kernel the information it needs to derive these for itself?

Mark.

> +
> +Example nct7802 node:
> +
> +nct7802 {
> +	compatible = "nuvoton,nct7802";
> +	reg = <0x2a>;
> +	nct7802,Start = <0x01>;
> +	nct7802,Mode = <0x7E>; // RTD1_MD = 2
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
