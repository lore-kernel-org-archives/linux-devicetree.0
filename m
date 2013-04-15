From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFCv2 0/2] Representing interrupt affinity in devicetree
Date: Mon, 15 Apr 2013 10:09:04 +0100
Message-ID: <20130415090904.GF8151@e106331-lin.cambridge.arm.com>
References: <1355417368-6861-1-git-send-email-mark.rutland@arm.com>
 <20130304025115.05D413E17F8@localhost>
 <20130305092849.GA15661@e106331-lin.cambridge.arm.com>
 <20130413213322.7C6193E2249@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130413213322.7C6193E2249@localhost>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Will Deacon <Will.Deacon@arm.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 13, 2013 at 10:33:22PM +0100, Grant Likely wrote:
> On Tue, 5 Mar 2013 09:28:49 +0000, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Mon, Mar 04, 2013 at 02:51:14AM +0000, Grant Likely wrote:
> > > I could use some more context for how this will be used. Do device
> > > drivers need to be aware of which CPU can handle an interrupt for a
> > > device, or is it the sort of thing that can be done in the background
> > > when an irq is requested? What are some examples of device drivers using
> > > this interface.
> > 
> > The main users I can think of for this would be PMUs in multi-cluster systems,
> > where we may have differing PMUs in each cluster. The driver for each needs to
> > know the set of CPUs it's handling, and which CPU each interrupt is affine to.
> > 
> > With the above binding scheme, we'd describe the A15x2 A7x3 CoreTile's PMUs
> > something like:
> > 
> > pmu_a15s {
> > 	compatible = "arm,cortex-a15-pmu";
> > 	interrupts = <0 68 4>,
> > 	             <0 69 4>;
> > 	interrupts-affinity = <0 0x0>,
> > 	                      <0 0x1>;
> > };
> > 
> > pmu_a7s {
> > 	compatible = arm,cortex-a7-pmu";
> > 	interrupts = <0 128 4>,
> > 	             <0 129 4>,
> > 	             <0 130 4>;
> > 	interrupts-affinity = <0 0x100>,
> > 	                      <0 0x101>,
> > 	                      <0 0x102>;
> > };
> 
> That does sound an awful lot like what Lorenzo has been trying to solve.
> I really do think that you need to coordinate with him.

Indeed it does. Lorenzo and I have been working together on this, and having
realised issues with the above approach, we've put a new series together [1]
which we both believe has a more workable approach.

Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2013-April/162457.html
