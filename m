From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 0/5] Allwinner H6 Ethernet support
Date: Thu, 1 Nov 2018 13:08:04 +0530
Message-ID: <CAMty3ZCcxGm0+5LcDXd+6zXVM03bCbdT7p+MXQ6LTp1MJYu48w@mail.gmail.com>
References: <20180722053955.25266-1-icenowy@aosc.io>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB2G25LPAKGQEP3C3EYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180722053955.25266-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 22, 2018 at 11:10 AM Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>
> This patchset introduces Allwinner H6 Ethernet support with code already
> available for A64.
>
> As the system controller and EMAC on H6 are all similar to A64 ones,
> support for them are directly reused, by using fallback compatible
> strings.
>
> Icenowy Zheng (5):
>   dt-binding: dwmac-sun8i: add H6 compatible string (w/ A64 fallback)
>   dt-bindings: sunxi-sram: add binding for Allwinner H6 SRAM C
>   arm64: allwinner: h6: add system controller device tree node
>   arm64: allwinner: h6: add EMAC device nodes
>   arm64: allwinner: h6: add support for the Ethernet on Pine H64

Tested EMAC on Orangepi 1+

Tested-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
