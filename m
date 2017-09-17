From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: sun8i: h3/h5: add DE2 CCU device
 node for H3
Date: Sun, 17 Sep 2017 12:34:25 +1000
Message-ID: <CAGRGNgXj6sNHzYv9zsTWSD+FULA0x4-J51ytD=mHLZb_ch-y_g@mail.gmail.com>
References: <20170911155529.62891-1-icenowy@aosc.io> <20170911155529.62891-3-icenowy@aosc.io>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQIP76OUQLBBRV667GQKGQEOKD5R4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170911155529.62891-3-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Icenowy,

On Tue, Sep 12, 2017 at 1:55 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> The DE2 in H3/H5 has a clock control unit in it, and the behavior is
> slightly different between H3 and H5.
>
> Add the common parts in H3/H5 DTSI, and add the compatible string in H3
> DTSI.
>
> The compatible string of H5 DE2 CCU will be added in a separated patch.
>
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi    |  4 ++++
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 14 ++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> index 11240a8313c2..76a4cbc99bdb 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -85,6 +87,18 @@
>                 #size-cells = <1>;
>                 ranges;
>
> +               display_clocks: clock@1000000 {
> +                       /* compatible is in per SoC .dtsi file */

I don't know device tree very well, but shouldn't this node be
disabled so that it doesn't do anything weird on H5? Or are nodes
without compatibles ignored?

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
