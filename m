From: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Date: Tue, 06 Nov 2018 17:26:01 +0200
Message-ID: <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106141331.GA28458@e107155-lin>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com, alankao@andestech.com, zong@andestech.com, anup@brainfault.org, palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org, robh+dt@kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

Στις 2018-11-06 16:13, Sudeep Holla έγραψε:
> On Fri, Nov 02, 2018 at 08:58:39PM +0200, Nick Kossifidis wrote:
>> Hello All,
>> 
>> Στις 2018-11-02 01:04, Atish Patra έγραψε:
>> > This patch series adds the cpu topology for RISC-V. It contains
>> > both the DT binding and actual source code. It has been tested on
>> > QEMU & Unleashed board.
>> >
>> > The idea is based on cpu-map in ARM with changes related to how
>> > we define SMT systems. The reason for adopting a similar approach
>> > to ARM as I feel it provides a very clear way of defining the
>> > topology compared to parsing cache nodes to figure out which cpus
>> > share the same package or core.  I am open to any other idea to
>> > implement cpu-topology as well.
>> >
>> 
>> I was also about to start a discussion about CPU topology on RISC-V
>> after the last swtools group meeting. The goal is to provide the
>> scheduler with hints on how to distribute tasks more efficiently
>> between harts, by populating the scheduling domain topology levels
>> (https://elixir.bootlin.com/linux/v4.19/ident/sched_domain_topology_level).
>> What we want to do is define cpu groups and assign them to
>> scheduling domains with the appropriate SD_ flags
>> (https://github.com/torvalds/linux/blob/master/include/linux/sched/topology.h#L16).
>> 
> 
> OK are we defining a CPU topology binding for Linux scheduler ?
> NACK for all the approaches that assumes any knowledge of OS scheduler.
> 

Is there any standard regarding CPU topology on the device tree spec ? 
As far as
I know there is none. We are talking about a Linux-specific Device Tree 
binding
so I don't see why defining a binding for the Linux scheduler is out of 
scope.
Do you have cpu-map on other OSes as well ?

>> So the cores that belong to a scheduling domain may share:
>> CPU capacity (SD_SHARE_CPUCAPACITY / SD_ASYM_CPUCAPACITY)
>> Package resources -e.g. caches, units etc- (SD_SHARE_PKG_RESOURCES)
>> Power domain (SD_SHARE_POWERDOMAIN)
>> 
> 
> Too Linux kernel/scheduler specific to be part of $subject
> 

All lists on the cc list are Linux specific, again I don't see your 
point here
are we talking about defining a standard CPU topology scheme for the 
device tree
spec or a Linux-specific CPU topology binding such as cpu-map ?

Even on this case your point is not valid, the information of two harts 
sharing
a common power domain or having the same or not capacity/max frequency 
(or maybe
capabilities/extensions in the future), is not Linux specific. I just 
used the
Linux specific macros used by the Linux scheduler to point out the code 
path.
Even on other OSes we still need a way to include this information on 
the CPU
topology, and currently cpu-map doesn't. Also the Linux implementation 
of cpu-map
ignores multiple levels of shared resources, we only get one level for 
SMT and
one level for MC last time I checked.

>> In this context I believe using words like "core", "package",
>> "socket" etc can be misleading. For example the sample topology you
>> use on the documentation says that there are 4 cores that are part
>> of a package, however "package" has a different meaning to the
>> scheduler. Also we don't say anything in case they share a power
>> domain or if they have the same capacity or not. This mapping deals
>> only with cache hierarchy or other shared resources.
>> 
> 
> {Un,}fortunately those are terms used by hardware people.
> 

And they are wrong, how the harts are physically packed doesn't imply 
their
actual topology. In general the "translation" is not always straight 
forward,
there are assumptions in place. We could use "cluster" of harts or 
"group" of
harts instead, they are more abstract.

Regards,
Nick
