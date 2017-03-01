From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: Add binding for /secure-chosen/stdout-path
Date: Wed, 1 Mar 2017 17:43:29 +0000
Message-ID: <CAFEAcA9AX5kSMs-PBQWDeDo=PTLoBHPMKc6ctYvR4LVni3rWAA@mail.gmail.com>
References: <55a2f3cbe477bc876a7547eeb4693218698b87fe.1488387801.git.jerome.forissier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55a2f3cbe477bc876a7547eeb4693218698b87fe.1488387801.git.jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Forissier <jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robin.murphy-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 1 March 2017 at 17:08, Jerome Forissier <jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Some platforms may use a single device tree to describe two address
> spaces, as described in d9f43babb998 ("Documentation: dt: Add bindings
> for Secure-only devices"). For these platforms it makes sense to define
> a secure counterpart of /chosen, namely: /secure-chosen. This new node
> is meant to be used by the secure firmware to pass data to the secure
> OS. Only the stdout-path property is supported for now.
>
> Signed-off-by: Jerome Forissier <jerome.forissier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/secure.txt | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/secure.txt b/Documentation/devicetree/bindings/arm/secure.txt
> index e31303f..e7c596a 100644
> --- a/Documentation/devicetree/bindings/arm/secure.txt
> +++ b/Documentation/devicetree/bindings/arm/secure.txt
> @@ -32,7 +32,8 @@ describe the view of Secure world using the standard bindings. These
>  secure- bindings only need to be used where both the Secure and Normal
>  world views need to be described in a single device tree.
>
> -Valid Secure world properties:
> +Valid Secure world properties
> +-----------------------------
>
>  - secure-status : specifies whether the device is present and usable
>    in the secure world. The combination of this with "status" allows
> @@ -51,3 +52,15 @@ Valid Secure world properties:
>     status = "disabled"; secure-status = "okay";     /* S-only */
>     status = "disabled";                             /* disabled in both */
>     status = "disabled"; secure-status = "disabled"; /* disabled in both */
> +
> +The secure-chosen node
> +----------------------
> +
> +Similar to the /chosen node which serves as a place for passing data
> +between firmware and the operating system, the /secure-chosen node may
> +be used to pass data to the secure OS. Only the properties defined
> +below may appear in the /secure-chosen node. They have the same
> +definition as when used under /chosen, unless explicitely stated

typo: "explicitly".

> +otherwise.
> +
> +- stdout-path

What's the default for the Secure world if (a) the secure-chosen
node doesn't exist at all or (b) it does exist but doesn't
define stdout-path? Presumably it should be "fall back to
using the chosen node's stdout-path", to match the way we
do fallback for other secure world properties, but it would
be good to say so explicitly I think.

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
