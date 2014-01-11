From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 12/28] drm/i2c: tda998x: add DT support
Date: Sat, 11 Jan 2014 17:38:17 +0000
Message-ID: <20140111173817.GZ15937@n2100.arm.linux.org.uk>
References: <20140109120324.4e2c8aca@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140109120324.4e2c8aca@armhf>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jan 09, 2014 at 12:03:24PM +0100, Jean-Francois Moine wrote:
> diff --git a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
> new file mode 100644
> index 0000000..f07339e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
> @@ -0,0 +1,16 @@
> +Device-Tree bindings for the NXP TDA998x HDMI transmitter
> +
> +Required properties;
> +  - compatible: must be "nxp,tda998x"
> +
> +Optional properties:
> +  - video-ports: 24 bits value - default: <0x230145>
> +
> +Example:
> +
> +	tda998x: hdmi-encoder {
> +		compatible = "nxp,tda998x";
> +		reg = <0x70>;
> +		pinctrl-0 = <&pmx_camera>;
> +		pinctrl-names = "default";

This example seems to be meaningless.  What SoC pinctrl settings are there
on this device?  What has a HDMI encoder got to do with a camera?

-- 
FTTC broadband for 0.8mile line: 5.8Mbps down 500kbps up.  Estimation
in database were 13.1 to 19Mbit for a good line, about 7.5+ for a bad.
Estimate before purchase was "up to 13.2Mbit".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
