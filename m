From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V3 4/5] arm: mm: Added support for PJ4B cpu and init
 routines
Date: Mon, 19 Nov 2012 13:18:14 +0100
Message-ID: <50AA2386.7080705@free-electrons.com>
References: <1352931637-3405-1-git-send-email-gregory.clement@free-electrons.com>
 <1352931637-3405-5-git-send-email-gregory.clement@free-electrons.com>
 <CAHkRjk6BYB=OAFyQKwmA2vcpJ1w9MaYx6gRthEEy6F8GL48Kng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAHkRjk6BYB=OAFyQKwmA2vcpJ1w9MaYx6gRthEEy6F8GL48Kng-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ian Molton <ian.molton-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/19/2012 11:51 AM, Catalin Marinas wrote:
> Hi Gregory,
> 
> On 14 November 2012 22:20, Gregory CLEMENT
> <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
>> index 94186b6..3fd629d 100644
>> --- a/arch/arm/mm/Kconfig
>> +++ b/arch/arm/mm/Kconfig
>> @@ -352,6 +352,10 @@ config CPU_PJ4
>>         select ARM_THUMBEE
>>         select CPU_V7
>>
>> +config CPU_PJ4B
>> +       bool
>> +       select CPU_V7
> 
> With ARMv6 we started just using the generic architecture name for
> different processors (i.e. CPU_V6, CPU_V7). Is PJ4B another ARMv7
> implementation (like Cortex-A9)?

Yes it is.

> 
>> diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
>> index 846d279..a4c0ccf 100644
>> --- a/arch/arm/mm/proc-v7.S
>> +++ b/arch/arm/mm/proc-v7.S
>> @@ -169,6 +169,47 @@ __v7_ca15mp_setup:
>>         orreq   r0, r0, r10                     @ Enable CPU-specific SMP bits
>>         mcreq   p15, 0, r0, c1, c0, 1
>>  #endif
>> +
>> +__v7_pj4b_setup:
>> +#ifdef CONFIG_CPU_PJ4B
>> +
>> +#define SNOOP_DATA    (1 << 25) /* Dont interleave write and snoop data */
>> +#define CWF           (1 << 27) /* Disable Critical Word First feature */
>> +#define OUTSANDING_NC (1 << 29) /* Disable outstanding non cacheable request */
>> +#define L1_REP_RR     (1 << 30) /* L1 replacement - Strict round robin */
>> +
>> +#define AUX_DBG_CTRL2 (SNOOP_DATA | CWF | OUTSANDING_NC | L1_REP_RR)
>> +
>> +       /* Auxiliary Debug Modes Control 1 Register */
>> +       mrc     p15, 1, r0, c15, c1, 1
>> +       orr     r0, r0, #(1 << 16)     @ Disable data transfer for clean line.
>> +       orr     r0, r0, #(1 << 5)      @ Enable the back off of STREX instr
>> +       orr     r0, r0, #(1 << 8)      @ Disable Internal Parity Handling
>> +       bic     r0, r0, #(1 << 2)      @ Disable Static BP
>> +       mcr     p15, 1, r0, c15, c1, 1
>> +
>> +       /* Auxiliary Debug Modes Control 2 Register */
>> +       mrc     p15, 1, r0, c15, c1, 2
>> +       bic     r0, r0, #(1 << 23)   @ Enable fast LDR.
>> +       orr     r0, r0, #AUX_DBG_CTRL2
>> +       mcr     p15, 1, r0, c15, c1, 2
>> +
>> +       /* Auxiliary Functional Modes Control Register 0 */
>> +       mrc     p15, 1, r0, c15, c2, 0
>> +#ifdef CONFIG_SMP
>> +       orr     r0, r0, #(1 << 1)     @ Set SMP mode. Join the coherency fabric
>> +#endif
>> +       orr     r0, r0, #(1 << 2)     @ Support L1 parity checking
>> +       orr     r0, r0, #(1 << 8)     @ Broadcast Cache and TLB maintenance
>> +       mcr     p15, 1, r0, c15, c2, 0
>> +
>> +       /* Auxiliary Debug Modes Control 0 Register */
>> +       mrc     p15, 1, r0, c15, c1, 0
>> +       orr     r0, r0, #(1 << 22)   @ WFI/WFE - serve the DVM and back to idle
>> +       mcr     p15, 1, r0, c15, c1, 0
> 
> Any chance that these could be set by the firmware prior to starting
> the kernel? We don't have any guidance for Linux here but longer term
> it seems to cause problems (i.e. you add some secure layer in a new
> CPU version).
> 

I will ask to Marvell engineers.

However I hope it won't be show stopper for merging this code in 3.8.
This patch set was released 7 weeks ago, so would have though there was
a lot of time to raise the issue related to this code.

That's said, if the change to be done are small enough it could be done
as a fix for the 3.8 release candidate.

Thanks,
Gregory
