From: Rob Herring <robherring2@gmail.com>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Wed, 10 Aug 2011 09:37:26 -0500
Message-ID: <4E4297A6.6050101@gmail.com>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
	<4E428EB0.1080204@gmail.com>
	<20110810141048.GK10121@e102144-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110810141048.GK10121@e102144-lin.cambridge.arm.com>
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, 'Arnd Bergmann' <arnd@arndb.de>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, 'Barry Song' <21cnbao@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "workgroup.linux@csr.com" <workgroup.linux@csr.com>, 'Grant Likely' <grant.likely@secretlab.ca>, "weizeng.he@csr.com" <weizeng.he@csr.com>, 'Olof Johansson' <olof@lixom.net>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 08/10/2011 09:10 AM, Will Deacon wrote:
> Hi Rob,
> 
> On Wed, Aug 10, 2011 at 02:59:12PM +0100, Rob Herring wrote:
>> I think you should allow for either the single irq or individual irqs.
>> You can specify that the event counter interrupt must be first, then the
>> pmu driver could work either way ignoring the rest. The driver probably
>> needs to mark the handler as shared if there is only the combined
>> interrupt unless you expect all interrupts to be handled by 1 driver.
> 
> I much prefer having seperate, individual IRQs with no requirement on
> ordering.
> 
> Now, the L2 binding also doesn't fit too well for the L2CC on Cortex-A15,
> which is an inner cache like the one on Cortex-A8. Because of this, it
> doesn't have a base address but it *does* have an IRQ which is how external
> aborts are raised.

This is not a general L2 binding, but an L2x0/PL310 binding. A8/A15 L2
is a completely different binding and driver though. You would do
something like the current cpu pmu binding that is just interrupts.

Rob
