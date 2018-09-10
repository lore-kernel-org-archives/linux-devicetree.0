From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 0/5] Fix A64 HDMI PHY device tree binding
Date: Mon, 10 Sep 2018 13:03:32 +0800
Message-ID: <CAGb2v65G-rVK67C2EfKB+xcKY2OP_K-eXXpyC_BtskXyANe2UA@mail.gmail.com>
References: <20180907072234.48282-1-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBN7W27OAKGQE6LV43JY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180907072234.48282-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 7, 2018 at 3:22 PM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
> When adding support for A64 HDMI PHY in 4.19, we assumed that the two
> PLL-VIDEOs can both feed the HDMI PHY clock. However experiments show
> that the mux bit discovered in R40 blob is not applicable on A64. This
> is not discovered, as normally with a single display pipeline only
> PLL-VIDEO0 will be used.
>
> In this patchset the second PLL is dropped, and a binding specially for
> R40 HDMI PHY is added (which seems to have the mux).
>
> PATCH 1 and 2 are dropping second PLL for A64 HDMI PHY, and PATCH 3 to 5
> are adding R40 HDMI PHY binding.
>
> This patchset targets v4.19 fixes tree, because the binding is
> introduced in v4.19, and if we don't fix it there a wrong binding will
> be left in a stable version released.

Please add fixes tags.

The patches look good, though I'm not sure about patches 3 and 4 going in fixes.

ChenYu


> Icenowy Zheng (5):
>   dt-bindings: sun4i-drm: drop second PLL from A64 HDMI PHY binding
>   drm: sun4i: drop second PLL from A64 HDMI PHY
>   dt-bindings: sun4i-drm: add compatible for R40 HDMI PHY
>   drm/sun4i: add support for R40 HDMI PHY
>   ARM: sun8i: dts: drop A64 HDMI PHY fallback compatible from R40 DT
>
>  .../devicetree/bindings/display/sunxi/sun4i-drm.txt |  5 +++--
>  arch/arm/boot/dts/sun8i-r40.dtsi                    |  3 +--
>  drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c              | 13 ++++++++++++-
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
