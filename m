From: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 13/13] ARM: sunxi: Introduce
 MACH_SUN8I_A83T option
Date: Thu, 3 Mar 2016 00:04:22 +0800
Message-ID: <CAEzqOZt2khVambkoCcBNwvQU2pQiWzbEs5cKZJBaAqD0p3T++g@mail.gmail.com>
References: <1456672738-4993-1-git-send-email-vishnupatekar0510@gmail.com>
 <1456672738-4993-14-git-send-email-vishnupatekar0510@gmail.com> <20160301071253.GI8418@lukather>
Reply-To: vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBD64TFVR3YIBBGU63S3AKGQEM5CHOLI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20160301071253.GI8418@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rein
List-Id: devicetree@vger.kernel.org

Hello Maxime,

On Tue, Mar 1, 2016 at 3:12 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Sun, Feb 28, 2016 at 11:18:58PM +0800, Vishnu Patekar wrote:
>> A83T has CPUS clock similar to A80's. currently, a80 cpus clock only
>> compiled for A80. So, Introduce MACH_SUN8I_A83T to compile it for
>> A83T as well.
>>
>> Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  arch/arm/mach-sunxi/Kconfig | 5 +++++
>>  drivers/clk/sunxi/Makefile  | 3 +++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
>> index c124d65..424b76d 100644
>> --- a/arch/arm/mach-sunxi/Kconfig
>> +++ b/arch/arm/mach-sunxi/Kconfig
>> @@ -41,6 +41,11 @@ config MACH_SUN8I
>>       select ARM_GIC
>>       select MFD_SUN6I_PRCM
>>
>> +config MACH_SUN8I_A83T
>> +     bool "Allwinner A83T (sun8i) SoCs support"
>> +     default ARCH_SUNXI
>> +     select ARM_GIC
>> +
>>  config MACH_SUN9I
>>       bool "Allwinner (sun9i) SoCs support"
>>       default ARCH_SUNXI
>> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
>> index 3fd7901..2aabfc4 100644
>> --- a/drivers/clk/sunxi/Makefile
>> +++ b/drivers/clk/sunxi/Makefile
>> @@ -20,6 +20,9 @@ obj-y += clk-usb.o
>>  obj-$(CONFIG_MACH_SUN9I) += clk-sun8i-apb0.o
>>  obj-$(CONFIG_MACH_SUN9I) += clk-sun9i-cpus.o
>>
>> +obj-$(CONFIG_MACH_SUN8I_A83T) += clk-sun8i-apb0.o
>> +obj-$(CONFIG_MACH_SUN8I_A83T) += clk-sun9i-cpus.o
>> +
>
> This is not how it should be done. You should rather create a Kconfig
> option for these clocks, and use def_bool CONFIG_MACH_SUN8I || CONFIG_MACH_SUN9I
>
> Switching to Kconfig for the clocks has been on my todo-list for quite
> some time, I guess these two clocks would be a good start.
Okie, I'll create Kconfig in clk/sunxi as below:
config CLK_SUN8I_APB0
def_bool MACH_SUN9I || MACH_SUN8I_A83T

config CLK_SUN9I_CPUS
def_bool MACH_SUN9I || MACH_SUN8I_A83T

We still need to have MACH_SUN8I_A83T to differentiate between
MFD_SUN6I_PRCM which is used by other sun8i platforms.

>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
