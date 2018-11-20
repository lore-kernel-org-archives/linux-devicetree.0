From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC PATCH] Documentation: DT: arm: add support for sockets
 defining package boundaries
Date: Mon, 19 Nov 2018 17:18:42 -0800
Message-ID: <e599eaf5-381b-e2e0-067a-4225bb348b80@wdc.com>
References: <20181107171344.983-1-sudeep.holla@arm.com>
 <5bea0ecf.1c69fb81.7820a.2052@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5bea0ecf.1c69fb81.7820a.2052@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "palmer@sifive.com" <palmer@sifive.com>, "anup@brainfault.org" <anup@brainfault.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, "mick@ics.forth.gr" <mick@ics.forth.gr>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "zong@andestech.com" <zong@andestech.com>, "alankao@andestech.com" <alankao@andestech.com>
List-Id: devicetree@vger.kernel.org

On 11/12/18 3:37 PM, Rob Herring wrote:
> On Wed, Nov 07, 2018 at 05:13:44PM +0000, Sudeep Holla wrote:
>> The current ARM DT topology description provides the operating system
>> with a topological view of the system that is based on leaf nodes
>> representing either cores or threads (in an SMT system) and a
>> hierarchical set of cluster nodes that creates a hierarchical topology
>> view of how those cores and threads are grouped.
>>
>> However this hierarchical representation of clusters does not allow to
>> describe what topology level actually represents the physical package or
>> the socket boundary, which is a key piece of information to be used by
>> an operating system to optimize resource allocation and scheduling.
>>
>> Lets add a new "socket" node type in the cpu-map node to describe the
>> same.
>>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> ---
>>   .../devicetree/bindings/arm/topology.txt      | 52 ++++++++++++++-----
>>   1 file changed, 39 insertions(+), 13 deletions(-)
>>
>> (Note patch generated with -b option to avoid 60+ of whitespace changes)
>>
>> Hi Rob,
>>
>> You had expressed your interest to generalise the CPU topology bindings
>> accross multiple architectures. Do you want to move to the generic
>> bindings before adding this $subject socket support or is it OK to
>> finalise on this and then move the majority(based on the agreement)
>> to generic binding.
> 
> Doesn't really matter to me as long as Risc-V folks are in agreement.
> 
> Otherwise, this looks fine to me.
> 
> Rob
> 
> 
I can apply this patch in my unify topology series and resend everything 
together as one series.


Regards,
Atish
