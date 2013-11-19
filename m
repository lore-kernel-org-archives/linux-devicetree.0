From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: ACPI vs DT at runtime
Date: Tue, 19 Nov 2013 14:38:40 +0000
Message-ID: <20131119143840.GN5914@e106331-lin.cambridge.arm.com>
References: <CAOesGMjKeRb=fFJM0MabDihbEiCGM4EqW9D5i_6-RFxTnpB4Qw@mail.gmail.com>
 <20131115095717.GC1709@e106331-lin.cambridge.arm.com>
 <20131115175241.GB27174@quad.lixom.net>
 <20131119113015.GH5914@e106331-lin.cambridge.arm.com>
 <alpine.DEB.2.02.1311191304260.27757@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1311191304260.27757@kaball.uk.xensource.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Cc: Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 19, 2013 at 01:56:26PM +0000, Stefano Stabellini wrote:
> On Tue, 19 Nov 2013, Mark Rutland wrote:
> > > We all know DT considerably better to a point where I would recommend
> > > that they flash a DTB in their UEFI firmware instead of go with ACPI. For
> > > simple hardware and basic devices we've got most bindings sorted out by
> > > now, and we've decided on backwards compatibility from here on out.
> > 
> > If a vendor does this, with a DTB that correctly describes their
> > hardware then I am not against it (and would prefer this case to mapping
> > from ACPI to DT).
> 
> I think that the firmware passing a DTB to the bootloader/kernel is the
> best option we have.
> 
> 
> > For that case we will also require a nailed-down boot
> > protocol that allows for either DTB or ACPI.
> 
> The latest documentation patch for the "arm/arm64 UEFI boot protocol"
> implies that UEFI on ARM is already capable of passing a DTB to the
> kernel:
> 
> "The implementation depends on receiving information about the UEFI
> environment in a Flattened Device Tree (FDT) - so is only available with
> CONFIG_OF."
> 
> Maybe we just need to better document it?

Yes, we just need to document it.

As far as I'm aware, there are two ways we might boot the kernel:

1) Via the current boot protocol, passing a DTB in a particular
register.

2) As an EFI application. As I understand it in this case the DTB will
be saved in a system table (I may have got the terminology wrong here),
and the EFI stub will need to look it up to pass it to the kernel.

As long as that's well defined and does not preclude ACPI, then I am
happy.

> 
> 
> > (only one at a time)
> 
> I would not go as far as requiring that only one is available.
> Certainly I would mandate that either of them are independently complete
> and sufficient to describe the platform.

At that point we need to choose one to prefer. This will be a completely
arbitrary choice, but as in the EFI case we would expect a DTB stub (for
passing some options in /chosen), preferring the DT if it's more than a
stub would make sense to me.

The key point is that the kernel will rely solely on one of them to
provide hardware description.

Thanks,
Mark.
