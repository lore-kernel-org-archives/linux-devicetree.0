From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 1/3] dt-binding: cpu-topology: Move cpu-map to a common
 binding.
Date: Mon, 19 Nov 2018 09:57:26 -0800
Message-ID: <92a4a24d-6619-876f-18df-1326914f5cc1@wdc.com>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
 <1541728209-3224-2-git-send-email-atish.patra@wdc.com>
 <20181117163253.GA6713@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181117163253.GA6713@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "anup@brainfault.org" <anup@brainfault.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "palmer@sifive.com" <palmer@sifive.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "juri.lelli@arm.com" <juri.lelli@arm.com>, "mick@ics.forth.gr" <mick@ics.forth.gr>, "jeremy.linton@arm.com" <jeremy.linton@arm.com>
List-Id: devicetree@vger.kernel.org

On 11/17/18 8:33 AM, Rob Herring wrote:
> On Thu, Nov 08, 2018 at 05:50:07PM -0800, Atish Patra wrote:
>> cpu-map binding can be used to described cpu topology for both
>> RISC-V & ARM. It makes more sense to move the binding to document
>> to a common place.
>>
>> The relevant discussion can be found here.
>> https://lkml.org/lkml/2018/11/6/19
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>   Documentation/devicetree/bindings/arm/topology.txt | 475 -------------------
>>   .../devicetree/bindings/cpu/cpu-topology.txt       | 526 +++++++++++++++++++++
>>   2 files changed, 526 insertions(+), 475 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/arm/topology.txt
>>   create mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt
> 
> Please send this with '-M' option so we just get the real changes.
> 

Sure. I will resend it.

Regards,
Atish
> Rob
> 
