From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: correct regular setting for act8846
Date: Wed, 24 May 2017 10:55:58 +0200
Message-ID: <3806769.RZqfsnRCGS@phil>
References: <1495611221-6749-1-git-send-email-eddie.cai.linux@gmail.com> <7433998.EkqTVyWeUF@phil> <CAJrj+DMU5XP9vHt60F8Uf7BTfv13DQQUoVXs0Fv2nKbWH8xKYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJrj+DMU5XP9vHt60F8Uf7BTfv13DQQUoVXs0Fv2nKbWH8xKYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 24. Mai 2017, 16:50:51 CEST schrieb Eddie Cai:
> 2017-05-24 16:47 GMT+08:00 Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>:
> > Am Mittwoch, 24. Mai 2017, 16:44:05 CEST schrieb Eddie Cai:
> >> 2017-05-24 16:17 GMT+08:00 Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>:
> >> > Hi Eddie,
> >> >
> >> > Am Mittwoch, 24. Mai 2017, 15:33:41 CEST schrieb Eddie Cai:
> >> >> the previous setting of act8846 is just copy from firefly board. but
> >> >> the reload board is a little different from firefly board. let's correct
> >> >> it.
> >> >>
> >> >> Signed-off-by: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> >> ---
> >> >>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 21 +++++++++++----------
> >> >>  1 file changed, 11 insertions(+), 10 deletions(-)
> >> >>
> >> >> diff --git a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> >> >> index 8134966..4cfa109 100644
> >> >> --- a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> >> >> +++ b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> >> >> @@ -179,6 +179,7 @@
> >> >>                               regulator-name = "vccio_sd";
> >> >>                               regulator-min-microvolt = <3300000>;
> >> >>                               regulator-max-microvolt = <3300000>;
> >> >> +                             regulator-always-on;
> >> >
> >> > the rest below looks pretty straight forward, but why does vccio_sd
> >> > need to be always on?
> >> >
> >> > I've checked the reload's schematics but did not find any further users
> >> > of vccio_sd that may warant this attribute.
> >> Oh, It's default on. thank you for point out my mistake. I will modify
> >> it in next version.
> >
> > not default-on, but the mmc-core will turn on the vccio regulator on its
> > own during probe. So yes, please fix :-) .
> I mean it will be default on by hardware from schematics. I just modify it to
> regulator-boot-on and send v1 patch

nice, that is even better to make that explicit.

No need to resent for that, but your new patch should actually be v2.
The patch without version number always counts as v1, we just normally
don't write that down :-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
