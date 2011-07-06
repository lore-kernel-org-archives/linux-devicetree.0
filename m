From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: CSR: Adding CSR SiRFprimaII board support
Date: Wed, 6 Jul 2011 00:28:38 -0600
Message-ID: <20110706062838.GI9978@ponder.secretlab.ca>
References: <1309231954-23260-1-git-send-email-bs14@csr.com>
	<201106292329.44447.arnd@arndb.de>
	<BANLkTinfKCMcutMDQ+mpdD4EUy9mCpZs+w@mail.gmail.com>
	<201106301236.25822.arnd@arndb.de>
	<BANLkTikoMu3ccUxj5KRmKzdReQcBqK4Y9Q@mail.gmail.com>
	<CAGsJ_4wSKP6EUihOVbUJJ+HUynWGp8PA=8J_WhgmOtVhpd5_Lg@mail.gmail.com>
	<20110706053026.GB9978@ponder.secretlab.ca>
	<CAGsJ_4xV7ecdqnB5gJDUDSg4nvebgubBj4qGJGaCtcpbj-b0gQ@mail.gmail.com>
	<CAGsJ_4yxUzMr4EJd5i0oW1tOa2oK7jicAehKVXXiU_SMDpTQ0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGsJ_4yxUzMr4EJd5i0oW1tOa2oK7jicAehKVXXiU_SMDpTQ0Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, workgroup.linux-kQvG35nSl+M@public.gmane.org, weizeng.he-kQvG35nSl+M@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 06, 2011 at 02:01:24PM +0800, Barry Song wrote:
> 2011/7/6 Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > 2011/7/6 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>:
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 intc: interrupt-controlle=
r@0x80020000 {
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 #interrup=
t-cells =3D <1>;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupt=
-controller;
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatibl=
e =3D "sirf,intc", "sirf,prima2-intc";
> >>
> >> This looks backwards. =A0Most specific values should appear first.
> >> "sirf,intc" looks to be generic when compared to "sirf,prima2-intc".
> >> I'm also concerned that "sirf,intc" is trying to be too generic. =A0As
> >> much as possible compatible values should reflect a real
> >> implementation of the interface, not a generic abstract name. =A0Future
> >> hardware can always claim compatibility with existing older hardware.
> >> You're probably better off dropping "sirf,intc" entirely, and doing
> >> the same for similar properties throughout the file.
> >
> > i have been confused by compatible in dts and drivers for some time.
> > if an intc ip core is shared by two chips, for example, prima2 and
> > atlas6. is the following right?
> >
> > in dts for prima2: compatible =3D "sirf,prima2-intc";
> > in dts for atlas6: =A0compatible =3D "sirf,prima2-atlas6";
> =

> sorry for typo. in dts for atlas6:  compatible =3D "sirf,atlas6-intc";
> =

> > in intc drivers shared for both: =A0 =A0 compatible =3D "sirf,prima2-in=
tc",
> > "sirf,prima2-atlas6";
> =

> sorry for typo.  compatible =3D "sirf,prima2-intc", "sirf,atlas6-intc";
> =


Yes, that is one way to do it, just specify all the implementations
using the IP core.  If there are only a few, then this is easy.  If
there are a lot of implementations using the same core, then the list
gets rather large in a hurry.

The intent of compatible is to allow one device to claim compatibility
with another.  So, if the prima2 was already supported, and you were adding
atlas6 support, you could put the following into the atlas6 .dts:

	compatible =3D "sirf,atlas6-intc", "airf,prima2-intc";

and the existing driver would work.

The other option when working with IP cores it so encode the version
of the IP block into the compatible values, and make both boards use
that.  ie.  "sirf,intc-1.32".  *however* doing so requires that the
hardware folks actually do a good job of documenting the core versions
so that the compatible value you use accurately describes the
hardware.

It is also completely valid for a newer IP core to claim compatibility
with an older one in the .dts:

	ie: compatible =3D "sirf,intc-1.32", "sirf,intc-1.00";

Personally, I prefer anchoring compatible values to the specific
hardware implmentation rather than the IP core version.

> >
> > in my understanding, dts for special soc/board contains special
> > compatible for the chip, drivers shared by multi-soc/board contain all
> > compatible lists which can be supported by them?
> >
> > what's the generic way for this?
> >
> >>
> >> Also, for every new compatible value make sure you add documentation
> >> for it to Documentation/devicetree/bindings. (You may have already
> >> done so, it's just something I remind people about a lot).
> >>
> >> These comments also apply through the rest of the file.
> >>
> >>
> >
