From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] hmc5843 - add basic dt support
Date: Sat, 23 Nov 2013 12:00:40 +0000
Message-ID: <529098E8.5080109@kernel.org>
References: <20131101163523.10fed501@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131101163523.10fed501-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Shubhrajyoti Datta <shubhrajyoti-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/01/13 05:35, NeilBrown wrote:
> 
> 
> No configuration, just a compatible string and documentation.
> 
> Signed-off-by: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Looks fine to me and it's been a 3 weeks without any negative feedback so
applied to the togreg branch of iio.git.

Looking briefly at the datasheet it seems likely that this binding might
gain a pair of regulators at some point, but we can do that when anyone
cares.

Thanks,

Jonathan
> 
> diff --git a/Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt
> b/Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt new file mode 100644 index
> 000000000000..90d5f34db04e --- /dev/null +++ b/Documentation/devicetree/bindings/iio/magnetometer/hmc5843.txt @@
> -0,0 +1,17 @@ +* Honeywell HMC5843 magnetometer sensor + +Required properties: + +  - compatible : should be
> "honeywell,hmc5843" +  - reg : the I2C address of the magnetometer - typically 0x1e + +Optional properties: + +  -
> gpios : should be device tree identifier of the magnetometer DRDY pin + +Example: + +hmc5843@1e { +
> compatible = "honeywell,hmc5843" +        reg = <0x1e>; +}; diff --git a/drivers/staging/iio/magnetometer/hmc5843.c
> b/drivers/staging/iio/magnetometer/hmc5843.c index c3f3f539e787..829734a82f69 100644 ---
> a/drivers/staging/iio/magnetometer/hmc5843.c +++ b/drivers/staging/iio/magnetometer/hmc5843.c @@ -719,10 +719,17 @@
> static const struct i2c_device_id hmc5843_id[] = { }; MODULE_DEVICE_TABLE(i2c, hmc5843_id);
> 
> +static const struct of_device_id hmc5843_of_match[] = { +	{ .compatible = "honeywell,hmc5843" }, +	{} +}; 
> +MODULE_DEVICE_TABLE(of, hmc5843_of_match); + static struct i2c_driver hmc5843_driver = { .driver = { .name	=
> "hmc5843", .pm	= HMC5843_PM_OPS, +		.of_match_table = of_match_ptr(hmc5843_of_match), }, .id_table	= hmc5843_id, 
> .probe		= hmc5843_probe,
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJSkJjnAAoJEFSFNJnE9BaIBIgP/10EKlKid2t3dLwv3fEEZvUr
mM6e/CfaTM41U9iHY6/MZ06EHw+3AIlUEj7VrwtVaYBuOxA7QGdjlRS7LM5MGHfd
+W1LCk4x/vtdE2nr0VpeaNzV9vkok/HayDj/GiBhRjTLC0GXTUPv+mrvPL+XsCOL
RlGKOUiQmrhNbHje4hSyrtcrRtiQ25VgEef6XMo7QhL2plcEBLH5WA6sP7+aQZ0S
+OLNRZ+0s/nlh23nnlvqRSSl24r+N5HbSkicmUXN6G4IT0LB/MIA/t6irA6eGAws
6DEm/Syz62YV/j3N5vZLHtofXeDiYLM6hWHXwvk+Q8XJc7euZ1Mz7r5EA1ZGYNHJ
5GTBRma1uo1+CfrvZgJWagI70fPiKV6FMRME+mpmyX1NkYKe2VlL9CCtAkx53qfa
joZ5FDc2IU1IL2O9YNtBu2dgxOeQOTBr3K5cpn4gY2oFxDetOQJRvArbcN/j/PHv
wQesd2HNrqGpwVRI3HN70XPl8dRTU+Jl2tFVv6hON+1f1nD7qFGo/LCyWBCppQy+
5tDwNaLPFdjGNY5OQHx41WRfL0ckVyqmCd5y2za7FI7DDjUi+zJ4/e2lCqyFqr4t
dN5mjRM7ZPopL+zb/GYAClea0XrzKkh4REaRfrH14/tU2ba5DlSSqgdHDjc8jiU3
HWL7Qy9UI6jzBt45yAsv
=ZOuh
-----END PGP SIGNATURE-----
