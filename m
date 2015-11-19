From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: add document for rockchip reboot notifier driver
Date: Thu, 19 Nov 2015 05:35:48 +0100
Message-ID: <2082288.pD4oKxtaXL@phil>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com> <20151118225904.GA5429@rob-hp-laptop> <564D2331.8070503@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564D2331.8070503-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Donnerstag, 19. November 2015, 09:17:37 schrieb Andy Yan:
> Hi Rob:
>=20
> On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrote:
> > On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:
> >> Add devicetree binding document for rockchip reboot nofifier drive=
r
> > Just reading the subject this is way too specific to the Linux driv=
er
> > needs rather than a h/w description. Please don't create fake DT no=
des
> > just to bind to drivers. Whatever &pmu is is probably what should h=
ave
> > the DT node. Let the driver for it create child devices if you need
> > that.
>=20
>      This is note a fake DT nodes, we really need it to tell the driv=
er
>       which register to use to store the reboot mode. Because rockchi=
p
>       use different register file to store the reboot mode on differe=
nt
>       platform, on rk3066,rk3188, rk3288,it use  one of the PMU=20
> register, on
>       the incoming RK3036, it use one of the GRF register, and it use=
=20
> one  of
>       the PMUGRF register for arm64 platform rk3368. On the other han=
d, the
>       PMU/GRF/PMUGRF register file are mapped as "syscon", then refer=
enced
>       by other DT nodes by phandle. So maybe let it as a separate DT=20
> node here
>       is better.

or alternatively we could do something similar to what the bl-switcher=20
cupfreq-driver does. Take a look at

drivers/cpufreq/arm_big_little.c
drivers/clk/clk-mb86s7x.c

We already have the core restart-handler code in the clock-tree, so cou=
ld=20
maybe simply do the
	platform_device_register_simple("rockchip-reboot", -1, NULL, 0);
in that common code?

Though I'm not yet sure how to get the platform-data. I guess one optio=
n would=20
be to do things like the 3288 suspend code does (arch/arm/mach-rockchip=
/pm.c=20
at the bottom), by having the per-soc-data in the driver and then match=
ing=20
against the pmu. Because the pmu is not part of the clock controller bi=
nding=20
(and probably also shouldn't be).


Heiko


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
