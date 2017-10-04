From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 2/2] arm: AT91: fix DT duplicate node name
Date: Wed, 4 Oct 2017 23:20:34 +0200
Message-ID: <20171004212034.6znvbdfe2wbd7uvh@qmqm.qmqm.pl>
References: <cover.1504037038.git.mirq-linux@rere.qmqm.pl>
 <910fee2eb99b2d95e59fa6b997645b498f167022.1504037038.git.mirq-linux@rere.qmqm.pl>
 <e5868359-8708-3d17-df8c-b04ad3624df0@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <e5868359-8708-3d17-df8c-b04ad3624df0@microchip.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 14, 2017 at 06:53:30PM +0200, Nicolas Ferre wrote:
> On 29/08/2017 at 22:08, Micha=B3 Miros=B3aw wrote:
> > Fix following warning at bootup:
> > =

> > device-tree: Duplicate name in fb@0x00500000, renamed to "display#1"
> > =

> > Signed-off-by: Micha=B3 Miros=B3aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  arch/arm/boot/dts/at91sam9m10g45ek.dts | 48 +++++++++++++++++---------=
--------
> >  1 file changed, 24 insertions(+), 24 deletions(-)
> > =

> > diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts=
/at91sam9m10g45ek.dts
> > index 9cf1f5163fbd..272af5867403 100644
> > --- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
> > +++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
> > @@ -223,30 +223,6 @@
> >  		fb0: fb@0x00500000 {
> >  			display =3D <&display0>;
> >  			status =3D "okay";
> > -
> > -			display0: display {
> =

> Micha=B3, thanks for your patch.
> =

> Actually the DT binding requires this:
> Documentation/devicetree/bindings/video/atmel,lcdc.txt
> =

> So it's somehow a bigger issue.
> Moreover, several boards have exactly the same arrangement than the
> at91sam9m10g45ek, so you probably need to modify them all at the same tim=
e.
> =

> After a brief look at drivers/video/fbdev/atmel_lcdfb.c it seems that
> the name of the node is not so much important, so we can modify it
> (something like display0: lcd-display {}) .
> =

> I suggest that you modify the binding, the board files affected and
> re-submit a patch.

It looks like the binding documentation is wrong. The driver code does

	of_parse_phandle(np, "display", 0);

so it expects a phandle, not a node.

Best Regards,
Micha=B3 Miros=B3aw
