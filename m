From: Jason <linux_arm@lakedaemon.net>
Subject: Re: orion/kirkwood and device tree support
Date: Mon, 10 Oct 2011 07:23:22 -0400
Message-ID: <20111010112322.GJ31288@titan.lakedaemon.net>
References: <201110091545.55645.michael@walle.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <201110091545.55645.michael@walle.cc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Michael Walle <michael@walle.cc>
Cc: devicetree-discuss@lists.ozlabs.org, Lennert Buytenhek <kernel@wantstofly.org>, linux-arm-kernel@lists.infradead.org, Nicolas Pitre <nico@fluxnic.net>
List-Id: devicetree@vger.kernel.org

Resend, messed up my email alias.  I'm a dork.  :-(  Apologies.

Michael,

On Sun, Oct 09, 2011 at 03:45:55PM +0200, Michael Walle wrote:
> I submitted a patch to support the Buffalo LS-XHL three months ago, which was 
> rejected because no more old fashioned board setup patches will be merged. 

We have the same situation with the dreamplug (kirkwood based).

> Are there any plans or even ongoing developments to convert these platforms to 
> support device trees?

I'm attempting to, but that requires my learning devicetree.  Which is
fine in and of itself, but it also means I'm learning how Linux supports
arm SoCs.  Which is taking some time.  My current thought process is this:

1.) add arch/arm/mach-kirkwood/board-dt.c, arch/arm/boot/dts/kirkwood.dtsi,
    and arch/arm/boot/dts/kirkwood-dreamplug.dts
2.) fill it in with replacements of calls in common.c and irq.c
3.) get it working cleanly.
4.) add in calls from mpp.c, pcie.c, and cpuidle.c
5.) build arch/arm/boot/dts/kirkwood-*.dts for other boards.

I'd be happy to coordinate and test, although I have no buffalo gear.
And I sure would appreciate some help. ;-)

thx,

Jason.
