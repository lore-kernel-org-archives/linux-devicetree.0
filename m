From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH v6 5/9] soc: mellanox: host: Add the common host side
 Rshim driver
Date: Tue, 22 Jan 2019 13:20:24 +0100
Message-ID: <20190122122022.ipn3jdfnxthhphrs@axis.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
 <1541089538-175682-1-git-send-email-lsun@mellanox.com>
 <1541089538-175682-5-git-send-email-lsun@mellanox.com>
 <CAK8P3a2NRbEaS_EJNtBaZ3GCUtRiH2rUDRzJFjvcw2ZacZM1qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a2NRbEaS_EJNtBaZ3GCUtRiH2rUDRzJFjvcw2ZacZM1qw@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>, David Woods <dwoods@mellanox.com>, linux-pci <linux-pci@vger.kernel.org>, Liming Sun <lsun@mellanox.com>, virtualization@lists.linux-foundation.org, arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, linux-ntb@googlegroups.com, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 18, 2019 at 05:02:21PM +0100, Arnd Bergmann wrote:
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

As far as I can see the biggest difference is that Rshim appears to
support interfaces which do not have shared memory between the host and
the card, which means that it has to jump through a lot more hoops to
make virtio work.

For example, the card side seems to use normal virtio-net and
virto-console drivers, but the drivers/soc/mellanox/tmfifo.c driver,
also running on the card, appears to have to actually look inside the
virtqueues and shuffle the data over the TmFifo interface, and this
driver has hard-coded support for only network and console, since it
apparently needs to know the details of how the virtio drivers use their
virtqueues (see tmfifo_virtio_rxtx()).

And the host side appears to _also_ run the virtio-net driver and there
the drivers/soc/mellanox/host/rshim_net.c code instead has to look
inside the virtqueues and shuffle the data over the other side of the
TmFifo interface.

So to me this looks very different from a traditional virtio
driver/device setup (which is what mic/vop uses).  I may be missing
something, but I don't quite understand why it's even using virtio in
the first place.
