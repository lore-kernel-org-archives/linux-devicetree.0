From: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: reuse firefly dtsi
Date: Wed, 19 Apr 2017 08:42:09 +0800
Message-ID: <CAJrj+DPjNnk9n5k4DoxJ0Focm0DOz6362PYtVRZTEkaUFKYX0g@mail.gmail.com>
References: <20170418121527.3155-1-eddie.cai.linux@gmail.com> <746291609.ssvjv54Vin@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <746291609.ssvjv54Vin@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2017-04-19 6:20 GMT+08:00 Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>:
> Hi Eddie,
>
> Am Dienstag, 18. April 2017, 20:15:27 CEST schrieb Eddie Cai:
>> firefly reload is very similar with firefly board, so reuse firefly dtsi
>>
>> Signed-off-by: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 310 ------------------
>>  arch/arm/boot/dts/rk3288-firefly-reload.dts       | 368 ++--------------------
>
> I would disagree and remember having a similar discussion when the reload-
> support was initially submitted. Please keep in mind that the firefly-
> reload is a som+baseboard combination, so somebody could (or maybe
> already has) create a completely different baseboard for the som that
> does not have any similarities with the original firefly.
> The previous firefly being a real single board.
>
> We also don't combine rock2 and firefly and other boards following the
> general rk3288 design guidelines :-) and the original firefly and reload are
> very different boards if you look at them.
OK, i think the real similar part is the core board and firefly. how
about reuse the
firefly code in the core board?
>
>
> Heiko
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
