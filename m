From: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: sunxi: Introduce Allwinner H3 support
Date: Wed, 06 May 2015 12:23:49 +0200
Message-ID: <5549EBB5.8040806@gmail.com>
References: <1430904693-1404-1-git-send-email-jenskuske@gmail.com> <1430904693-1404-2-git-send-email-jenskuske@gmail.com> <20150506100446.GA11057@lukather>
Reply-To: jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCC5XIE2SIHBBN6XU6VAKGQE3CIS45Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150506100446.GA11057@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?windows-1252?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/05/15 12:04, Maxime Ripard wrote:
> Hi,
> 
> On Wed, May 06, 2015 at 11:31:28AM +0200, Jens Kuske wrote:
>> The Allwinner H3 is a quad-core Cortex-A7-based SoC. It is very similar
>> to other sun8i family SoCs like the A23.
>>
>> Signed-off-by: Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>>  arch/arm/mach-sunxi/Kconfig                     | 2 +-
>>  arch/arm/mach-sunxi/sunxi.c                     | 3 ++-
>>  3 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
>> index 42941fd..3cb4b94 100644
>> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
>> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
>> @@ -9,4 +9,5 @@ using one of the following compatible strings:
>>    allwinner,sun6i-a31
>>    allwinner,sun7i-a20
>>    allwinner,sun8i-a23
>> +  allwinner,sun8i-h3
>>    allwinner,sun9i-a80
>> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
>> index 81502b9..47ac5b4 100644
>> --- a/arch/arm/mach-sunxi/Kconfig
>> +++ b/arch/arm/mach-sunxi/Kconfig
>> @@ -35,7 +35,7 @@ config MACH_SUN7I
>>  	select SUN5I_HSTIMER
>>  
>>  config MACH_SUN8I
>> -	bool "Allwinner A23 (sun8i) SoCs support"
>> +	bool "Allwinner A23 / H3 (sun8i) SoCs support"
> 
> I'd prefer that we have something similar to sun9i, just mentionning
> the family here, instead of an ever-growing list of SoCs.
> 
> This used to be easy to maintain, with the new naming scheme, we
> already have at least 4 SoCs part of sun8i.

According to Allwinners new naming scheme A20/A31/A31s are also part of
sun8i (sun8iw[1,2]), but I think we can agree to use sun8i for the new
SoCs, starting from A23.

> 
>>  	default ARCH_SUNXI
>>  	select ARM_GIC
>>  	select MFD_SUN6I_PRCM
>> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
>> index 1bc811a..bc63748 100644
>> --- a/arch/arm/mach-sunxi/sunxi.c
>> +++ b/arch/arm/mach-sunxi/sunxi.c
>> @@ -67,10 +67,11 @@ MACHINE_END
>>  
>>  static const char * const sun8i_board_dt_compat[] = {
>>  	"allwinner,sun8i-a23",
>> +	"allwinner,sun8i-h3",
>>  	NULL,
>>  };
>>  
>> -DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i (A23) Family")
>> +DT_MACHINE_START(SUN8I_DT, "Allwinner sun8i (A23/H3) Family")
> 
> Same comment here.
> 
> Could you also update Documentation/arm/sunxi/README with these infos
> (and ideally, updating it with the new SoCs we've heard about) ?
> 

Will do.

Jens
