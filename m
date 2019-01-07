From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: Correct RISC-V's timebase-frequency
Date: Mon, 7 Jan 2019 09:56:31 +0100
Message-ID: <a3e05488-053d-ae3e-b342-0799e60b1abd@linaro.org>
References: <mhng-9767f556-9f5a-4366-931f-131222d3253b@palmer-si-x1c4>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <mhng-9767f556-9f5a-4366-931f-131222d3253b@palmer-si-x1c4>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>
Cc: atish.patra@wdc.com, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, aou@eecs.berkeley.edu, devicetree@vger.kernel.org, dmitriy@oss-tech.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, tglx@linutronix.de, anup@brainfault.org, Damien.LeMoal@wdc.com, Christoph Hellwig <hch@infradead.org>
List-Id: devicetree@vger.kernel.org

On 04/01/2019 01:36, Palmer Dabbelt wrote:
> On Fri, 14 Dec 2018 01:17:24 PST (-0800), daniel.lezcano@linaro.org wrote:
>> On 14/12/2018 00:14, Atish Patra wrote:
>>> From: Palmer Dabbelt <palmer@sifive.com>
>>>
>>> In RISC-V systems, timebase-frequency is per cpu instead of one
>>> instance for entire SOC as there is a individual timer per each CPU.
>>> Fix the DT binding accordingly.
>>
>> Why not use a fixed-clock instead of this timebase property which forces
>> to declare a global variable to be exported from arch/riscv to
>> drivers/clocksource ?
> 
> That makes sense to me.  I've always disliked this global variable and a
> big part of why my original version got delayed forever is that I'd
> hoped to get rid of it.
> 
> Given that this is all a mess anyway I'm OK breaking backwards
> compatibility here.
> 
> Is there an example of how to do this?


Can you give some hardware details? Is the timebase frequency constant?
If it is the case, a fixed-clock shared for each cpu can be used, no?

    myclock: myclock {
        compatible = "fixed-clock";
        #clock-cells = <0>;
        clock-frequency  = <1000000>;
        clock-output-names = "mytimer";
    };

Alternatively, may be different output can be specified with the clock,
one for each CPUs.

Or if the timebase frequency is resulting from a clock divisor, it can
be defined as:

        clock {
                compatible = "fixed-factor-clock";
                clocks = <&parentclk>;
                #clock-cells = <0>;
                clock-div = <2>;
                clock-mult = <1>;
        };

hardware details can help to narrow down the right description.


>> In addition, please add the 'Fixes' tag
>>
>>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> [Atish: Update the commit text]
>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> ---
>>>  Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt
>>> b/Documentation/devicetree/bindings/riscv/cpus.txt
>>> index adf7b7af..b0b038d6 100644
>>> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
>>> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
>>> @@ -93,9 +93,9 @@ Linux is allowed to run on.
>>>          cpus {
>>>                  #address-cells = <1>;
>>>                  #size-cells = <0>;
>>> -                timebase-frequency = <1000000>;
>>>                  cpu@0 {
>>>                          clock-frequency = <1600000000>;
>>> +                        timebase-frequency = <1000000>;
>>>                          compatible = "sifive,rocket0", "riscv";
>>>                          device_type = "cpu";
>>>                          i-cache-block-size = <64>;
>>> @@ -113,6 +113,7 @@ Linux is allowed to run on.
>>>                  };
>>>                  cpu@1 {
>>>                          clock-frequency = <1600000000>;
>>> +                        timebase-frequency = <1000000>;
>>>                          compatible = "sifive,rocket0", "riscv";
>>>                          d-cache-block-size = <64>;
>>>                          d-cache-sets = <64>;
>>> @@ -145,6 +146,7 @@ Example: Spike ISA Simulator with 1 Hart
>>>  This device tree matches the Spike ISA golden model as run with
>>> `spike -p1`.
>>>
>>>          cpus {
>>> +                timebase-frequency = <1000000>;
>>>                  cpu@0 {
>>>                          device_type = "cpu";
>>>                          reg = <0x00000000>;


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
