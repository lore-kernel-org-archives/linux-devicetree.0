From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 11/14] dt-bindings: clock: Add
 Allwinner suniv F1C100s CCU
Date: Tue, 20 Nov 2018 09:52:29 +0100
Message-ID: <20181120085229.suf3affnix3d7bi2@flea>
References: <cover.1542546735.git.mesihkilinc@gmail.com>
 <5f0322d5e37726f0c597b919f59e121f0b2855c3.1542546735.git.mesihkilinc@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x6dkfyopoy5uzc7a"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBWEWZ7PQKGQEDKJITYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <5f0322d5e37726f0c597b919f59e121f0b2855c3.1542546735.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--x6dkfyopoy5uzc7a
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Sun, Nov 18, 2018 at 05:17:10PM +0300, Mesih Kilinc wrote:
> Add compatiple string for Allwinner suniv F1C100s CCU.
> Add clock and reset definitions.
> 
> Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../devicetree/bindings/clock/sunxi-ccu.txt        |  1 +
>  include/dt-bindings/clock/suniv-ccu-f1c100s.h      | 69 ++++++++++++++++++++++
>  include/dt-bindings/reset/suniv-ccu-f1c100s.h      | 37 ++++++++++++
>  3 files changed, 107 insertions(+)
>  create mode 100644 include/dt-bindings/clock/suniv-ccu-f1c100s.h
>  create mode 100644 include/dt-bindings/reset/suniv-ccu-f1c100s.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> index 47d2e90..92c16eb 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> @@ -3,6 +3,7 @@ Allwinner Clock Control Unit Binding
>  
>  Required properties :
>  - compatible: must contain one of the following compatibles:
> +		- "allwinner,suniv-f1c100s-ccu"

Letters come after the numbers in alphabetical order, so that should
be moved at the end of that list (and you have that issue in a couple
of other patches).

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--x6dkfyopoy5uzc7a--
