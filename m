From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH V2 1/5] arm: mvebu: Added support for coherency fabric
 in mach-mvebu
Date: Thu, 15 Nov 2012 17:49:17 +0100
Message-ID: <50A51D0D.4090009@free-electrons.com>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
 <1351545108-18954-2-git-send-email-gregory.clement@free-electrons.com>
 <20121105140258.GO3351@mudshark.cambridge.arm.com>
 <50A15A33.60405@free-electrons.com>
 <20121113104340.GD3940@mudshark.cambridge.arm.com>
 <50A3F860.5010601@free-electrons.com>
 <20121115101752.GA26453@mudshark.cambridge.arm.com>
 <50A5103F.1040903@free-electrons.com>
 <20121115162123.GC5885@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20121115162123.GC5885@mudshark.cambridge.arm.com>
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

On 11/15/2012 05:21 PM, Will Deacon wrote:
> Hi Gregory,
> 
> On Thu, Nov 15, 2012 at 03:54:39PM +0000, Gregory CLEMENT wrote:
>> On 11/15/2012 11:17 AM, Will Deacon wrote:
>>> Interesting, thanks for asking them about this. Does this mean that:
>>
>> Here come the answers to your new questions
> 
> Great, thanks for the quick turn-around!
> 
>>> 	1. When not running coherently (i.e. before initialising the
>>> 	   coherency fabric), memory is treated as non-shareable,
>>> 	   non-cacheable?
>>
>> It can be cacheable. The shared memory (as defined on the page table)
>> will NOT be coherent by HW.
> 
> Ok, so we really are incoherent before enabling the fabric.
> 
>>> 	2. If (1), then are exclusive accesses the only way to achieve
>>> 	   coherent memory accesses in this scenario?
>>
>> I quote: "I suspect there is terminology miss-use: exclusive accesses
>> are NOT used to achieve memory coherency - they are used to achieve
>> atomicity. To achieve memory coherency while fabric is configured to
>> be non-coherent, SW should use maintenance operations over the L1
>> caches."
> 
> Ok, so if I'm understanding correctly then I don't really see the usefulness
> of having working exclusives that are incoherent. Surely it means that you
> can guarantee mutual exclusion on a lock variable, but the value you actually
> end up reading from the lock is junk unless you litter the accessors with cache
> clean operations?
> 
> Anyway, that's by-the-by as this is all called early enough that we
> shouldn't care. The thing I don't like now is that the fabric initialisation
> is done entirely differently on the primary CPU than the secondaries. The
> primary probes the device-tree (well, it's also now hard-coded for v2) and
> accesses the registers from a C function(armada_370_xp_set_cpu_coherent) whilst
> the secondaries have hardcoded addresses and access via asm
> (armada_xp_secondary_startup).


Now it is hardcoded in both case as you pointed it. So the last
difference is setup from a C function or via asm.

The differences between primary and secondary CPU when they enable the
coherency, is due to the fact that we really are in a different
situation. For primary CPU, as it is the only CPU online it doesn't
need to enable the coherency from the beginning, so we can wait to
have MMU enable and convenient feature. Whereas for the secondary CPU
they need the coherency from the very beginning are by definition they
won't be alone. That's why this very first instruction are written in
asm and they use physical address.

I don't see how to handle it in a different way.

Gregory
