From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v3 2/2] powerpc/mpc5121: add initial support for
	PDM360NG  board
Date: Tue, 27 Jul 2010 19:28:56 +0200
Message-ID: <20100727192856.63edc8e0@wker>
References: <1272882222-12253-1-git-send-email-agust@denx.de>
	<1279892973-24110-1-git-send-email-agust@denx.de>
	<AANLkTi=Ee6HR+Ux0g4V1+81DXUmsO=UDhi6jWsDgGchv@mail.gmail.com>
	<20100727123647.0a3b8832@wker>
	<AANLkTika=KeKcaY_FF8tN5Fy-H+cozjZsGObXoQhKiVh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <AANLkTika=KeKcaY_FF8tN5Fy-H+cozjZsGObXoQhKiVh-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Markus Fischer <markus.fischer.ec-Jj5Fu8i2Z9Q@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michael Weiss <michael.weiss-Jj5Fu8i2Z9Q@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Wolfgang Grandegger <wg-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 27 Jul 2010 10:58:33 -0600
Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
...
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 spi@11900 {
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "fsl,mp=
c5121-psc-spi", "fsl,mpc5121-psc";
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cell-index =3D <9>;
> >>
> >> Try to drop the cell-index properties. =A0They are almost always misus=
ed.
> >
> > Removing cell-index would require changing the spi driver's probe.
> > Currently cell-index is used to set spi bus number. What could be used
> > for bus enumeration instead? Is it okay to use part of the spi node
> > address? e.g. obtaining the offset 0x11900, masking out the unrelated
> > bits and shifting by 8 would deliver unique index 9 for PSC9 in SPI
> > mode. This would work for all 12 PSC SPI controllers of mpc5121.
> =

> Does the spi bus number really matter?  The device tree context gives
> you a firm association between spi masters and devices which doesn't
> require assigning a specific bus number.  The core spi code can
> dynamically assign a bus number for the bus by setting bus_num to -1.

The bus number is used in the mpc5121 psc spi driver to obtain correct
clock for PSC in question (0 to 11) and to enable the PSC clock at probe
time. Therefore using dynamically assigned bus number would require another
change to the spi driver.

...
> > This requires fixing the mpc5121 psc spi driver to create spi child
> > nodes of the spi master node. I have already send the appropriate
> > patch to spi-devel list, but it is not the right approach to call
> > of_register_spi_devices() in each driver.
> =

> It's not wrong; but it isn't ideal either.
> =

> > Do you plan to fix it in
> > core spi code in v2.6.36?
> =

> Apparently I no longer have to because you've gone ahead and done it
> for me anyway.  :-)  I'll take a look at that patch and send you my
> comments.

Okay, thanks,
Anatolij
