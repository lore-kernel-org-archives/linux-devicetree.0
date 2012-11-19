From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH V3 4/5] arm: mm: Added support for PJ4B cpu and init
 routines
Date: Mon, 19 Nov 2012 14:50:18 +0000
Message-ID: <20121119145018.GD4122@arm.com>
References: <1352931637-3405-1-git-send-email-gregory.clement@free-electrons.com>
 <1352931637-3405-5-git-send-email-gregory.clement@free-electrons.com>
 <CAHkRjk6BYB=OAFyQKwmA2vcpJ1w9MaYx6gRthEEy6F8GL48Kng@mail.gmail.com>
 <50AA2386.7080705@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50AA2386.7080705@free-electrons.com>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Will Deacon <Will.Deacon@arm.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Mike Turquette <mturquette@linaro.org>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <Leif.Lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, "jcm@redhat.com" <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>li
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2012 at 12:18:14PM +0000, Gregory CLEMENT wrote:
> On 11/19/2012 11:51 AM, Catalin Marinas wrote:
> > On 14 November 2012 22:20, Gregory CLEMENT
> > <gregory.clement@free-electrons.com> wrote:
> >> diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
> >> index 846d279..a4c0ccf 100644
> >> --- a/arch/arm/mm/proc-v7.S
> >> +++ b/arch/arm/mm/proc-v7.S
> >> @@ -169,6 +169,47 @@ __v7_ca15mp_setup:
> >>         orreq   r0, r0, r10                     @ Enable CPU-specific SMP bits
> >>         mcreq   p15, 0, r0, c1, c0, 1
> >>  #endif
> >> +
> >> +__v7_pj4b_setup:
> >> +#ifdef CONFIG_CPU_PJ4B
> >> +
> >> +#define SNOOP_DATA    (1 << 25) /* Dont interleave write and snoop data */
> >> +#define CWF           (1 << 27) /* Disable Critical Word First feature */
> >> +#define OUTSANDING_NC (1 << 29) /* Disable outstanding non cacheable request */
> >> +#define L1_REP_RR     (1 << 30) /* L1 replacement - Strict round robin */
> >> +
> >> +#define AUX_DBG_CTRL2 (SNOOP_DATA | CWF | OUTSANDING_NC | L1_REP_RR)
> >> +
> >> +       /* Auxiliary Debug Modes Control 1 Register */
> >> +       mrc     p15, 1, r0, c15, c1, 1
> >> +       orr     r0, r0, #(1 << 16)     @ Disable data transfer for clean line.
> >> +       orr     r0, r0, #(1 << 5)      @ Enable the back off of STREX instr
> >> +       orr     r0, r0, #(1 << 8)      @ Disable Internal Parity Handling
> >> +       bic     r0, r0, #(1 << 2)      @ Disable Static BP
> >> +       mcr     p15, 1, r0, c15, c1, 1
> >> +
> >> +       /* Auxiliary Debug Modes Control 2 Register */
> >> +       mrc     p15, 1, r0, c15, c1, 2
> >> +       bic     r0, r0, #(1 << 23)   @ Enable fast LDR.
> >> +       orr     r0, r0, #AUX_DBG_CTRL2
> >> +       mcr     p15, 1, r0, c15, c1, 2

BTW, for some bits you defined macros while others are just immediate
values. Just a cosmetic inconsistency (I would have preferred to use
either macros or just immediate values).

> >> +
> >> +       /* Auxiliary Functional Modes Control Register 0 */
> >> +       mrc     p15, 1, r0, c15, c2, 0
> >> +#ifdef CONFIG_SMP
> >> +       orr     r0, r0, #(1 << 1)     @ Set SMP mode. Join the coherency fabric
> >> +#endif
> >> +       orr     r0, r0, #(1 << 2)     @ Support L1 parity checking
> >> +       orr     r0, r0, #(1 << 8)     @ Broadcast Cache and TLB maintenance
> >> +       mcr     p15, 1, r0, c15, c2, 0
> >> +
> >> +       /* Auxiliary Debug Modes Control 0 Register */
> >> +       mrc     p15, 1, r0, c15, c1, 0
> >> +       orr     r0, r0, #(1 << 22)   @ WFI/WFE - serve the DVM and back to idle
> >> +       mcr     p15, 1, r0, c15, c1, 0
> > 
> > Any chance that these could be set by the firmware prior to starting
> > the kernel? We don't have any guidance for Linux here but longer term
> > it seems to cause problems (i.e. you add some secure layer in a new
> > CPU version).
> 
> I will ask to Marvell engineers.
> 
> However I hope it won't be show stopper for merging this code in 3.8.
> This patch set was released 7 weeks ago, so would have though there was
> a lot of time to raise the issue related to this code.

It shouldn't prevent the code being merged as we don't have clear
requirement in Linux for this. But it would be good practice to push
some sane defaults to the firmware. For example you set some option like
L1 replacement which is optimal for your platform. Later you put the
same CPU on a different SoC which may have different optimal value.
There is no way in proc-v7.S to detect the SoC.

Otherwise the patch looks fine to me.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
