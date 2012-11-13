From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH V2 4/5] arm: mm: Added support for PJ4B cpu and init
 routines
Date: Tue, 13 Nov 2012 22:53:07 +0000
Message-ID: <20121113225307.GA9094@mudshark.cambridge.arm.com>
References: <1351545108-18954-1-git-send-email-gregory.clement@free-electrons.com>
 <1351545108-18954-5-git-send-email-gregory.clement@free-electrons.com>
 <50A26404.9010202@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <50A26404.9010202@free-electrons.com>
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
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Ike Pan <ike.pan@canonical.com>, Nadav Haklai <nadavh@marvell.com>, Ian Molton <ian.molton@codethink.co.uk>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Jani Monoses <jani.monoses@canonical.com>, Russell King <linux@arm.linux.org.uk>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <Leif.Lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, "jcm@redhat.com" <jcm@redhat.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 13, 2012 at 03:15:16PM +0000, Gregory CLEMENT wrote:
> >  __v7_setup:
> >  	adr	r12, __v7_setup_stack		@ the local stack
> >  	stmia	r12, {r0-r5, r7, r9, r11, lr}
> > @@ -342,6 +375,16 @@ __v7_ca9mp_proc_info:
> >  	.long	0xff0ffff0
> >  	__v7_proc __v7_ca9mp_setup
> >  	.size	__v7_ca9mp_proc_info, . - __v7_ca9mp_proc_info
> > +
> > +	/*
> > +	 * Marvell PJ4B processor.
> > +	 */
> > +	.type   __v7_pj4b_proc_info, #object
> > +__v7_pj4b_proc_info:
> > +	.long	0x562f5842
> > +	.long	0xffffffff

This mask seems a little excessive -- does your cpuid not contain revision
information? If so, I'm not sure we want to update the code every time there
is a new spin of the same CPU.

Will
