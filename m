From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 0/9] Allwinner H6 USB support
Date: Mon, 9 Jul 2018 10:52:00 +0800
Message-ID: <CAGb2v6613vcxaA0J5L_bm=ZCU_bkCkeK-icrq_y7Mmd1+MMrHQ@mail.gmail.com>
References: <20180706153805.25842-1-icenowy@aosc.io>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBZ43RPNAKGQEEOUR2YY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180706153805.25842-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 6, 2018 at 11:37 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
> This patchset introduces support for the USB ports (both USB2 and USB3)
> on the Allwinner H6 SoC.
>
> This revision adds the USB2 support, and places it before the USB3
> support. So only the USB3 part will have changelog in this revision.
>
> The first 5 PATCHes are the USB2 part, and the latter 4 PATCHes are the
> USB3 part.
>
> PATCH 1, 2, 6, 7 should go through the PHY tree, and the remaining
> patches should go through the armsoc tree via sunxi tree.
>
> Icenowy Zheng (9):
>   phy: sun4i-usb: add support for missing USB PHY index
>   phy: sun4i-usb: add support for H6 USB2 PHY
>   arm64: allwinner: dts: h6: add USB2-related device nodes
>   arm64: allwinner: dts: h6: add USB Vbus regulator
>   arm64: allwinner: dts: h6: enable USB2 on Pine H64
>   dt-bindings: phy: add binding for Allwinner USB3 PHY
>   phy: allwinner: add phy driver for USB3 PHY on Allwinner H6 SoC
>   arm64: allwinner: dts: h6: add USB3 device nodes
>   arm64: allwinner: dts: h6: enable USB3 port on Pine H64

Apart from my comments in a few patches, this series is

Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
