From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v4 5/6] ARM: vexpress: DT-based support for Cortex-A5
 and Cortex-A9 based tiles
Date: Wed, 07 Dec 2011 19:06:28 +0000
Message-ID: <1323284788.32116.11.camel@hornet.cambridge.arm.com>
References: <1323186229-22054-1-git-send-email-pawel.moll@arm.com>
 <1323186229-22054-6-git-send-email-pawel.moll@arm.com>
 <3527082.WMy5vX2qZB@wuerfel> <27584177.XzoGq1stOI@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <27584177.XzoGq1stOI@wuerfel>
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
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2011-12-06 at 23:13 +0000, Arnd Bergmann wrote:
> Actually, I have to take that back. Looking at both patch 5 and 6,
> the dt-ca*.c files are almost identical and all the differences are about stuff
> that you can find in the device tree:

You are obviously right - I was rushing with that. Less is better then
more ;-) Will respin tomorrow.

> * The iotable gets initialized from "mrc p15, 4, %0, c15, c0, 0", which would
> be fine if that worked on all machines, but in order to unify the two
> files, I would recommend searching the flat device tree for the respective
> node and only map it if present.
> 
> * You have two ways of finding out the number of cores, but looking in
> the device tree would just work either way.

Those two are actually related, as it's all about memory mapped SCU in
case of A5/A9 and CP15-controlled on A7/15 (the *smp_enable() is
different as well).

I'll probably just define a "scu" node compatible with
"arm,cortex-a9-scu" and use the A5/A9 SMP callbacks if it's present (and
create static mapping for it) or the A7/15 if it's missing.

> * You set the twd_base unconditionally on a5/a9 but never on a7/a15.
> This looks correct, but you could just as well see if a twd node exists
> and use its base address.

I'll reuse Rob's Highbank solution and binding.

> * You only initialize the l2x0 on a5/a9. If a7/a15 don't have a matching
> l2x0 device, then calling the same function unconditionally should be harmless.

Yep, that's not a problem.

Thanks for all the other ack-bys and review-bys!

Pawel
