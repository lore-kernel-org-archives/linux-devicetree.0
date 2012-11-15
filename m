From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH V2 1/5] arm: mvebu: Added support for coherency fabric
 in mach-mvebu
Date: Thu, 15 Nov 2012 16:54:39 +0100
Message-ID: <50A5103F.1040903@free-electrons.com>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
 <1351545108-18954-2-git-send-email-gregory.clement@free-electrons.com>
 <20121105140258.GO3351@mudshark.cambridge.arm.com>
 <50A15A33.60405@free-electrons.com>
 <20121113104340.GD3940@mudshark.cambridge.arm.com>
 <50A3F860.5010601@free-electrons.com>
 <20121115101752.GA26453@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121115101752.GA26453@mudshark.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Will Deacon <will.deacon@arm.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Mike Turquette <mturquette@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <Leif.Lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, "jcm@redhat.com" <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/15/2012 11:17 AM, Will Deacon wrote:
> On Wed, Nov 14, 2012 at 08:00:32PM +0000, Gregory CLEMENT wrote:
>> On 11/13/2012 11:43 AM, Will Deacon wrote:
>>> On Mon, Nov 12, 2012 at 08:21:07PM +0000, Gregory CLEMENT wrote:
>>>> On 11/05/2012 03:02 PM, Will Deacon wrote:
>>>>> These writels may expand to code containing calls to outer_sync(), which
>>>>> will attempt to take a spinlock for the aurora l2. Given that the CPU isn't
>>>>> coherent, how does this play out with the exclusive store instruction in the
>>>>> lock?
>>>>
>>>> I dug a little this subject: and I am not sure there is problem. In SMP mode,
>>>> only the system cache mode of Aurora is used. In this mode, outer_cache.sync
>>>> is void then outer_sync() won't call any function, so there will be no
>>>> access to any spinlock.
>>>
>>> Hmm, that is pretty subtle and it doesn't really solve the bigger picture.
>>> printk takes logbuf_lock, for example, and I'm sure that by the time you get
>>> to this code you will have relied on exclusives behaving correctly.
>>>
>>
>> Hi Will,
>> I get an answer from Marvell engineers:
>> "STREX on non-shareable and/or non-cacheable memory regions is supported."
> 
> Interesting, thanks for asking them about this. Does this mean that:

Here come the answers to your new questions


>
> 	1. When not running coherently (i.e. before initialising the
> 	   coherency fabric), memory is treated as non-shareable,
> 	   non-cacheable?

It can be cacheable. The shared memory (as defined on the page table)
will NOT be coherent by HW.

>
> 	2. If (1), then are exclusive accesses the only way to achieve
> 	   coherent memory accesses in this scenario?

I quote: "I suspect there is terminology miss-use: exclusive accesses
are NOT used to achieve memory coherency - they are used to achieve
atomicity. To achieve memory coherency while fabric is configured to
be non-coherent, SW should use maintenance operations over the L1
caches.suspect there is terminology miss-use: exclusive accesses are
NOT used to achieve memory coherency - "they are used to achieve
atomicity. To achieve memory coherency while fabric is configured to
be non-coherent, SW should use maintenance operations over the L1
caches.

> If so, you still have a problem with write locks, where the unlock code does
> a regular str to clear the status. atomic_{read,set} also uses regular
> memory accesses, so I think you'll get some surprises there when you add
> explicit memory barriers and expect things to be visible between threads.
>
> Do memory barriers have different semantics depending on the state of your
> coherency fabric?

No


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
