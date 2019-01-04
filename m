From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 3/7] dt-bindings: riscv: cpus: add E51 cores to the list of documented CPUs
Date: Fri, 04 Jan 2019 14:46:52 -0800 (PST)
Message-ID: <mhng-199961ff-1c6e-41f4-b7e4-66c1bbba15e3@palmer-si-x1c4>
References: <20181220210141.GA17198@bogus>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220210141.GA17198@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, devicetree@vger.kernel.org, paul@pwsan.com
List-Id: devicetree@vger.kernel.org

On Thu, 20 Dec 2018 13:01:41 PST (-0800), robh@kernel.org wrote:
> On Fri, Dec 14, 2018 at 09:21:50PM -0800, Paul Walmsley wrote:
>> Add compatible strings for the SiFive E51 family of CPU cores to the
>> RISC-V CPU compatible string documentation.  The E51 CPU core is
>> described in:
>>
>> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Palmer Dabbelt <palmer@sifive.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>> ---
>>  Documentation/devicetree/bindings/riscv/cpus.txt | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
>> index adf7b7af5dc3..fb9d4f86f41f 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
>> @@ -68,8 +68,9 @@ described below.
>>          - compatible:
>>                  Usage: required
>>                  Value type: <stringlist>
>> -                Definition: must contain "riscv", may contain one of
>> -                            "sifive,rocket0"
>> +                Definition: must contain "riscv", may contain one or
>> +			    more of "sifive,rocket0", "sifive,e51",
>> +			    "sifive,e5"
>
> I can't really tell what are valid combinations from this. It reads that
> I could list every string here and that would be valid. It is basically
> 'riscv' plus any other combinations of strings.

I think that's actually the correct interpretation: if it's a RISC-V CPU then 
it must have "riscv" listed in compatible, but it can also be anything else.  
There's some concrete examples here (a "sifive,e51" is a type of "riscv"), but 
I don't think it's realistic to count on us being able to enumerate all RISC-V 
implementations here.
