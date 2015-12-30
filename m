From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: Add DT support for Juno r2 board
Date: Wed, 30 Dec 2015 11:22:34 +0000
Message-ID: <5683BE7A.9020404@arm.com>
References: <1450872611-15326-1-git-send-email-sudeep.holla@arm.com>
 <20151229183521.GL12450@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151229183521.GL12450@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-hC8oa7XEHlfYtjvyW6yDsg@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review.

On 29/12/15 18:35, Rob Herring wrote:
> On Wed, Dec 23, 2015 at 12:10:11PM +0000, Sudeep Holla wrote:
>> Juno r2 is identical to Juno r1 with Cortex A57 cores replaced by
>> Cortex A72 cores.
>
> That's a bigger change than I'd expect...
>

I am not sure if I understood what you meant by that. Do you want me to
elaborate with more details ?

>> Acked-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/arm/arm-boards |   1 +
>>   Documentation/devicetree/bindings/arm/cpus.txt   |   1 +
>
> This should probably be a separate patch, but I already have a patch in
> my tree for 4.5 adding arm,cortex-a72. So just drop this hunk.
>

OK, will post DT binding separately.

>>   arch/arm64/boot/dts/arm/Makefile                 |   2 +-
>>   arch/arm64/boot/dts/arm/juno-r2.dts              | 200 +++++++++++++++++++++++
>>   4 files changed, 203 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/boot/dts/arm/juno-r2.dts
>
> [...]
>
>> +	pmu_a72 {
>> +		compatible = "arm,cortex-a72-pmu";
>
> This needs to be documented.
>

Yes, Will is already carrying a patch in his tree to add this [1]

>> +	pcie-controller@40000000 {
>> +		compatible = "arm,juno-r1-pcie", "plda,xpressrich3-axi", "pci-host-ecam-generic";
>
> Is this common with r1?
>

AFAIK it is. Liviu can you confirm ?

Regards,
Sudeep

[1] 
https://git.kernel.org/cgit/linux/kernel/git/arm64/linux.git/commit/?h=for-next/perf&id=5d7ee87708d4d86fcc32afc9552d05f7625d303d
-- 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
