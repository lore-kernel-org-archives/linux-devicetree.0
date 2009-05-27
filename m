From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 18:44:40 +0100
Message-ID: <20090527174440.GA31861@flint.arm.linux.org.uk>
References: <1243408083.13460.14.camel@debian-nb>
	<fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com>
List-Unsubscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.arm.linux.org.uk/lurker/list/linux-arm-kernel.html>
List-Post: <mailto:linux-arm-kernel@lists.arm.linux.org.uk>
List-Help: <mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=help>
List-Subscribe: <http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.arm.linux.org.uk?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.arm.linux.org.uk
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.arm.linux.org.uk
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Janboe Ye <yuan-bo.ye@motorola.com>, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, jwboyer@linux.vnet.ibm.com, paulus@samba.org, devicetree-discuss <devicetree-discuss@ozlabs.org>
List-Id: devicetree@vger.kernel.org

(For whatever reason, I don't have the initial email on this.)

On Wed, May 27, 2009 at 08:27:10AM -0600, Grant Likely wrote:
> On Wed, May 27, 2009 at 1:08 AM, Janboe Ye <yuan-bo.ye@motorola.com> wrote:
> > Hi, All
> >
> > Currently, ARM linux uses mach-type to figure out platform. But mach-type could not handle variants well and it doesn't tell the kernel about info about attached peripherals.
> >
> > The device-tree used by powerpc and sparc could simplifiy board ports, less platform specific code and simplify device driver code.
> >
> > Please reference to Grant Likely and Josh Boyer's paper, A Symphony of Flavours: Using the device tree to describe embedded hardware , for the detail of device tree.
> >
> > www.kernel.org/doc/ols/2008/ols2008v2-pages-27-38.pdf
> >
> > Signed-off-by: janboe <yuan-bo.ye@motorola.com>
> 
> Heeheehe, This is Fantastic.  I'm actually working on this too.  Would
> you like to join our efforts?

My position is that I don't like this approach.  We have _enough_ of a
problem getting boot loaders to do stuff they should be doing on ARM
platforms, that handing them the ability to define a whole device tree
is just insanely stupid.

For example, it's taken _years_ to get boot loader folk to pass one
correct value to the kernel.  It's taken years for boot loaders to
start passing ATAGs to the kernel to describe memory layouts.  And even
then there's various buggy platforms which don't do this correctly.

I don't see device trees as being any different - in fact, I see it as
yet another possibility for a crappy interface that lots of people will
get wrong, and then we'll have to carry stupid idiotic fixups in the
kernel for lots of platforms.

The end story is that as far as machine developers are concerned, a
boot loader, once programmed into the device, is immutable.  They never
_ever_ want to change it, period.

So no, I see this as a recipe for ugly hacks appearing in the kernel
working around boot loader crappyness, and therefore I'm against it.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:

-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm-kernel
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php
