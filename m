From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 8/9] ARM: dts: refresh dts file for arch mmp
Date: Wed, 6 Jun 2012 01:28:27 +0000
Message-ID: <201206060128.28167.arnd@arndb.de>
References: <1336134626-12262-1-git-send-email-haojian.zhuang@gmail.com>
 <1336134626-12262-9-git-send-email-haojian.zhuang@gmail.com>
 <87d35ezkm1.fsf@laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <87d35ezkm1.fsf@laptop.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Ball <cjb@laptop.org>
Cc: linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, grant.likely@secretlab.ca, Mitch Bradley <wmb@firmworks.com>, eric.y.miao@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 05 June 2012, Chris Ball wrote:
> Hi Haojian,
> 
> On Fri, May 04 2012, Haojian Zhuang wrote:
> > Append mmp2 and pxa910 dts files. Update PXA168 dts files for irq,
> > timer, gpio components.
> 
> The patch I'm replying to introduced a device tree for MMP2/Brownstone
> in 3.5-rc1.  We're looking at adopting the MMP2 device tree for the OLPC
> XO-1.75 board, and Mitch Bradley has some corrections to the device tree
> format that we'd like to make, appended below.
> 
> You can see all of the files Mitch mentions at:
> http://dev.laptop.org/~wmb/mmp2-devicetree/
> 
> Here's my proposal for what to do next:
>  * First, you choose one of the two forms that Mitch links to.
>    (Either "mmp2.dtsi" or "mmp2-flat.dtsi"; we have a weak preference
>    for mmp2-flat.dtsi.)

My preference would be towards mmp2.dtsi. I've recommended doing it
that way to other people, too.

> d) Moved the "intcmux" nodes down a level so they are children of the
> top-level interrupt-controller node.  The problem with having them as
> peers of the top-level interrupt-controller is that their "reg"
> properties conflict.  For example:
> intcmux4@d4282150 { ... reg = <0x150 0x4>, <0x168 0x4> ... }
> 
> This is incorrect in several ways:
> 
>    1) "@d4282150" is inconsistent with "reg = <0x150" .  The "unit
>       address" after @ is supposed to be the same as the first component
>       of the reg property.  d4282150 is not identical to 150.

I thought the rule was that the @... part should be a translated address
in the presence of "ranges" translation so we get a unique value in case
we have multiple devices of the same name on the same address but on
different buses.

If we change this here, I suppose it also needs to be changed in a number
of other places, and we have to rethink the method for unique device
names.

> The solution is to put the intcmux nodes underneath the
> interrupt-controller node.  The interrupt-controller node now has
> #address-cells and #size-cells properties so it can have children, but
> it does not have a ranges property, so the address space is not passed
> through.  The child (intcmux) reg addresses can then be interpreted
> independently, without conflict.

Right. The implication for this however is that the driver cannot
treat the reg property as a physical address it can do ioremap on,
but needs to interface with the driver that provides the address
space.

	Arnd
