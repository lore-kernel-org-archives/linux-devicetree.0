From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: add document for rockchip reboot
 notifier driver
Date: Fri, 20 Nov 2015 09:16:35 +0800
Message-ID: <564E7473.9080509@rock-chips.com>
References: <1447840044-19689-1-git-send-email-andy.yan@rock-chips.com>
 <20151118225904.GA5429@rob-hp-laptop> <564D2331.8070503@rock-chips.com>
 <2082288.pD4oKxtaXL@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2082288.pD4oKxtaXL@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, benchan-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko:

On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 12:35, Heiko Stuebner wrote:
> Hi Andy,
>
> Am Donnerstag, 19. November 2015, 09:17:37 schrieb Andy Yan:
>> Hi Rob:
>>
>> On 2015=E5=B9=B411=E6=9C=8819=E6=97=A5 06:59, Rob Herring wrote:
>>> On Wed, Nov 18, 2015 at 05:53:30PM +0800, Andy Yan wrote:
>>>> Add devicetree binding document for rockchip reboot nofifier drive=
r
>>> Just reading the subject this is way too specific to the Linux driv=
er
>>> needs rather than a h/w description. Please don't create fake DT no=
des
>>> just to bind to drivers. Whatever &pmu is is probably what should h=
ave
>>> the DT node. Let the driver for it create child devices if you need
>>> that.
>>       This is note a fake DT nodes, we really need it to tell the dr=
iver
>>        which register to use to store the reboot mode. Because rockc=
hip
>>        use different register file to store the reboot mode on diffe=
rent
>>        platform, on rk3066,rk3188, rk3288,it use  one of the PMU
>> register, on
>>        the incoming RK3036, it use one of the GRF register, and it u=
se
>> one  of
>>        the PMUGRF register for arm64 platform rk3368. On the other h=
and, the
>>        PMU/GRF/PMUGRF register file are mapped as "syscon", then ref=
erenced
>>        by other DT nodes by phandle. So maybe let it as a separate D=
T
>> node here
>>        is better.
> or alternatively we could do something similar to what the bl-switche=
r
> cupfreq-driver does. Take a look at
>
> drivers/cpufreq/arm_big_little.c
> drivers/clk/clk-mb86s7x.c
>
> We already have the core restart-handler code in the clock-tree, so c=
ould
> maybe simply do the
> 	platform_device_register_simple("rockchip-reboot", -1, NULL, 0);
> in that common code?
>
> Though I'm not yet sure how to get the platform-data. I guess one opt=
ion would
> be to do things like the 3288 suspend code does (arch/arm/mach-rockch=
ip/pm.c
> at the bottom), by having the per-soc-data in the driver and then mat=
ching
> against the pmu. Because the pmu is not part of the clock controller =
binding
> (and probably also shouldn't be).
>
>
> Heiko
>
>
>
>
>
    Thanks for your suggestion.
     I have read the code you list above, if we implement the reboot=20
notifier
     driver like this, the driver need to add much more code to find th=
e=20
platform
     data(like arch/arm/mach-rockhcip/pm.c), what's more, if we have a=20
new soc
     in the future and the soc use a different register here, we need=20
modify the
     driver to add a new platform data again, this will bring additiona=
l=20
work.

     Use the DT node pass the register will make the driver code simple=
=20
and clear.
     Is there any hurt to put this information in the DT?

     Andy

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
