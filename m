From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH v6 3/4] media: coda: use genalloc API
Date: Mon, 19 Nov 2012 10:21:05 -0500
Message-ID: <50AA4E61.4070800@windriver.com>
References: <1353061817-3207-1-git-send-email-p.zabel@pengutronix.de>
 <1353061817-3207-4-git-send-email-p.zabel@pengutronix.de>
 <50A656E2.707@windriver.com>
 <1353079273.2413.160.camel@pizza.hi.pengutronix.de>
 <50A66307.3080706@windriver.com>
 <1353084667.2413.414.camel@pizza.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353084667.2413.414.camel-/rZezPiN1rtR6QfukMTsflXZhhPuCNm+@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Matt Porter <mporter-l0cyMroinI0@public.gmane.org>, Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Javier Martin <javier.martin-N4RbWZIug12MkV8/HQOAswC/G2K4zDHf@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12-11-16 11:51 AM, Philipp Zabel wrote:
> Am Freitag, den 16.11.2012, 11:00 -0500 schrieb Paul Gortmaker:
>> On 12-11-16 10:21 AM, Philipp Zabel wrote:
>>> Am Freitag, den 16.11.2012, 10:08 -0500 schrieb Paul Gortmaker:
>>>> On 12-11-16 05:30 AM, Philipp Zabel wrote:
>>>>> This patch depends on "genalloc: add a global pool list,
>>>>> allow to find pools by phys address", which provides the
>>>>> of_get_named_gen_pool function.
>>>>>
>>>>> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>>>> ---
>>>>>  drivers/media/platform/Kconfig |    3 +--
>>>>>  drivers/media/platform/coda.c  |   47 ++++++++++++++++++++++++++++------------
>>>>>  2 files changed, 34 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>>>>> index 181c768..09d45c6 100644
>>>>> --- a/drivers/media/platform/Kconfig
>>>>> +++ b/drivers/media/platform/Kconfig
>>>>> @@ -130,10 +130,9 @@ if V4L_MEM2MEM_DRIVERS
>>>>>  
>>>>>  config VIDEO_CODA
>>>>>  	tristate "Chips&Media Coda multi-standard codec IP"
>>>>> -	depends on VIDEO_DEV && VIDEO_V4L2 && ARCH_MXC
>>>>> +	depends on VIDEO_DEV && VIDEO_V4L2
>>>>
>>>> What was the logic for reducing the dependency scope here?
>>>> Your commit log doesn't mention that at all, and when I see
>>>> things like that, I predict allyesconfig build failures,
>>>> unless there is a similar dependency elsewhere that isn't
>>>> visible in just the context of this patch alone.
>>>>
>>>> P.
>>>
>>> iram_alloc and iram_free are i.MX specific wrappers around
>>> gen_pool_alloc and gen_pool_free, located in <mach/iram.h>.
>>> Those were responsible for the dependency in the first place.
>>
>> So when I do an allyesconfig for sparc, or parisc or alpha,
>> and VIDEO_CODA gets selected, it will build just fine then?
> 
> I don't know, as I don't have compilers for those available right now.
> I'd like to know if it doesn't, though. It builds fine on x86 and mips,
> for example.

Probably worthwhile to watch the linux-next builds once you
know your commit(s) will be present there, since it has a
wide arch coverage.

> 
>> My point was that when you remove the ARCH_MXC dep, this
>> probably gets opened up as a viable option to a _lot_ more
>> platforms than you might want it exposed to.
> 
> I don't see the problem. Isn't this a good thing?

Well, it can be, if it was intentional, and if the hardware
is genuinely architecture agnostic.  On the other hand, I
don't think it makes sense to be building arm specific drivers
on sparc (or similar) just because we can.  It just adds to
the overall build coverage overhead for minimal gain.

Paul.
--

> 
> regards
> Philipp
> 
