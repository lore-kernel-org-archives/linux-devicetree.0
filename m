From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: [RFC PATCH 0/9] Remove useless on_each_cpu return value
Date: Fri, 06 Jan 2012 14:03:01 +0100
Message-ID: <1325854981.2442.25.camel@twins>
References: <1325600353-10895-1-git-send-email-gilad@benyossef.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1325600353-10895-1-git-send-email-gilad@benyossef.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: linux-ia64@vger.kernel.org, David Airlie <airlied@linux.ie>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org, Grant Likely <grant.likely@secretlab.ca>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@arm.linux.org.uk>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, devicetree-discuss@lists.ozlabs.org, Michal Nazarewicz <mina86@mina86.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Rob Herring <rob.herring@calxeda.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.o
List-Id: devicetree@vger.kernel.org

On Tue, 2012-01-03 at 16:19 +0200, Gilad Ben-Yossef wrote:
> on_each_cpu() returns as its own return value the return value of 
> smp_call_function(). smp_call_function() in turn returns a hard 
> coded value of zero.
> 
> Some callers to on_each_cpu() waste cycles and bloat code space
> by checking the return value to on_each_cpu(), probably for 
> historical reasons.

hysterical raisins,, yumm! :-)

> This patch set refactors callers to not test on_each_cpu()
> (fixed) return value and then refactors on_each_cpu to
> return void to avoid confusing future users.
> 

Seems sane enough, fwiw:

Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
