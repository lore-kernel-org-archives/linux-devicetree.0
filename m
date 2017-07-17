From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 5/6] ARM: dts: rockchip: enable RGA for rk3288 devices
Date: Mon, 17 Jul 2017 05:28:20 +0300
Message-ID: <3257165.sao50mFgxX@avalon>
References: <1500101920-24039-1-git-send-email-jacob-chen@iotwrt.com> <2238838.k7NpPUxaC0@avalon> <CAFLEztRwuzkAn_QrgRNv_yrNixuicfr99PEpR2SDyRROqe=b7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFLEztRwuzkAn_QrgRNv_yrNixuicfr99PEpR2SDyRROqe=b7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacob Chen <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jacob,

On Sunday 16 Jul 2017 12:23:02 Jacob Chen wrote:
> 2017-07-15 17:16 GMT+08:00 Laurent Pinchart:
> > On Saturday 15 Jul 2017 14:58:39 Jacob Chen wrote:
> >> Signed-off-by: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
> >> ---
> >> 
> >>  arch/arm/boot/dts/rk3288-evb.dtsi                 | 4 ++++
> >>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 4 ++++
> >>  arch/arm/boot/dts/rk3288-firefly.dtsi             | 4 ++++
> >>  arch/arm/boot/dts/rk3288-miqi.dts                 | 4 ++++
> >>  arch/arm/boot/dts/rk3288-popmetal.dts             | 4 ++++
> >>  arch/arm/boot/dts/rk3288-tinker.dts               | 4 ++++
> > 
> > Some boards are missing from this list (Fennec, Phycore, ...) What
> > criteria have you used to decide on which ones to enable the RGA ? That
> > should be explained in the commit message.
> 
> Ok.
> 
> I just enable the boards i have tested, because i can't make sure it
> won't break the other board because of clocks or power-domains.

Given the clocks and power domains shouldn't be board-specific, would it make 
sense to try and get the change tested on the remaining boards ? You could 
then enable the device in the SoC .dtsi file, which would be much simpler.

> >>  6 files changed, 24 insertions(+)

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
