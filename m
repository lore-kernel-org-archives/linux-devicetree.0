From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 03/21] clk: sunxi-ng: Enable DE2_CCU for
 Allwinner 64-bit SoCs
Date: Mon, 14 May 2018 09:43:51 -0700
Message-ID: <CAGb2v64tGLyYTG63VvHiXfhif0wiDCNKoBKbjEs+Jm5-6CNxXw@mail.gmail.com>
References: <20180430114058.5061-1-jagan@amarulasolutions.com>
 <20180430114058.5061-4-jagan@amarulasolutions.com> <CAGb2v66MKooAAroCzYdsXZDY0Oh66Dydpy59xj80QfiY+5mz_A@mail.gmail.com>
 <CAMty3ZAOVg6EZoMi=LRuKEcrnDM_tzYfK1WnBN-_d-pmjNS6Nw@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBX7Z43LQKGQE6JXMFQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZAOVg6EZoMi=LRuKEcrnDM_tzYfK1WnBN-_d-pmjNS6Nw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 14, 2018 at 1:20 AM, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> On Tue, May 1, 2018 at 9:53 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
>> On Mon, Apr 30, 2018 at 7:40 PM, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
>>> Allwinner 64-bit SoC like H5/A64 has DE2 CCU so enable them
>>> as default.
>>>
>>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>>> ---
>>>  drivers/clk/sunxi-ng/Kconfig | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
>>> index 79dfd296c3d1..1fffd3bf6ff3 100644
>>> --- a/drivers/clk/sunxi-ng/Kconfig
>>> +++ b/drivers/clk/sunxi-ng/Kconfig
>>> @@ -58,6 +58,8 @@ config SUN8I_V3S_CCU
>>>
>>>  config SUN8I_DE2_CCU
>>>         bool "Support for the Allwinner SoCs DE2 CCU"
>>> +       default ARM64 && ARCH_SUNXI
>>> +       depends on (DRM_SUN4I && (ARM64 && ARCH_SUNXI)) || COMPILE_TEST
>>
>> There is no reason to depend on DRM_SUN4I. There is no compile dependency.
>
> Since this CCU is for DE2 I've make DRM_SUN4I for that matter, any problem?

Users may very well be just using simplefb, but with all the clock drivers
enabled. That is a valid, if very limited, use case. So again, you should
not limit this driver based on DRM_SUN4I. There is no compile dependency.

>
>>
>> Also, this is needed on SUN8I as well, pretty much anything with DE 2.0.
>> So you shouldn't limit it to ARM64. That pretty much breaks things for
>> people with A83T's or H3's. In fact you should enable it by default for
>> these as well.
>
> True, I've skipped SUN8I since this series for A64.

And yet you are breaking existing users, which is a big no-no.

ChenYu
