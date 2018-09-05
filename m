From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: Enable DE2_CCU for
 SUN8I and SUN50I
Date: Wed, 5 Sep 2018 13:25:30 +0530
Message-ID: <CAMty3ZDVnsjJ0eRx1LxFjX+ti85=jRy=1x_sZ5d3yCHsVCD3HA@mail.gmail.com>
References: <20180904163609.10171-1-jagan@amarulasolutions.com> <20180905070335.dclhpxjld4vdkdu4@flea>
Reply-To: jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7MFH7A7EEBB44XX3OAKGQEB3QW2UI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180905070335.dclhpxjld4vdkdu4@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 5, 2018 at 12:33 PM, Maxime Ripard
<maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> On Tue, Sep 04, 2018 at 10:06:06PM +0530, Jagan Teki wrote:
>> Allwinner SoC like SUN8I and SUN50I has DE2 CCU so enable them
>> as default.
>>
>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> ---
>> Changes for v4, v3:
>> - none
>> Changes for v2:
>> - Enable for MACH_SUN8I
>>
>>  drivers/clk/sunxi-ng/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
>> index 826674d090fd..e20182aa9748 100644
>> --- a/drivers/clk/sunxi-ng/Kconfig
>> +++ b/drivers/clk/sunxi-ng/Kconfig
>> @@ -63,6 +63,8 @@ config SUN8I_V3S_CCU
>>
>>  config SUN8I_DE2_CCU
>>       bool "Support for the Allwinner SoCs DE2 CCU"
>> +     default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
>> +     depends on DRM_SUN4I && (MACH_SUN8I || (ARM64 && ARCH_SUNXI))
>
> I don't see why there's a dependency on the DRM driver. I'm pretty
> sure this would even break simplefb.

Ok, got it. I will drop the depends on just add default.
