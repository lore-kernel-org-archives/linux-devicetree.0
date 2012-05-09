From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Wed, 09 May 2012 21:36:43 +0200
Message-ID: <a226ca6e8dd0370afeeb9aa1d67ddfde@localhost>
References: <1336586277-28454-1-git-send-email-marc.zyngier@arm.com>
 <201205091921.43299.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201205091921.43299.arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, david.vrabel@citrix.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 9 May 2012 19:21:42 +0000, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 09 May 2012, Marc Zyngier wrote:
>> 
>> The GICv2 can have virtualization extension support, consisting
>> of an additional set of registers and interrupts. Add the necessary
>> binding to the GIC DT documentation.
>> 
>> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> 
> Would it make sense to add a way to detect whether a GIC is virtual
> or real? Maybe an optional empty "virtual-gic" property or an additional
> "compatible" value. Even if we don't need it now, it might come in handy
> if we require it already.

I don't really see a need for this. When running on a virtual machine, the
kernel cannot tell if this is the real thing or not (the virtual CPU
interface looks exactly like the normal one once mapped into the guest
address space).

Or maybe I just didn't get your use case?

        M.
-- 
Fast, cheap, reliable. Pick two.
