From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: GPIO and Pinmux device tree support for Exynos.
Date: Sat, 13 Aug 2011 23:30:50 +0800
Message-ID: <20110813153049.GE7244@S2100-06.ap.freescale.net>
References: <CAJuYYwRJ5UJ8OeTEDEh1Mk9yhJGVA7he1EzG8yM+pJYQVo6BXQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD9@HQMAIL01.nvidia.com>
	<CAJuYYwSeq4Sjj4LLR49hwfvSGTyTDYLXCTp0ZB2yQt2F4rfHcg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24F1D@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24F1D-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 12, 2011 at 01:07:37PM -0700, Stephen Warren wrote:
> Thomas Abraham wrote at Friday, August 12, 2011 1:06 AM:
> > On 12 August 2011 01:36, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > Thomas Abraham wrote at Thursday, August 11, 2011 12:09 PM:
> > >> I did some work on the gpio and pinmux device tree support for exyno=
s.
> > >> I thought to discuss with you about what was done before proceeding
> > >> further.
> ...
> > >> GPA: gpio-controller@11400000 {
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-gpio-gpa=
0", "samsung,exynos4-gpio";
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #gpio-cells =3D <4>;
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-controller;
> > >> };
> ...
> > >> Device nodes would include the gpio's that it would use (as in below=
 example)
> > >>
> > >> serial@13800000 {
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s5pv310-uart";
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x13800000 0x100>;
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <116>;
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&GPA =A00 =A02 =A00 =A02 =A0 =
/* Tx */
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &GPA =A0=
1 =A02 =A00 =A02>; =A0/* Rx */
> > >> };
> > >
> > > The one problem with this approach is that presumably every single dr=
iver
> > > (e.g. for the serial port above) must look for and handle the gpios
> > > property, whereas presumably a serial port would otherwise have no ne=
ed
> > > to deal with GPIOs.
> > =

> > The pin-mux setting on exynos4 is done in the device driver's probe
> > function. A pointer to a function, which is in the platform code, that
> > sets up the pin-mux for the driver/peripheral is passed in the
> > platform data of the driver. The driver invokes that function during
> > the probe to setup the pinmux. And all drivers adopt this approach.
> > =

> > The advantage of this approach is that the pin-mux are configured at
> > driver probe time and makes it possible to switch the functionality of
> > the pin at runtime if a pin is used by two controllers.
> =

> Does this happen often in practice?

It happens often on boards for evaluation purpose.  But yes, as you
mentioned below, we can leave it to pinctrl API. =


Regards,
Shawn

> It seems like it wouldn't be that
> common due to the HW difficulties of using the same SoC pins for different
> purposes on the same board.
> =

> Once Linus W's proposed pinctrl API is present, that might address this
> situation more directly. I don't recall any detailed discussion about how
> that API would integrate with device tree. That's probably a conversation
> we need to have.
> =
