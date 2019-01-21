From: Liming Sun <lsun@mellanox.com>
Subject: RE: [PATCH v6 5/9] soc: mellanox: host: Add the common host side
 Rshim driver
Date: Mon, 21 Jan 2019 19:22:41 +0000
Message-ID: <DB6PR05MB32233FF89600716711441C04A19F0@DB6PR05MB3223.eurprd05.prod.outlook.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1541089538-175682-1-git-send-email-lsun@mellanox.com>
 <1541089538-175682-5-git-send-email-lsun@mellanox.com>
 <CAK8P3a2NRbEaS_EJNtBaZ3GCUtRiH2rUDRzJFjvcw2ZacZM1qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a2NRbEaS_EJNtBaZ3GCUtRiH2rUDRzJFjvcw2ZacZM1qw@mail.gmail.com>
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
To: Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, David Woods <dwoods@mellanox.com>, linux-pci <linux-pci@vger.kernel.org>, Vincent Whitchurch <vincent.whitchurch@axis.com>, arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Thanks Arnd for the comments. The 0/9 email was sent out just now to
add more details about the design and changes. Please also see my response
below.

- Liming

> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> Sent: Friday, January 18, 2019 11:02 AM
> To: Liming Sun <lsun@mellanox.com>
> Cc: Olof Johansson <olof@lixom.net>; David Woods <dwoods@mellanox.com>; Robin Murphy <robin.murphy@arm.com>; arm-soc
> <arm@kernel.org>; DTML <devicetree@vger.kernel.org>; Linux ARM <linux-arm-kernel@lists.infradead.org>; Vincent Whitchurch
> <vincent.whitchurch@axis.com>; linux-pci <linux-pci@vger.kernel.org>; linux-ntb@googlegroups.com; Christoph Hellwig <hch@lst.de>
> Subject: Re: [PATCH v6 5/9] soc: mellanox: host: Add the common host side Rshim driver
> 
> On Thu, Nov 1, 2018 at 5:49 PM Liming Sun <lsun@mellanox.com> wrote:
> >
> > An external host can connect to a Mellanox BlueField SoC via an
> > interface called Rshim. The Rshim driver provides boot, console,
> > and networking services over this interface. This commit is
> > the common driver where the other backend (transport) driver will
> > use.
> >
> > Reviewed-by: David Woods <dwoods@mellanox.com>
> > Signed-off-by: Liming Sun <lsun@mellanox.com>
> 
> Hi Liming,
> 
> I've taken a new look at your patch series for drivers/soc/ now,
> thanks for your continued submissions.
> 
> This is again just a set of very high-level comments, but I think we
> should resolve some of the fundamental questions first.
> Incidentally, Vincent Whitchurch has recently posted another
> patch series with a very similar intention, but for other hardware
> and taking a different approach.
> 
> In both cases, the idea is to use virtio based drivers to provide
> services from a host machine into another Linux instance running
> on an embedded system behind a PCIe slot or similar. Your
> Bluefield SoC patches are well written, but are intentionally
> kept specific to a particular use case and tied to one piece
> of hardware. In contrast, Vincent uses the existing code from
> drivers/misc/mic/vop/ that is equally hardware specific, but he
> extends it to be applicable to other hardware as well.
> 
> It would be good if you could look at each other's approaches
> to see where we could take it from here. I think ideally we
> should have a common driver framework for doing the same
> thing across both of your devices and as well as others.

Yes, I checked drivers/misc/mic/vop and Vincent Whitchurch's patches 
(Virtio-over-PCIe on non-MIC) and related comments. I kind of feel 
that besides the common virtio infrastructure, there seems not much
to be reused in the rest of implementation yet, though they are trying
to do the similar things.  (Feel free to correct me if I misunderstood it.)

I just submitted the patch 0/9 to explain some details of the rshim
component and the driver patches. Could you help take a look?

The rshim driver of BlueField SoC has a few more functionalities 
which are very HW-specific. Some needs driver support from both 
ARM target and the external host, some only needs external host 
driver support.

As for common framework, we used to implement the drivers based on
the remote proc (Documentation/remoteproc.txt), which seems more
close to what we wanted (in my humble opinion). Later due to more 
functionalities to add and the lack of remote proc in old kernels, we 
changed to use virtio framework directly, which seems very helpful and
saved quite some driver work.

> 
> That would also resolve my main concern about the drivers,
> which is the placement in drivers/soc/ for a set of drivers
> that are unlike most drivers in that directory not mean for
> running on the SoC itself in order drive unusual functionality
> on the SoC, but are (at least partially) meant for running on
> a host machine to communicate with that SoC over PCIe
> or USB.
> 
> As an example, your network driver should really be placed
> in drivers/net/, though it is unclear to me how it relates
> to the existing virtio_net driver. In the case of mic/vop,
> the idea is to use virtio_net on the device side, but have
> vhost_net or a user space implementation on the host side,
> but that is apparently not what you do here. Can you
> explain why?

Yes, I actually have the same concerns where the host side
drivers should go.  For now ther're just added for code review
purpose. drivers/soc/ seems not a good place. One thought
is to move the rshim_net, rshim_pcie and rshim_pcie_lf backend
driver to drivers/net/ethernet/Mellanox/rshim/ and move the
rshim common driver to drivers/char as it creates the character
devices?

The device side of this patch uses the virtio_net driver as well. 

The host side is not just for networking, which was mentioned 
in the 0/9 patch. The host side driver manages the whole rshim
component and is called the 'rshim' driver. It includes driver
to access the TmFifo, where virtio_net is used to provide 
networking support. It needs to talk to the common
driver then the USB or PCIe backend driver.  It seems to me that
vhost_net doesn't quite fit this model and might make it 
over-complicated.

> 
> Another high-level question I have is on how your various
> drivers relate to one another. This should normally be
> explained in the 0/9 email, but I don't seem to have received
> such a mail. I see that you have multiple back-end drivers
> for the underlying transport, with one of them based on USB.
> Have you come up with a way to use the same high-level
> driver such as the network link over this USB back-end,
> or is this for something else?

Yes, 0/9 has been sent. Sorry I should have provided since beginning.

The USB (or PCIe) provide the general transport to access the RShim
component, for networking, console, register access, boot service,
etc. So it's not just for network link. The implementation seems very
HW specific, such as providing APIs like rshim_usb_read_rshim()
and rshim_usb_write_rshim(). In PCIe backend it has similar APIs
like rshim_pcie_read(), rshim_pcie_write().

Not very clear about what you meant the " the same high-level driver 
such as the network link over this USB back-end". Do you mean using
any existing network over USB framework or provide some mechanism
to be reused by other network over USB driver?

By the way, the 0/9 has been sent. Could you help take a look whether 
it clarifies a little bit or not?

> 
>       Arnd
