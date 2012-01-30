From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: Re: [FOR 3.4 PATCH 5/6] atmel/nand: add DT support
Date: Mon, 30 Jan 2012 06:56:31 +0100
Message-ID: <20120130055631.GG705@game.jcrosoft.org>
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1327727444-23908-5-git-send-email-plagnioj@jcrosoft.com>
 <CAPnjgZ0uTwFwaK2Dxdna7p6zrj9OZdV=CxT1eGsT+M5Aa+SJNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPnjgZ0uTwFwaK2Dxdna7p6zrj9OZdV=CxT1eGsT+M5Aa+SJNA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10:31 Sun 29 Jan     , Simon Glass wrote:
> Hi,
> =

> On Fri, Jan 27, 2012 at 9:10 PM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> > use a local copy of board informatin and fill with DT data
> >
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> > Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> > Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> > Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > ---
> > =A0.../devicetree/bindings/mtd/atmel-nand.txt =A0 =A0 =A0 =A0 | =A0 41 =
++++++++
> > =A0drivers/mtd/nand/atmel_nand.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0107 ++++++++++++++++----
> > =A02 files changed, 130 insertions(+), 18 deletions(-)
> > =A0create mode 100644 Documentation/devicetree/bindings/mtd/atmel-nand.=
txt
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Doc=
umentation/devicetree/bindings/mtd/atmel-nand.txt
> > new file mode 100644
> > index 0000000..a910ab9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > @@ -0,0 +1,41 @@
> > +Atmel NAND flash
> > +
> > +Required properties:
> > +- compatible : "atmel,at91rm9200-nand".
> > +- reg : should specify localbus address and size used for the chip,
> > + =A0 =A0 =A0 and if availlable the ECC.
> > +- atmel,nand-addr-offset : offset for the address latch.
> > +- atmel,nand-cmd-offset : offset for the command latch.
> > +- #address-cells, #size-cells : Must be present if the device has sub-=
nodes
> > + =A0representing partitions.
> > +
> > +- gpios : specifies the gpio pins to control the NAND device. detect i=
s an
> > + =A0optional gpio and may be set to 0 if not present.
> =

> What does this mean please? What is 'detect' and what 'control' do the
> gpios provide?
> =

> Below you have two GPIOs pioC 13 and pioC 14. I think the binding
> should document the two GPIOs, the order, and what they are for.
no as it's said in the binding the detect pin is optional
> =

> > +
> > +Optional properties:
> > +- nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by=
 default.
> > + =A0Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob=
_first",
> > + =A0"soft_bch".
> > +- nand-bus-width : 8 or 16 bus width if not present 8
> > +- nand-on-flash-bbt: boolean to enable on flash bbt option if not pres=
ent false
> > +
> > +Examples:
> > +nand0: nand@40000000,0 {
> > + =A0 =A0 =A0 compatible =3D "atmel,at91rm9200-nand";
> > + =A0 =A0 =A0 #address-cells =3D <1>;
> > + =A0 =A0 =A0 #size-cells =3D <1>;
> > + =A0 =A0 =A0 reg =3D <0x40000000 0x10000000
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A00xffffe800 0x200
> > + =A0 =A0 =A0 =A0 =A0 =A0 >;
> > + =A0 =A0 =A0 atmel,nand-addr-offset =3D <21>;
> > + =A0 =A0 =A0 atmel,nand-cmd-offset =3D <22>;
> > + =A0 =A0 =A0 nand-on-flash-bbt =3D <1>;
> > + =A0 =A0 =A0 nand-ecc-mode =3D "soft";
> > + =A0 =A0 =A0 gpios =3D <&pioC 13 0
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&pioC 14 0
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00
> =

> Sorry, I haven't seen this before, perhaps it is a standard thing in
> Linux. Does 0 mean end of list? Can we not just use the property's
> size value for this?
0 means not used as specified in the DT

Best Regards,
J.
