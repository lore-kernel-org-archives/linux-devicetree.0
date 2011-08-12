From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: GPIO and Pinmux device tree support for Exynos.
Date: Fri, 12 Aug 2011 13:07:37 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA24F1D@HQMAIL01.nvidia.com>
References: <CAJuYYwRJ5UJ8OeTEDEh1Mk9yhJGVA7he1EzG8yM+pJYQVo6BXQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA24CD9@HQMAIL01.nvidia.com>
	<CAJuYYwSeq4Sjj4LLR49hwfvSGTyTDYLXCTp0ZB2yQt2F4rfHcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAJuYYwSeq4Sjj4LLR49hwfvSGTyTDYLXCTp0ZB2yQt2F4rfHcg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thomas Abraham wrote at Friday, August 12, 2011 1:06 AM:
> On 12 August 2011 01:36, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Thomas Abraham wrote at Thursday, August 11, 2011 12:09 PM:
> >> I did some work on the gpio and pinmux device tree support for exynos.
> >> I thought to discuss with you about what was done before proceeding
> >> further.
...
> >> GPA: gpio-controller@11400000 {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,exynos4-gpio-gpa0"=
, "samsung,exynos4-gpio";
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 #gpio-cells =3D <4>;
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpio-controller;
> >> };
...
> >> Device nodes would include the gpio's that it would use (as in below e=
xample)
> >>
> >> serial@13800000 {
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s5pv310-uart";
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x13800000 0x100>;
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <116>;
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpios =3D <&GPA =A00 =A02 =A00 =A02 =A0 /*=
 Tx */
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &GPA =A01 =
=A02 =A00 =A02>; =A0/* Rx */
> >> };
> >
> > The one problem with this approach is that presumably every single driv=
er
> > (e.g. for the serial port above) must look for and handle the gpios
> > property, whereas presumably a serial port would otherwise have no need
> > to deal with GPIOs.
> =

> The pin-mux setting on exynos4 is done in the device driver's probe
> function. A pointer to a function, which is in the platform code, that
> sets up the pin-mux for the driver/peripheral is passed in the
> platform data of the driver. The driver invokes that function during
> the probe to setup the pinmux. And all drivers adopt this approach.
> =

> The advantage of this approach is that the pin-mux are configured at
> driver probe time and makes it possible to switch the functionality of
> the pin at runtime if a pin is used by two controllers.

Does this happen often in practice? It seems like it wouldn't be that
common due to the HW difficulties of using the same SoC pins for different
purposes on the same board.

Once Linus W's proposed pinctrl API is present, that might address this
situation more directly. I don't recall any detailed discussion about how
that API would integrate with device tree. That's probably a conversation
we need to have.

> I intend to
> retain this feature even when driver uses dt (no more function pointer
> from platform data). So, as you said, every driver will require a
> change to get a list of gpio's it uses and request them.
> =

> > That's probably quite a bit of work. Also, what if some pins need to be
> > configured for which there is no driver to parse that property?
> =

> Is there any particular example for this? Will there not be a node in
> dt node for such a case. If there is a node in dt which includes a
> gpio property, it should be possible to use this approach.

I don't have any examples. It may well be a tenuous benefit. I suppose
that if any such usage did come up, we could always invent an appropriate
driver for the HW module that was being driven out on those pins, and
add the associated DT node to instantiate it.

> > I just recently started working on this for Tegra, and in
> > http://www.spinics.net/lists/arm-kernel/msg136138.html
> > I proposed listing all the GPIO/pinmux settings directly within the GPIO
> > and pinmux nodes, thus making only the GPIO and pinmux drivers responsi=
ble
> > for parsing them. What do you think of that idea?
> =

> I read through your email. Your approach effortlessly integrates with
> the existing Tegra gpio and pinmux code but similar approach would be
> difficult for exynos.
> =

> And for exynos, the gpio and pin-mux registers are all part of a
> single register set. For instance, pin-mux function 0 and 1 when
> selected, configures the gpio as a input line and output line
> respectively. Function 2 to 15 select various other pin function
> modes. So it would be difficult to use your approach for exynos.

The idea behind my proposal in that thread was that each GPIO and/or
pinmux controller would define its own custom binding as appropriate
for the hardware.

Tegra has separate GPIO and pinmux controllers, and hence has two device
tree nodes to represent them.

For Exynos, given your description, I assume you'd describe the pin
muxing purely within the pinmux DT node, including "GPIO" as a mux/function
option just like any other, since that's how the HW works.

It might also be possible to create a unified DT binding for pin-muxing
driven by Linus W's pinctrl API. However, that binding would stray towards
being tied to SW (the pinctrl API) rather than pure HW, which a per-SoC
custom binding would represent.

-- =

nvpublic
