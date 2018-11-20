From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 04/14] dt-bindings:
 interrupt-controller: Add suniv interrupt-controller
Date: Tue, 20 Nov 2018 09:44:00 +0100
Message-ID: <20181120084400.sn64fdxbpztaw26h@flea>
References: <cover.1542546735.git.mesihkilinc@gmail.com>
 <e51824832fac0b981cf886f25efc25056d573da4.1542546735.git.mesihkilinc@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="agvmzaobxgm2oakk"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBW4SZ7PQKGQEDYJTQFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <e51824832fac0b981cf886f25efc25056d573da4.1542546735.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--agvmzaobxgm2oakk
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

Hi,

On Sun, Nov 18, 2018 at 05:17:03PM +0300, Mesih Kilinc wrote:
> Add compatible string for Alwinner suniv F1C100s SoC interrupt
> controller which is stripped version of sun4i
> 
> Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/interrupt-controller/allwinner,sun4i-ic.txt  | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-ic.txt
> index b290ca1..e04ddb4 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-ic.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun4i-ic.txt
> @@ -2,7 +2,10 @@ Allwinner Sunxi Interrupt Controller
>  
>  Required properties:
>  
> -- compatible : should be "allwinner,sun4i-a10-ic"
> +- compatible: should be "allwinner,<soc-familiy>-<soc-name>-ic" to identify

There's no need to define the pattern, just list the compatibles
supported. Otherwise, you give the idea that all the combinations are
supported, and they aren't.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--agvmzaobxgm2oakk--
