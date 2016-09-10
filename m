From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: add rockchip PX3 board
Date: Sat, 10 Sep 2016 11:45:04 +0200
Message-ID: <2773686.QIaAl8MGzE@phil>
References: <1473498094-16279-1-git-send-email-andy.yan@rock-chips.com> <9389291.9daRDJEYck@phil> <c5a7f275-a8df-58c3-b255-ce9df13c67b4@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c5a7f275-a8df-58c3-b255-ce9df13c67b4-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Samstag, 10. September 2016, 17:37:41 CEST schrieb Andy Yan:
> Hi Heiko:
> 
> On 2016年09月10日 17:15, Heiko Stuebner wrote:
> > Hi Andy,
> > 
> > Am Samstag, 10. September 2016, 17:01:34 CEST schrieb Andy Yan:
> >> PX3 board is designed by Rockchip for automotive field,
> >> which intergrated with CVBS(TP2825)/MIPI DSI/LVDS/HDMI
> >> video input/output interface, WIFI/BT/GPS(on a module
> >> named S500 which based on MT6620), Gsensor BMA250E and
> >> light&proximity sensor STK3410.
> >> 
> >> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> >> ---
> >> 
> >>   Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
> >>   arch/arm/boot/dts/Makefile                         |   1 +
> >>   arch/arm/boot/dts/rk3188-px3.dts                   | 337
> >> 
> >> +++++++++++++++++++++ 3 files changed, 342 insertions(+)
> >> 
> >>   create mode 100644 arch/arm/boot/dts/rk3188-px3.dts
> >> 
> >> diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt
> >> b/Documentation/devicetree/bindings/arm/rockchip.txt index
> >> 6668645..e680105
> >> 100644
> >> --- a/Documentation/devicetree/bindings/arm/rockchip.txt
> >> +++ b/Documentation/devicetree/bindings/arm/rockchip.txt
> >> @@ -21,6 +21,10 @@ Rockchip platforms device tree bindings
> >> 
> >>       Required root node properties:
> >>         - compatible = "radxa,rock", "rockchip,rk3188";
> >> 
> >> +- Rockchip PX3 board:
> >> +    Required root node properties:
> >> +      - compatible = "rockchip,px3", "rockchip,rk3188";
> > 
> > Just like to confirm the naming.
> > 
> > I read the announcement of both the PX3 and PX5 socs, are the boards
> > really
> > also named only px3 + px5 - same as the socs they carry, or are they more
> > likely to be called px3-evb or similar?
> > 
> > The dts themself look fine on first glance.
> 
>      We call them px3 or px5 development board in the internal development.
>      Of course I can change them to px3/px5-evb if you desire.

I think I would prefer that ... to not confuse socs with boards :-)
All the other Rockchip devboards are always called evb, so I guess it would be 
the same for the px3+px5 ones.

so I guess the compatible would be
      - compatible = "rockchip,px3-evb", "rockchip,px3", "rockchip,rk3188";


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
