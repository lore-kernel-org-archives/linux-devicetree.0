From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/5] add GPT timer support for mt8173
Date: Thu, 13 Aug 2015 12:49:46 +0800
Message-ID: <CAGS+omA7+O+hKqcSjYabLL08T1Va-Ryw=dNB_ZA34++-04dHHg@mail.gmail.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
 <CAGS+omAeYhXDpBueG-F_gYBccqeaejN9k5bRKC78aDLfvHfnBA@mail.gmail.com>
 <55CB3CCB.6020607@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <55CB3CCB.6020607-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 12, 2015 at 8:32 PM, Daniel Lezcano
<daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 08/11/2015 05:54 PM, Daniel Kurtz wrote:
>>
>> On Mon, Jul 13, 2015 at 5:32 PM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> wrote:
>>>
>>> This series add GPT timer support for mt8173. This is based on v4.2-rc1
>>> and Matthias' next branch (for dts parts).
>>>
>>> The first 2 patches comes from 'Add SMP bringup support for mt65xx socs'
>>> series [1]. I decide to move these 2 patches to this series, since it
>>> is more relevent here. They are changed based on Matthias' and Daniel's
>>> comments.
>>>
>>> [1]
>>> http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000714.html
>>>
>>> Daniel Kurtz (1):
>>>    arm64: dts: mt8173: add timer node
>>>
>>> Yingjoe Chen (4):
>>>    clocksource: mediatek: do not enable GPT_CLK_EVT when setup
>>>    clocksource: mediatek: Use GPT as sched clock source
>>>    arm64: mediatek: enable MTK_TIMER
>>>    clk: mediatek: add 13mhz clock for MT8173
>>
>>
>> Was this mediatek clocksource patch set get forgotten again?
>
>
> Yep. Sounds like it felt at the wrong moment.
>
>> All 5 patches have have been reviewed, and I think the ones that need
>> it have been Ack'ed by Matthias and/or Stephen.
>> What is the plan for merging them?
>
>
> So if I am not wrong we have two patches I can take in my tree as a couple
> of fixes (1 and 2), right ?

Yes.
Patches 3 & 5 are for Matthias, and patch 4 is Ack'ed by Stephen Boyd,
so I assume Matthias can pick that one up too.

Matthias, is that correct?
Or does Patch 4 need to go in via a clock maintainer's tree?

-Dan
