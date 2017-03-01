From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: Add binding for /chosen/secure-stdout-path
Date: Wed, 1 Mar 2017 08:50:23 -0600
Message-ID: <CAL_JsqKrUCCvGD_LKvOx+s8zh30GC_v=HAyqozgRm=7mcfSZzw@mail.gmail.com>
References: <06154a2280a8423af80405825d7201c7aa927696.1488374335.git.jerome.forissier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <06154a2280a8423af80405825d7201c7aa927696.1488374335.git.jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Forissier <jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 1, 2017 at 7:29 AM, Jerome Forissier
<jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Some platforms may use a single device tree to describe two address
> spaces, as described in d9f43babb998 ("Documentation: dt: Add bindings
> for Secure-only devices"). We extend the use of the secure- prefix to
> the stdout-path property, so that the Secure firmware may use a
> different console device than the one used by the kernel.
>
> Signed-off-by: Jerome Forissier <jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/secure.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/secure.txt b/Documentation/devicetree/bindings/arm/secure.txt
> index e31303f..558c9a1 100644
> --- a/Documentation/devicetree/bindings/arm/secure.txt
> +++ b/Documentation/devicetree/bindings/arm/secure.txt
> @@ -51,3 +51,8 @@ Valid Secure world properties:
>     status = "disabled"; secure-status = "okay";     /* S-only */
>     status = "disabled";                             /* disabled in both */
>     status = "disabled"; secure-status = "disabled"; /* disabled in both */
> +
> +- secure-stdout-path (/chosen node): specifies the device to be used
> +for console output by Secure firmware. The syntax is the same as for
> +"stdout-path". If "secure-stdout-path" is not specified it defaults to
> +the same value as "stdout-path".

I'm not all that enthusiastic about this. This alone is okay, but
continued additions of secure-* properties doesn't seem very scalable.
Is this it or do you have other needs? What happens when we have 3
modes/address spaces?

Maybe we should allow stdout-path to have multiple strings and secure
fw grabs the first one and updates the DT removing it (perhaps only if
the device is secure only). Might be nice to have multiple ones
supported anyway (like we can do on the kernel command line:
"console=ttyS0 console=ttyS1").

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
