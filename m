From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: allwinner,sun4i-a10-lradc-keys
 binding: typo fix
Date: Thu, 10 Dec 2015 21:45:24 -0600
Message-ID: <20151211034524.GA6166@rob-hp-laptop>
References: <1449779521-754-1-git-send-email-merker@debian.org>
 <1449779521-754-4-git-send-email-merker@debian.org>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDJIP47K7MERBWUNVGZQKGQEBXOLN6A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449779521-754-4-git-send-email-merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 09:32:01PM +0100, Karsten Merker wrote:
> Trivial typo fix ("mut" -> "must") in the sunxi LRADC-keys binding
> documentation.
>=20
> Signed-off-by: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
>  Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt=
 b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> index b9c32f6..4357e49 100644
> --- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> +++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> @@ -12,7 +12,7 @@ Each key is represented as a sub-node of "allwinner,sun=
4i-a10-lradc-keys":
>  Required subnode-properties:
>  	- label: Descriptive name of the key.
>  	- linux,code: Keycode to emit.
> -	- channel: Channel this key is attached to, mut be 0 or 1.
> +	- channel: Channel this key is attached to, must be 0 or 1.
>  	- voltage: Voltage in =C2=B5V at lradc input when this key is pressed.
> =20
>  Example:
> --=20
> 2.1.4
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
