From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv4 4/7] mfd: twl-core: Add twl_i2c_read/write_u16
Date: Sat, 01 Mar 2014 11:48:11 +0000
Message-ID: <5311C8FB.4000301@kernel.org>
References: <1393374270-20079-1-git-send-email-sre@debian.org> <1393444990-28140-1-git-send-email-sre@debian.org> <1393444990-28140-5-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393444990-28140-5-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/02/14 20:03, Sebastian Reichel wrote:
> Add a simple twl_i2c_read/write_u16 wrapper over
> the twl_i2c_read/write, which is similar to the
> twl_i2c_read/write_u8 wrapper.
>
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

(I'll start a separate conversation about who will take this series in a mo).

> ---
>   include/linux/i2c/twl.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/i2c/twl.h b/include/linux/i2c/twl.h
> index ade1c06..d2b1670 100644
> --- a/include/linux/i2c/twl.h
> +++ b/include/linux/i2c/twl.h
> @@ -195,6 +195,18 @@ static inline int twl_i2c_read_u8(u8 mod_no, u8 *val, u8 reg) {
>   	return twl_i2c_read(mod_no, val, reg, 1);
>   }
>
>
Hmm. This had me confused for a few mins given word rights in i2c are guaranteed
to be little endian unless the swapped versions are used.  I see that the twl
driver is using a generic i2c bulk write.  Ah well, I can see that simplifies
the regmap i2c code and works in most cases...
+static inline int twl_i2c_write_u16(u8 mod_no, u16 val, u8 reg) {
> +	val = cpu_to_le16(val);
> +	return twl_i2c_write(mod_no, (u8*) &val, reg, 2);
> +}
> +
> +static inline int twl_i2c_read_u16(u8 mod_no, u16 *val, u8 reg) {
> +	int ret;
> +	ret = twl_i2c_read(mod_no, (u8*) val, reg, 2);
> +	*val = le16_to_cpu(*val);
> +	return ret;
> +}
> +
>   int twl_get_type(void);
>   int twl_get_version(void);
>   int twl_get_hfclk_rate(void);
>
