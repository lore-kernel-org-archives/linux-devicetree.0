From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 08/17] ARM: dts: sun8i: r40: Add mixer ids
 to TCON TOP
Date: Tue, 10 Jul 2018 23:35:54 +0800
Message-ID: <CAGb2v65YsW+SiP6_sV9Hd6eQE6ZF0+Lm6CWfNdmwpgMEHBTDgQ@mail.gmail.com>
References: <20180706175113.26698-1-jernej.skrabec@siol.net> <20180706175113.26698-9-jernej.skrabec@siol.net>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB4VESPNAKGQE367QAPY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180706175113.26698-9-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 7, 2018 at 1:51 AM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> Mixer has to have a way to read its id, if needed.

You should mention that this is required by the device tree binding sun4i-drm,
in the second paragraph of the first section:

    For all connections between components up to the TCONs in the display
    pipeline, when there are multiple components of the same type at the
    same depth, the local endpoint ID must be the same as the remote
    component's index.

You might also want to update the diagram for TCON TOP in the binding doc.

ChenYu

> Add them in R40 DT.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-r40.dtsi | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> index 2afb079a3776..1dd088d82773 100644
> --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> @@ -576,9 +576,12 @@
>                                 #size-cells = <0>;
>
>                                 tcon_top_mixer0_in: port@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
>                                         reg = <0>;
>
> -                                       tcon_top_mixer0_in_mixer0: endpoint {
> +                                       tcon_top_mixer0_in_mixer0: endpoint@0 {
> +                                               reg = <0>;
>                                                 remote-endpoint = <&mixer0_out_tcon_top>;
>                                         };
>                                 };
> @@ -606,9 +609,12 @@
>                                 };
>
>                                 tcon_top_mixer1_in: port@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
>                                         reg = <2>;
>
> -                                       tcon_top_mixer1_in_mixer1: endpoint {
> +                                       tcon_top_mixer1_in_mixer1: endpoint@1 {
> +                                               reg = <1>;
>                                                 remote-endpoint = <&mixer1_out_tcon_top>;
>                                         };
>                                 };
> --
> 2.18.0
>
