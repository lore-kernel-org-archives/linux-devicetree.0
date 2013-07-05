From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Best practice device tree design for display subsystems/DRM
Date: Fri, 5 Jul 2013 11:41:27 +0100
Message-ID: <CACxGe6s9YVUSVsvZgxxnFaooXMoHWRPRiUVf1yU+do94dxXCGg@mail.gmail.com>
References: <20130703090242.GM516@pengutronix.de>
 <20130703095248.GG13924@flint.arm.linux.org.uk>
 <20130704083307.GH10414@pengutronix.de>
 <20130704084052.GP13924@flint.arm.linux.org.uk>
 <20130704085817.GZ516@pengutronix.de>
 <20130704091131.GR13924@flint.arm.linux.org.uk>
 <20130704093047.GJ10414@pengutronix.de> <51D54409.6020608@gmail.com>
 <20130704100932.GL10414@pengutronix.de> <51D55555.3040403@gmail.com>
 <20130705100750.GJ516@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130705100750.GJ516-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Daniel Drake <dsd-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <rmk-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 5, 2013 at 11:07 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Again the difference between supernodes and graphs is that the supernode
> approach does not contain information about what components are needed
> to do something useful with the device. You simply have to wait until
> *all* components are present which may never happen if you don't drivers
> for all components of the device.
> With the graph instead you can start doing something once you find a
> link between a source and a sink, no matter if other links are still
> missing.

I really think you're overstating your argument here. The whole point
of a super node is that a *driver* can bind against it and a driver
can be made intelligent enough to know which links are mandatory and
which are optional (with the assumption that the data about which is
which is encoded in the supernode). Graph vs. supernode vs some
mixture of the two can all do exactly the same thing.

What really matters is which approach best describes the hardware, and
then the drivers can be designed based on that.

> Another important point is that if you have a board with multiple i2c
> encoder chips, how do you decide which one is connected to which LCDx
> when all information you have is: "I need these x components", but have
> no information how these components are connected to each other.
> Fortunately I don't have hardware here which does something like this,
> but it would also be possible to chain multiple encoder chips. This
> could be described in a graph, but when all we have is a list of
> components without connection information we would need board specific
> code to handle the layout.

It is still absolutely true that i2c devices must have a node below
the i2c bus, same for spi, same for MMIO. That doesn't change. It
really isn't an option to have the subservient devices directly under
the supernode. On that point the supernode pretty much must have
phandles to those device nodes.

*However* there is absolutely nothing that says the subservient
devices have to be bound to device drivers! It is perfectly fine for
the supernode to go looking for a registered struct i2c_device (or
whatever) and drive the device directly*. There are certainly cases
where it wouldn't make sense to split a driver for what is effectively
one device into two. But I digress.

*You'll note that I said look for i2c_device here, and not
device_node. The reason is that waiting for the i2c_device to appear
gives a guarantee that the i2c bus is initialized. Looking for the
device_node does not.

g.
