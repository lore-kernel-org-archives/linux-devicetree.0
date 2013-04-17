From: Ryan Bryngelson <rabryn-LE7aEde8ry8CpIvVfb7cogC/G2K4zDHf@public.gmane.org>
Subject: iMX28 SDIO WiFi Device With External IRQ
Date: Tue, 16 Apr 2013 21:59:30 -0500
Message-ID: <CAGUvELfPs2Ce=_tws6CjMp2VRBKeOW+Xq60hZ17YzQEvsLjS1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2562842808906310364=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2562842808906310364==
Content-Type: multipart/alternative; boundary=f46d042de925becc6804da85acb8

--f46d042de925becc6804da85acb8
Content-Type: text/plain; charset=ISO-8859-1

I've connected a wlan device to an imx28-evk via a 4 bit wide MMC interface
using SSP1.  I've compiled support into the kernel for the device and it is
recognized upon insertion, however, the driver requires an external
interrupt line to be connected from the wlan device to the imx28.  I've
attempted to configure a GPIO line to interrupt on high to low edges using
the device tree by defining a node like this...

            ssp1: ssp@80012000 {
                compatible = "fsl,imx28-mmc";
                pinctrl-names = "default";
                pinctrl-0 = <&mmc1_4bit_pins_a
                    &mmc1_cd_cfg &mmc1_sck_cfg>;
                bus-width = <4>;
                wp-gpios = <&gpio0 28 0>;
                vmmc-supply = <&reg_vddio_sd1>;
                status = "okay";

                wlan-irq
                {
                    compatible = "fsl,imx28-gpio";
                    interrupt-parent = <&gpio0>;
                    interrupts = <4 0x02>;
                };
            };

Is this even close to being correct?  I understand I need to modify
arch/arm/mach-mxs/mach-mxs.c to provide the IRQ to the wlan platform
data... but I'm confused as to how I get the IRQ number that is *hopefully*
setup by the device tree node?

I'm just looking for some direction, if anyone has any advice it would be
greatly appreciated!  The linux-arm-kernel mailing list wasn't too much
help... nor Freescale support.

Thanks,
Ryan

--f46d042de925becc6804da85acb8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve connected a wlan device to an imx28-evk via a 4 b=
it wide MMC interface using SSP1. =A0I&#39;ve compiled support into the ker=
nel for the device and it is recognized upon insertion, however, the driver=
 requires an external interrupt line to be connected from the wlan device t=
o the imx28. =A0I&#39;ve attempted to configure a GPIO line to interrupt on=
 high to low edges using the device tree by defining a node like this...<br=
>
<br>=A0 =A0 =A0 =A0 =A0 =A0 ssp1: ssp@80012000 {<br>=A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 compatible =3D &quot;fsl,imx28-mmc&quot;;<br>=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 pinctrl-names =3D &quot;default&quot;;<br>=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 pinctrl-0 =3D &lt;&amp;mmc1_4bit_pins_a<br>=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 &amp;mmc1_cd_cfg &amp;mmc1_sck_cfg&gt;;<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bus-width =3D &lt;4&gt;;<br>=A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 wp-gpios =3D &lt;&amp;gpio0 28 0&gt;;<br>=A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 vmmc-supply =3D &lt;&amp;reg_vddio_sd1&gt;;<br>=A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 status =3D &quot;okay&quot;;<br><br>=A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 wlan-irq<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 {<br>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 compatible =3D &quot;fsl,imx28-gpio&quot;;<br>=A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 interrupt-parent =3D &lt;&amp;gpio0&gt;;<br>=A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;4 0x02&gt;;<br>=A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 };<br>
=A0 =A0 =A0 =A0 =A0 =A0 };<br><div><br></div><div style>Is this even close =
to being correct? =A0I understand I need to modify arch/arm/mach-mxs/mach-m=
xs.c to provide the IRQ to the wlan platform data... but I&#39;m confused a=
s to how I get the IRQ number that is *hopefully* setup by the device tree =
node?</div>
<div style><br></div><div style>I&#39;m just looking for some direction, if=
 anyone has any advice it would be greatly=A0appreciated! =A0The linux-arm-=
kernel mailing list wasn&#39;t too much help... nor Freescale support.</div=
>
<div style><br></div><div style>Thanks,</div><div style>Ryan</div></div>

--f46d042de925becc6804da85acb8--

--===============2562842808906310364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2562842808906310364==--
