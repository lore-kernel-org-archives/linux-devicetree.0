From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 4/7] tty: serial: support device tree in pxa
Date: Tue, 19 Jul 2011 21:05:15 +0100
Message-ID: <20110719200515.GB308@n2100.arm.linux.org.uk>
References: <20110719194010.GI6848@ponder.secretlab.ca>
	<1945834.hht9tUJ6C2@wuerfel>
	<CACxGe6u1Pq990opdt7irttuY1OvpZVNXSM11cLdqo5zN8YpYeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6u1Pq990opdt7irttuY1OvpZVNXSM11cLdqo5zN8YpYeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 19, 2011 at 01:53:53PM -0600, Grant Likely wrote:
> On Tue, Jul 19, 2011 at 1:48 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Tuesday 19 July 2011 13:40:10 Grant Likely wrote:
> >> On Tue, Jul 19, 2011 at 10:24:47AM +0800, Haojian Zhuang wrote:
> >> > Support both normal platform driver and device tree driver in serial=
 pxa.
> >> >
> >> > Signed-off-by: Haojian Zhuang <haojian.zhuang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> >> > ---
> >> > =A0drivers/tty/serial/Kconfig =A0 =A0 | =A0 =A04 +-
> >> > =A0drivers/tty/serial/of_serial.c | =A0 12 +++++
> >> > =A0drivers/tty/serial/pxa.c =A0 =A0 =A0 | =A0 93 +++++++++++++++++++=
+++++++++++++++++++-
> >> > =A0include/linux/serial_pxa.h =A0 =A0 | =A0 17 +++++++
> >> > =A04 files changed, 122 insertions(+), 4 deletions(-)
> >> > =A0create mode 100644 include/linux/serial_pxa.h
> >> >
> >>
> >> serial_pxa is already a platform_driver. =A0Instead of modifying
> >> of_serial, an of_match_table should be added to this driver and it
> >> should decode the DT data inside the existing probe hook.
> >>
> >> No need to create all of this extra infrastructure.
> >
> > Right. We should probably rename of_serial to 8250_of and remove the qp=
ace
> > parts from the driver.
> =

> In fact, I think we've got about 3 devtree drivers for 8250 serial
> ports.  I think it is about time for some consolidation work.  :-)
> =

> I wonder if we can roll of_serial directly into the 8250.c driver.

The original serial.c got split into 8250.c, plus several probe modules
(8250_pnp.c, 8250_pci.c, etc) to get around the problem of lots of
bus specific crap appearing in the main driver.  8250_of.c would follow
on that theme.
