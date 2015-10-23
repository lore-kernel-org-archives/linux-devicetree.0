From: Qais Yousef <qais.yousef@imgtec.com>
Subject: Re: Generic DT binding for IPIs
Date: Fri, 23 Oct 2015 11:28:56 +0100
Message-ID: <562A0BE8.8070106@imgtec.com>
References: <561E2BE6.2090807@imgtec.com>
 <CAL_JsqKb3VFyo+xrWeC99-z=xhKbei0=cETU=Nip79K1xU6FSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKb3VFyo+xrWeC99-z=xhKbei0=cETU=Nip79K1xU6FSw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Jiang Liu <jiang.liu@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/22/2015 02:43 PM, Rob Herring wrote:
> On Wed, Oct 14, 2015 at 5:18 AM, Qais Yousef <qais.yousef@imgtec.com> wrote:
>> Hi,
>>
>> This is an attempt to revive a discussion on the right list this time with
>> all the correct people hopefully on CC.
> devicetree-spec would be more appropriate list for something like this.

Thanks I didn't know about it.

>
>> While trying to upstream a driver, Thomas and Marc Zyngier pointed out the
>> need for a generic IPI support in the kernel to allow driver to reserve and
>> send ones. Hopefully my latest RFC patch will help to clarify what's being
>> done.
>>
>>      https://lkml.org/lkml/2015/10/13/227
>>
>> We need a generic DT binding support to accompany that to allow a driver to
>> reserve an IPI using this new mechanism.
>>
>> MarcZ had the following suggestion:
>>
>>      https://lkml.org/lkml/2015/8/24/628
>>
>> Which in summary is
>>
>>          mydevice@f0000000 {
>>                  interrupt-source = <&intc INT_SPEC 2 &inttarg1 &inttarg1>;
> What is INT_SPEC and "2"? A drawing of the h/w connections and then
> what the binding looks like would be helpful.

INT_SPEC are the interrupt controller specific parameters. I think 2 
refers to how many 'interrupt-sink' references it's being passed.

>
>>          };
>>
>>          inttarg1: mydevice@f1000000 {
>>                  interrupt-sink = <&intc HWAFFINITY1>;
> What is HWAFFINITY1? I want to be able to see if say this value is 1,
> then the affinity is for cpu0.

HWAFFINITY is the CPU to map the IPI to. The actual value would be 
specific to the interrupt controller. The controller implementation can 
always provide a set of defines if the mapping is not straightforward.

>
>>          };
>>
>>          inttarg2: cpu@1 {
>>                  interrupt-sink = <&intc HWAFFINITY2>;
>>          };
>>
>>
>> interrupt-sink requests to reserve an IPI that it will receive at HWAFFINITY
>> cpumask. interrupt-source will not do any reservation. It will simply
>> connect an IPI reserved by interrupt-sink to the device that will be
>> responsible for generating that IPI. This description should allow
>> connecting any 2 devices.
>> Correct me Marc if I got it wrong please.
>>
>> I suggested a simplification by assuming that IPIs will only be between host
>> OS and a coprocessor which would gives us this form which I think is easier
>> to deal with
>>
>>          coprocessor {
>>               interrupt-source = <&intc INT_SPEC COP_HWAFFINITY>;
>>               interrupt-sink = <&intc INT_SPEC CPU_HWAFFINITY>;
>>          }
>>
>>
>> interrupt-source here reserves an IPI to be sent from host OS to coprocessor
>> at COP_HWAFFINITY. interrupt-sink will reserve an IPI to be received by host
>> OS at CPU_HWAFFINITY. Less generic but I don't know how important it is for
>> host OS to setup IPIs between 2 external coprocessors and whether it should
>> really be doing that.
> Could we use the existing interrupts binding for interrupt-sink?

No. interrupt-sink will cause an IPI to be dynamically allocated and 
mapped to that processor. Of course, if the connection is hardwired then 
interrupts property is the right thing to use.

>
>> What do the DT experts think? Any preference or a better suggestion?
> Depends how you would assign coproc to coproc IPIs in a system. It may
> be fixed in firmware, or more complex coprocs may read the dtb.

OK. I'll try to cook some RFC patches that implement this which 
hopefully will make it easier to review and build on.

Thanks,
Qais
