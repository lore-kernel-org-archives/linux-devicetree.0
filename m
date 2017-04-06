From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 0/2] pmu0 MMIO region for A64 USB PHY
Date: Thu, 6 Apr 2017 15:56:40 +0530
Message-ID: <dbc88959-57f2-5e6b-0e3d-972dee9e1340@ti.com>
References: <20170405143034.8868-1-icenowy@aosc.io>
Reply-To: kishon-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCOOP4VF5IDRB4FPTDDQKGQEPWYTS3Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170405143034.8868-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 05 April 2017 08:00 PM, Icenowy Zheng wrote:
> The USB PHY of A64 contains a "pmu0" MMIO region, which contains some control
> registers for the EHCI0/OHCI0 pair on A64 SoC.
> 
> This pair is not used currently in 4.11, but when enabling it in 4.12, the
> MMIO region is needed.
> 
> In order to prevent device tree compatibility breakage, add this region in
> 4.11.

I feel the binding documentation can go along with the dt changes. Moreover I
have no plans of sending another pull request for this -rc cycle.

FWIW:
Acked-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>

Thanks
Kishon
> 
> Icenowy Zheng (2):
>   dt: bindings: add pmu0 regs for USB PHYs on Allwinner H3/V3s/A64
>   arm64: allwinner: a64: add pmu0 regs for USB PHY
> 
>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi           | 2 ++
>  2 files changed, 3 insertions(+)
> 
