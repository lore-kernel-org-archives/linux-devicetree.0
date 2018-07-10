From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v5 05/22] dt-bindings: sram: sunxi: Populate
 valid sections compatibles
Date: Tue, 10 Jul 2018 22:47:07 +0800
Message-ID: <CAGb2v64Na1Mq0=-z5Haq=sgggRPHNHVZ-6fFczxb3EESAzZ=XA@mail.gmail.com>
References: <20180710080114.31469-1-paul.kocialkowski@bootlin.com> <20180710080114.31469-6-paul.kocialkowski@bootlin.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBA4OSPNAKGQEM2JM2BA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180710080114.31469-6-paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Keiichi Watanabe <keiichiw-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Smitha T Murthy <smitha.t-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tom Saeger <tom.saeger-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Geert
List-Id: devicetree@vger.kernel.org

On Tue, Jul 10, 2018 at 4:00 PM, Paul Kocialkowski
<paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> This adds a list of valid SRAM sections compatibles for the A13, A20,
> A23 and H3 platforms. Per-platform compatibles are introduced for the
> SRAM sections of these platforms, with the A10 compatibles also listed
> as valid when applicable.
>
> In particular, compatibles for the C1 SRAM section are introduced.

You should probably mention that this is not an exhaustive list. In
particular, the C2 and C3 (sun5i) mappings are still missing.

>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/sram/sunxi-sram.txt   | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sunxi-sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
> index 156a02ab6b54..07c53c5214a0 100644
> --- a/Documentation/devicetree/bindings/sram/sunxi-sram.txt
> +++ b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
> @@ -32,8 +32,33 @@ once again the representation described in the mmio-sram binding.
>
>  The valid sections compatible for A10 are:
>      - allwinner,sun4i-a10-sram-a3-a4
> +    - allwinner,sun4i-a10-sram-c1
>      - allwinner,sun4i-a10-sram-d
>
> +The valid sections compatible for A13 are:
> +    - allwinner,sun5i-a13-sram-a3-a4
> +    - allwinner,sun4i-a10-sram-a3-a4
> +    - allwinner,sun5i-a13-sram-c1
> +    - allwinner,sun4i-a10-sram-c1
> +    - allwinner,sun5i-a13-sram-d
> +    - allwinner,sun4i-a10-sram-d
> +
> +The valid sections compatible for A20 are:
> +    - allwinner,sun7i-a20-sram-a3-a4
> +    - allwinner,sun4i-a10-sram-a3-a4
> +    - allwinner,sun7i-a20-sram-c1
> +    - allwinner,sun4i-a10-sram-c1
> +    - allwinner,sun7i-a20-sram-d
> +    - allwinner,sun4i-a10-sram-d
> +
> +The valid sections compatible for A23/A33 are:
> +    - allwinner,sun8i-a23-sram-c1
> +    - allwinner,sun4i-a10-sram-c1
> +
> +The valid sections compatible for H3 are:
> +    - allwinner,sun8i-h3-sram-c1
> +    - allwinner,sun4i-a10-sram-c1

I'm not quite sure why we want to list these... I think it makes more sense
to just have the SoC specific compatible. They are tied to the controls
after all. Maybe Rob has a different opinion?

ChenYu

> +
>  The valid sections compatible for A64 are:
>      - allwinner,sun50i-a64-sram-c
>
> --
> 2.17.1
>
