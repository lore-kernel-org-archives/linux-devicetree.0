From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add eMMC's power domain support
 for rk3399
Date: Tue, 6 Sep 2016 14:34:53 +0200
Message-ID: <CAPDyKFrAJW9D49wEgQXiuPFrgbVq6HjtQbTwj8FL6c_mx8o-wg@mail.gmail.com>
References: <20160827134103.28160-1-xzy.xu@rock-chips.com> <20160827134103.28160-3-xzy.xu@rock-chips.com>
 <2ab8ab94-fa4d-2cd6-5805-a92ac5f9697e@rock-chips.com> <57C3A30B.5080707@rock-chips.com>
 <ceba6a89-6945-58c5-62e4-7d842cfa2312@rock-chips.com> <CAD=FV=W=LkVAm187hxp0Kbjxi5kSThwKnCMX+tr8SXQ-v_xQTQ@mail.gmail.com>
 <77f5cff1-80a2-76b3-40e9-f77caced2257@rock-chips.com> <12451b81-321e-b661-8f1c-25c91bffba54@rock-chips.com>
 <CAPDyKFqwqdu=9PSzD32aOYAeBVRMQ0s8oKA29JGBsMsRMsDz4w@mail.gmail.com>
 <CAD=FV=VQ7Gf33fH8=FM_Lj-r9uovoEHxusMrFQrDwf2rxeiecg@mail.gmail.com>
 <CAPDyKFra7L5iUJegHH43mF4Dw=wYo0PmH2g_96fNL_=oRnGgug@mail.gmail.com> <10dfff58-88b2-a397-ef2e-9cd451253c40@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <10dfff58-88b2-a397-ef2e-9cd451253c40-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2 September 2016 at 16:23, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Hi Ulf,
>
>
> On 2016=E5=B9=B409=E6=9C=8802=E6=97=A5 18:24, Ulf Hansson wrote:
>>
>> On 1 September 2016 at 23:50, Doug Anderson<dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>  wrot=
e:
>>>
>>> >Hi,
>>> >
>>> >On Thu, Sep 1, 2016 at 6:45 AM, Ulf Hansson<ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> > wrote:
>>>>
>>>> >>I was reading the discussion regarding this change and browsing the =
DT
>>>> >>documentation around this... Can you guys explain what really goes o=
n
>>>> >>here, please.
>>>> >>
>>>> >>To me, it seems like you are managing one device's resources in one
>>>> >>separate genpd. One genpd per device. Is that correct?
>>>> >>
>>>> >>Perhaps each device actually has its own PM domain and thus it makes
>>>> >>sense to assign one genpd per device?
>>>
>>> >
>>> >I'm not as familiar with genpd as I should be, so hopefully this makes
>>> > sense.
>>> >
>>> >...in hardware there is a "pd_emmc" that is the power domain for just
>>> >eMMC.  That will be referenced hooked up via device tree, like:
>>> >
>>> >power-domains =3D <&power RK3399_PD_EMMC>;
>>
>> Yes, I noticed that and this is what puzzles me a bit.
>>
>>> >
>>> >I believe that means that power will automatically be removed whenever
>>> >the device is runtime suspended or suspended.
>>
>> Well, it depends if the genpd has a subdomain or other devices in it
>> being runtime resumed.
>> The genpd will not power off unless all devices within it are runtime
>> enabled+suspended and that its subdomains are also powered off.
>>
>> So, in case you only have one device and no subdomains, then your
>> statement is correct.
>
>
> Yup, pd_emmc is a individual power domain which is only deployed to eMMC =
on
> rk3399. It has no subdomains.
>
>>
>>> >
>>> >If w're not supporting "autosuspend" and nobody is tweaking anything
>>
>> I guess you mean runtime PM autosuspend? Then why don't you support this=
?
>>
>> Wouldn't that allow you to avoid wasting power in runtime when the
>> device is idle?
>
>
> pd_emmc manages the sdhci controller, phy and corecfg_* stuff, if we supp=
ort

Ohh, there are already mmc drivers dealing with phys. We can add this
for you driver as well.

Regarding corecfg_*, unless that also can be managed via a generic
interface (perhaps through syscon), then you need to manage that via
genpd. Is that the case?

> autosuspend in driver, we have to re-init context. I didn't test the

Yes, that's a common scenario, many device drivers do this - as to
avoid wasting power.

> latency, if it's acceptable, we will apply it.:-)

Latency constraints may be controlled via the genpd governor.

Moreover we also have the runtime PM autosuspend feature, which is
useful when you don't wont to runtime suspend the device between each
and every request. Thus avoiding latencies when there are a "burst" of
requests.

> But it's not a blocker, right?
>

Hmm, I just want to make sure we do the right things. Else it might
just bite us in the other end.

Again, my recommendation is to start with runtime PM then continue
with system PM. I can imagine you will get system PM "free" if using
the runtime PM centric approach.

Kind regards
Uffe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
