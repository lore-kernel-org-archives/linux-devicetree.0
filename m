From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Pine64+ specific hacks for RTL8211E
 Ethernet PHY
Date: Tue, 1 Oct 2019 09:47:08 -0700
Message-ID: <3ef60a0c-5cfd-420b-6cad-2c16eb2a6c01@gmail.com>
References: <20191001082912.12905-1-icenowy@aosc.io>
Reply-To: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCH67JWTV4DBBE4GZ3WAKGQEDFQNPMA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20191001082912.12905-1-icenowy-h8G6r0blFSE@public.gmane.org>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/1/19 1:29 AM, Icenowy Zheng wrote:
> There're some Pine64+ boards known to have broken RTL8211E chips, and
> a hack is given by Pine64+, which is said to be from Realtek.
> 
> This patchset adds the hack.
> 
> The hack is taken from U-Boot, and it contains magic numbers without
> any document.

Such hacks are the very reason why PHY fixups exists, please investigate
working with Realtek first to understand how to make this hack less of a
hack so it is understood what it does and you can either add proper
infrastructure to the realtek PHY driver to perform that hack, or if
that is not an option, register a board specific fixup.

> 
> Icenowy Zheng (3):
>   dt-bindings: add binding for RTL8211E Ethernet PHY
>   net: phy: realtek: add config hack for broken RTL8211E on Pine64+
>     boards
>   arm64: allwinner: a64: dts: apply hack for RTL8211E on Pine64+
> 
>  .../bindings/net/realtek,rtl8211e.yaml        | 23 +++++++++++++++++++
>  .../dts/allwinner/sun50i-a64-pine64-plus.dts  |  1 +
>  drivers/net/phy/realtek.c                     | 14 +++++++++++
>  3 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl8211e.yaml
> 


-- 
Florian
