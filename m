From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: physmap_of and partitions (mtd concat support)
Date: Wed, 25 Mar 2009 15:14:01 +0100
Message-ID: <200903251514.01817.sr@denx.de>
References: <200903231151.10373.sr@denx.de> <200903251035.28074.sr@denx.de>
	<fa686aa40903250628t1e5e97c0q340746dd78e61c83@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40903250628t1e5e97c0q340746dd78e61c83-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss list <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 25 March 2009, Grant Likely wrote:
> >> This case really does sound like a driver bug and that the existing
> >> cfi-flash binding is sufficient to describe the hardware. =A0IIUC, when
> >> all the flash chips are of the same type the physmap_of driver should
> >> be smart enough to detect each of the flash chips within the reg
> >> range.
> >
> > *When* all are identical then this works, yes. But in the Intel P30 case
> > the 2 chips are not identical. And from my understanding this is not a
> > problem/bug in the physmap_of driver.
>
> To satisfy my own curiosity, why is physmap_of unable to probe
> multiple cfi chips that are non identical?  After detecting the first
> chip it and calculated then end address of it can it not do another
> full cfi probe for the rest of the reg range?

The "real" probing is done in the mtd core (cfi_probe). So it's nothing tha=
t =

could be changed in physmap_of. I have to admit that I didn't fully debug i=
t.

> Regardless, even if it could the solution you have below is probably a
> better idea anyway than relying on probing.
>
> >> If I'm wrong and it cannot do this, then it would be a simple matter
> >> of adding an additional tuple to reg for each discrete chip. =A0A
> >> simple, backwards compatible extension which doesn't require a new
> >> binding.
> >
> > So you are thinking of something like this?
> >
> > =A0 =A0 =A0 =A0flash@f0000000,0 {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#address-cells =3D <1>;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#size-cells =3D <1>;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "cfi-flash";
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0 0x00000000 0x02000000
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0 0x02000000 0x02000000>;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bank-width =3D <2>;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0device-width =3D <2>;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0partition@0 {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label =3D "test-part1";
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0 0x04000000>;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> > =A0 =A0 =A0 =A0};
>
> Yes, this looks good to me.  In fact, it is probably better to be
> explicit about multiple chips anyway in terms of providing the driver
> as much information as possible about where to probe for the chips.
> It also elegantly supports sparsely mapped flash chips (ie. if the
> board supports larger chips than is actually populated).

OK, then we have a solution. Grant, thanks for your input here.

Best regards,
Stefan
