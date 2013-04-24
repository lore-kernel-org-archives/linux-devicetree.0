From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [RFC PATCH v2 03/13] ARM: mach-at91: cpus/cpu node dts updates
Date: Wed, 24 Apr 2013 14:45:20 +0200
Message-ID: <20130424124520.GK4998@game.jcrosoft.org>
References: <1366644455-16550-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366644455-16550-4-git-send-email-lorenzo.pieralisi@arm.com>
 <51768892.7060807@gmail.com>
 <20130423135304.GG22946@e102568-lin.cambridge.arm.com>
 <20130423195259.GJ4998@game.jcrosoft.org>
 <20130424092914.GA1561@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20130424092914.GA1561@e102568-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Viresh Kumar <viresh.kumar@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Sekhar Nori <nsekhar@ti.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Simon Horman <horms@verge.net.au>, Amit Kucheria <amit.kucheria@linaro.org>, Barry Song <baohua.song@csr.com>, David Brown <davidb@codeaurora.org>, Vinayak Kale <vkale@apm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

On 10:29 Wed 24 Apr     , Lorenzo Pieralisi wrote:
> On Tue, Apr 23, 2013 at 08:52:59PM +0100, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 14:53 Tue 23 Apr     , Lorenzo Pieralisi wrote:
> > > On Tue, Apr 23, 2013 at 02:11:46PM +0100, Rob Herring wrote:
> > > > On 04/22/2013 10:27 AM, Lorenzo Pieralisi wrote:
> > > > > This patch updates the in-kernel dts files according to the latest cpus
> > > > > and cpu bindings updates for ARM.
> > > > > 
> > > > > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > > > > ---
> > > > >  arch/arm/boot/dts/at91sam9260.dtsi | 2 +-
> > > > >  arch/arm/boot/dts/at91sam9263.dtsi | 2 +-
> > > > >  arch/arm/boot/dts/at91sam9g45.dtsi | 2 +-
> > > > >  arch/arm/boot/dts/at91sam9n12.dtsi | 2 +-
> > > > >  4 files changed, 4 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm/boot/dts/at91sam9260.dtsi b/arch/arm/boot/dts/at91sam9260.dtsi
> > > > > index cb7bcc5..2e9de85 100644
> > > > > --- a/arch/arm/boot/dts/at91sam9260.dtsi
> > > > > +++ b/arch/arm/boot/dts/at91sam9260.dtsi
> > > > > @@ -33,7 +33,7 @@
> > > > >  	};
> > > > >  	cpus {
> > > > >  		cpu@0 {
> > > > > -			compatible = "arm,arm926ejs";
> > > > > +			compatible = "arm,arm926";
> > > > 
> > > > I don't understand why you are doing this. If this does not match the
> > > > documentation, fix the documentation. We can't continue on changing dts
> > > > files without reqard to breaking compatibility.
> > > 
> > > IMHO compatibility is already broken. There are a number of dts in the
> > > kernel missing cpus and cpu nodes, others with cpu nodes missing
> > > device_type = "cpu", missing cpu nodes compatible properties and the list
> > > goes on and on. Those files got merged in the kernel before bindings were
> > > properly defined for ARM so at that point in time the only reference was the
> > > ePAPR and still, it was not followed (eg my broken patch above fails to add
> > > device_type = "cpu" to the cpu node, should I change the documentation (ePAPR)
> > > to make the dts above compliant ? I do not think so, I reckon we should fix
> > > all dts and force them to comply with the ePAPR and the in-kernel bindings).
> > > 
> > > If we do not set in stone the bindings and draw a line now, this stuff will
> > > go wild, it is already in a state that I do not like much.
> > > 
> > > The reason we are patching the compatible property above is to avoid having
> > > compatible properties containing suffixes for CPUs, we do not deem that
> > > necessary, see:
> > > 
> > > http://lists.infradead.org/pipermail/linux-arm-kernel/2013-January/145305.html
> > > 
> > > That's just my opinion, open to change it to find a proper solution to this
> > > issue as long as we make progress.
> > 
> > I do not agree when you set the compatible you need to be preceise the cpu is
> > a arm926ejs not a arm926
> 
> I updated the bindings with all processor variants so that we will all
> be happy again (I hope). My comments still stand though and these dts need
> patching, I am posting the required changes in v3.

ok tks put me in Cc for at91

Best Regards,
J.
> 
> Lorenzo
> 
