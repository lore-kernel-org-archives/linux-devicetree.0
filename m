From: Ganapatrao Kulkarni <gpkulkarni@gmail.com>
Subject: Re: [RFC PATCH v2 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Tue, 25 Nov 2014 08:15:47 -0500
Message-ID: <CAFpQJXUjYsTiHSyHdgtN9JPWGN8CByR4VwtSMJhwkAUWA4iV9w@mail.gmail.com>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
 <5473FDA8.6080201@huawei.com> <54744F14.60004@linaro.org>
 <2966212.dpWQ0OTb0A@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2966212.dpWQ0OTb0A@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Steve Capper <steve.capper@linaro.org>, Al Stone <al.stone@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, msalter@redhat.com, Will Deacon <Will.Deacon@arm.com>, Leif Lindholm <leif.lindholm@linaro.org>, Roy Franz <roy.franz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Hanjun Guo <hanjun.guo@linaro.org>, Shannon Zhao <zhaoshenglong@huawei.com>, Grant Likely <grant.likely@linaro.org>, jchandra@broadcom.com, Ganapatrao Kulkarni <ganapatrao.kulkarni@caviumnetworks.com>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Tue, Nov 25, 2014 at 6:02 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 25 November 2014 17:42:44 Hanjun Guo wrote:
>> On 2014-11-25 11:55, Shannon Zhao wrote:
>> > Hi,
>> >
>> > On 2014/11/22 5:23, Ganapatrao Kulkarni wrote:
>> [...]
>> >> +==============================================================================
>> >> +4 - Example dts
>> >> +==============================================================================
>> >> +
>> >> +Example 1: 2 Node system each having 8 CPUs and a Memory.
>> >> +
>> >> +    numa-map {
>> >> +            #address-cells = <2>;
>> >> +            #size-cells = <1>;
>> >> +            #node-count = <2>;
>> >> +            mem-map =  <0x0 0x00000000 0>,
>> >> +                       <0x100 0x00000000 1>;
>> >> +
>> >> +            cpu-map = <0 7 0>,
>> >> +                      <8 15 1>;
>> >
>> > The cpu range is continuous here. But if there is a situation like below:
>> >
>> > 0 2 4 6 belong to node 0
>> > 1 3 5 7 belong to node 1
>> >
>> > This case is very common on X86. I don't know the real situation of arm as
>> > I don't have a hardware with 2 nodes.
>> >
>> > How can we generate a DTS about this situation? like below? Can be parsed?
>> >
>> >               cpu-map = <0 2 4 6 0>,
>> >                         <1 3 5 7 1>;
>>
>> I think the binding proposed here can not cover your needs, and I think this
>> binding is not suitable, there are some reasons.
>>
>>  - CPU logical ID is allocated by OS, and it depends on the order of CPU node
>>    in the device tree, so it may be in a clean order like this patch proposed,
>>    or it will like the order Shannon pointed out.
>>
>>  - Since CPU logical ID is allocated by OS, DTS file will not know these
>>    numbers.
>
> Also:
>
> - you cannot support hierarchical NUMA topology
>
> - you cannot have CPU-less or memory-less nodes
>
> - you cannot associate I/O devices with NUMA nodes, only memory and CPU
>
>> So the problem behind this is the mappings between CPUs and NUMA nodes,
>> there is already mapping for CPU hardware ID (MPIDR) and CPU logical ID,
>> and MPIDR will be not changed, why not using MPIDR for the mapping of
>> NUMA node and CPU? then the mappings will be:
>>
>> CPU logical ID <------> CPU MPIDR <-----> NUMA node ID <-----> proximity domain
>> (allocated by OS)      (constant)       (allocated by OS)
>
> No, don't hardcode ARM specifics into a common binding either. I've looked
> at the ibm,associativity properties again, and I think we should just use
> those, they can cover all cases and are completely independent of the
> architecture. We should probably discuss about the property name though,
> as using the "ibm," prefix might not be the best idea.
We have started with new proposal, since not got enough details how
ibm/ppc is managing the numa using dt.
there is no documentation and there is no power/PAPR spec for numa in
public domain and there are no single dt file in arch/powerpc which
describes the numa. if we get any one of these details, we can align
to powerpc implementation.
>
>         Arnd

thanks
ganapat
