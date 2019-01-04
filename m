From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: Correct RISC-V's timebase-frequency
Date: Thu, 03 Jan 2019 16:36:22 -0800 (PST)
Message-ID: <mhng-9767f556-9f5a-4366-931f-131222d3253b@palmer-si-x1c4>
References: <5d652370-4782-23b2-9896-b9666b3cc1e7@linaro.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d652370-4782-23b2-9896-b9666b3cc1e7@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org
Cc: atish.patra@wdc.com, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, aou@eecs.berkeley.edu, devicetree@vger.kernel.org, dmitriy@oss-tech.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, tglx@linutronix.de, anup@brainfault.org, Damien.LeMoal@wdc.com, Christoph Hellwig <hch@infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, 14 Dec 2018 01:17:24 PST (-0800), daniel.lezcano@linaro.org wrote:
> On 14/12/2018 00:14, Atish Patra wrote:
>> From: Palmer Dabbelt <palmer@sifive.com>
>>
>> In RISC-V systems, timebase-frequency is per cpu instead of one
>> instance for entire SOC as there is a individual timer per each CPU.
>> Fix the DT binding accordingly.
>
> Why not use a fixed-clock instead of this timebase property which forces
> to declare a global variable to be exported from arch/riscv to
> drivers/clocksource ?

That makes sense to me.  I've always disliked this global variable and a big 
part of why my original version got delayed forever is that I'd hoped to get 
rid of it.

Given that this is all a mess anyway I'm OK breaking backwards compatibility 
here.

Is there an example of how to do this?

> In addition, please add the 'Fixes' tag
>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> [Atish: Update the commit text]
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
>> index adf7b7af..b0b038d6 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
>> @@ -93,9 +93,9 @@ Linux is allowed to run on.
>>          cpus {
>>                  #address-cells = <1>;
>>                  #size-cells = <0>;
>> -                timebase-frequency = <1000000>;
>>                  cpu@0 {
>>                          clock-frequency = <1600000000>;
>> +                        timebase-frequency = <1000000>;
>>                          compatible = "sifive,rocket0", "riscv";
>>                          device_type = "cpu";
>>                          i-cache-block-size = <64>;
>> @@ -113,6 +113,7 @@ Linux is allowed to run on.
>>                  };
>>                  cpu@1 {
>>                          clock-frequency = <1600000000>;
>> +                        timebase-frequency = <1000000>;
>>                          compatible = "sifive,rocket0", "riscv";
>>                          d-cache-block-size = <64>;
>>                          d-cache-sets = <64>;
>> @@ -145,6 +146,7 @@ Example: Spike ISA Simulator with 1 Hart
>>  This device tree matches the Spike ISA golden model as run with `spike -p1`.
>>
>>          cpus {
>> +                timebase-frequency = <1000000>;
>>                  cpu@0 {
>>                          device_type = "cpu";
>>                          reg = <0x00000000>;
