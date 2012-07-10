From: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/5] ARM: topology: set the capacity of each cores for
 big.LITTLE
Date: Tue, 10 Jul 2012 14:35:25 +0200
Message-ID: <CAKfTPtC0BcidJ2ga9c2fdWjrEsfXH48QtSnjv0YOCv7-k3K-Ug@mail.gmail.com>
References: <1341826026-6504-1-git-send-email-vincent.guittot@linaro.org>
 <1341919622.3462.124.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341919622.3462.124.camel@twins>
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
To: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, jean.pihet-OTs2U3NB0ngRmelmmXo44Q@public.gmane.org, yong.zhang0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10 July 2012 13:27, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org> wrote:
> On Mon, 2012-07-09 at 11:27 +0200, Vincent Guittot wrote:
>> This patchset creates an arch_scale_freq_power function for ARM, which is used
>> to set the relative capacity of each core of a big.LITTLE system. It also removes
>> the broken power estimation of x86.
>>
>> Modification since v3:
>>  - Add comments
>>  - Add optimization for SMP system
>>  - Ensure that capacity of a CPU will be at most 1
>>
>> Modification since v2:
>>  - set_power_scale function becomes static
>>  - Rework loop in update_siblings_masks
>>  - Remove useless code in parse_dt_topology
>>
>> Modification since v1:
>>  - Add and update explanation about the use of the table and the range of the value
>>  - Remove the use of NR_CPUS and use nr_cpu_ids instead
>>  - Remove broken power estimation of x86
>>
>> Peter Zijlstra (1):
>>   sched, x86: Remove broken power estimation
>
> Note that this patch already made its way into tip as commit
> bcae21d6e793a7047d38abc9ac0946c53733c1dd so it might be best to base
> whatever tree this is supposed to fo into on something that includes
> that.
>

yes

>> Vincent Guittot (4):
>>   ARM: topology: Add arch_scale_freq_power function
>>   ARM: topology: factorize the update of sibling masks
>>   ARM: topology: Update cpu_power according to DT information
>>   sched: cpu_power: enable ARCH_POWER
>
> How would you like to proceed with these patches, I'm fine with them
> going through the ARM tree..

May be the last one which enable ARCH_POWER should also go into tip ?

>
> In which case:
>
> Acked-by: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
>
> Ingo, Russell, any other preferences?

I'm going to push the patches related to ARM into Russell's patch system

Vincent
