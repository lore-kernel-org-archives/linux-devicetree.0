From: Will Deacon <will.deacon@arm.com>
Subject: Re: [RFC PATCH] Documentation: devicetree: add description for
 generic bus properties
Date: Fri, 29 Nov 2013 18:15:17 +0000
Message-ID: <20131129181517.GK31000@mudshark.cambridge.arm.com>
References: <20131127230650.GA6162@kroah.com>
 <20131128102845.GB21354@mudshark.cambridge.arm.com>
 <20131128173339.GB4634@e103592.cambridge.arm.com>
 <20131128191331.GB2385@kroah.com>
 <20131128193917.GC4634@e103592.cambridge.arm.com>
 <20131128212528.GA6144@kroah.com>
 <20131129114453.GC21336@mudshark.cambridge.arm.com>
 <20131129173701.GA5635@kroah.com>
 <20131129180110.GJ31000@mudshark.cambridge.arm.com>
 <20131129181123.GA7113@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20131129181123.GA7113@kroah.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Dave P Martin <Dave.Martin@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 29, 2013 at 06:11:23PM +0000, Greg KH wrote:
> On Fri, Nov 29, 2013 at 06:01:10PM +0000, Will Deacon wrote:
> > On Fri, Nov 29, 2013 at 05:37:01PM +0000, Greg KH wrote:
> > > On Fri, Nov 29, 2013 at 11:44:53AM +0000, Will Deacon wrote:
> > > > On Thu, Nov 28, 2013 at 09:25:28PM +0000, Greg KH wrote:
> > > > > On Thu, Nov 28, 2013 at 07:39:17PM +0000, Dave Martin wrote:
> > > > > > On Thu, Nov 28, 2013 at 11:13:31AM -0800, Greg KH wrote:
> > > > > > > Yes it is, you all are the ones tasked with implementing the crazy crap
> > > > > > > the hardware people have created, best of luck with that :)
> > > > > > 
> > > > > > Agreed.  The first assumption should be that we can fit in with the
> > > > > > existing device model -- we should only reconsider if we find that
> > > > > > to be impossible.
> > > > > 
> > > > > Let me know if you think it is somehow impossible, but you all should
> > > > > really push back on the insane hardware designers that are forcing you
> > > > > all to do this work.  I find it "interesting" how this all becomes your
> > > > > workload for their crazy ideas.
> > > > 
> > > > Oh, I don't think we're claiming anything is impossible here :) It's more
> > > > that we will probably want to make some changes to the device model to allow,
> > > > for example, a device to be associated with multiple buses of potentially
> > > > different types.
> > > 
> > > Why would you want that?  What good would that help with?
> > 
> > It would help with devices which have their slave interface on one bus, but
> > master to another.
> > 
> > We need a way to configure the master side of things (IOMMU, coherency, MSI
> > routing, etc) on one bus and configure the slave side (device probing, power
> > management, clocks, etc) on another.
> 
> Make this two "devices" and have each "device" have a pointer or a way
> to "find" the other one.

That's certainly one possibility, and one that I'd also toyed around with.
The risk is that we're just spreading the problem around (e.g. into the
dmaengine API), but it's definitely a starting point.

As I said, we need to sort out the DT bindings first then we can see exactly
what we need to fit into Linux.

Will
