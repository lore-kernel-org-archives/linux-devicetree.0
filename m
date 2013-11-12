From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/4] DT: Add binding for Altera FPGAs in passive-serial
 mode
Date: Tue, 12 Nov 2013 23:02:27 +0100
Message-ID: <20131112220227.GO24559@pengutronix.de>
References: <1384266701-12608-1-git-send-email-s.hauer@pengutronix.de>
 <1384266701-12608-4-git-send-email-s.hauer@pengutronix.de>
 <C90E2E36-D168-4374-B420-38B2BB1914BD@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <C90E2E36-D168-4374-B420-38B2BB1914BD-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 10:21:02AM -0600, Kumar Gala wrote:
>=20
> On Nov 12, 2013, at 8:31 AM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wr=
ote:
>=20
> > Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > ---
> > .../devicetree/bindings/firmware/altr,passive-serial.txt    | 13 ++=
+++++++++++
> > 1 file changed, 13 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/firmware/altr,=
passive-serial.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/firmware/altr,passiv=
e-serial.txt b/Documentation/devicetree/bindings/firmware/altr,passive-=
serial.txt
> > new file mode 100644
> > index 0000000..6d40c91
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/altr,passive-seria=
l.txt
> > @@ -0,0 +1,13 @@
> > +Altera FPGAs in passive serial mode
> > +-----------------------------------
> > +
> > +This binding defines the control interface to Altera FPGAs in
> > +passive serial mode. This is used to upload the firmware and
> > +to start the FPGA.
> > +
> > +Required properties:
> > +- compatible: shall be "altr,passive-serial=E2=80=9D
>=20
> This doesn=E2=80=99t seem quite descriptive enough, easy to confuse w=
ith a serial port.

How about altr,fpga-passive-serial? Other suggestions?

>=20
> > +- reg: SPI chip select
>=20
> Is this a SPI device than?

Yes, it is.

Sascha


--=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
