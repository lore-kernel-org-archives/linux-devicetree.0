From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 0/5] ARM64: dts: meson-axg: UART DT updates
Date: Thu, 01 Feb 2018 14:36:58 -0800
Message-ID: <7hinbg8hh1.fsf@baylibre.com>
References: <20180111023401.125658-1-yixun.lan@amlogic.com>
        <7hr2q6c2r4.fsf@baylibre.com>
        <CAOi56cW4ufsegpy7heK1+pCxvZ2gz5Lf3dkUgxkZCgMq5oBzSA@mail.gmail.com>
        <8990554d-e995-e432-8f50-3b247f71b0fd@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8990554d-e995-e432-8f50-3b247f71b0fd-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> (Yixun Lan's
        message of "Wed, 31 Jan 2018 10:25:45 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Yixun,

Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> writes:

> On 01/31/18 08:22, Kevin Hilman wrote:
>> On Tue, Jan 30, 2018 at 4:04 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>>> Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> writes:
>>>
>>>> HI Kevin
>>>>  These are the UART DT updates for the Meson-AXG platform.
>>>>
>>>>  The patch 1 is a general fix.
>>>> Other patches are about adding clock & pinctrl info, then using them.
>>>> Last patch enable UART_A which connect to a BT module on the S400 board.
>>>
>>> Applied to v4.16/dt64,
>> 
>> Oops, I meant v4.17.
>> 
>
> Hi Kevin
>  I should warn you about the patch 3 [1], it actually depend on the gpio
> renaming patch [2]
>
>  I'm still waiting Linus to take patch [2], then update according
> (or you could help amend the patch? it's simply a
> 's/uart_ao_b_gpioz/uart_ao_b_z/g)

I've made that change in the version of the patch that I applied to the
v4.17/dt64 branch.

It's harmless without the pinctrl patch applied anyways.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
