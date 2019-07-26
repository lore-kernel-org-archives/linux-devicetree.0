Return-Path: <SRS0=dsAE=VX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46150 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfGZF5J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jul 2019 01:57:09 -0400
Received: by mail-ua1-f67.google.com with SMTP id o19so20859497uap.13
        for <devicetree@vger.kernel.org>; Thu, 25 Jul 2019 22:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190304125033.28841-1-josef@lusticky.cz> <20190708145618.26031-1-josef@lusticky.cz>
 <20190708145618.26031-2-josef@lusticky.cz> <20190724195744.GA22947@bogus>
In-Reply-To: <20190724195744.GA22947@bogus>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef@lusticky.cz>
Date: Fri, 26 Jul 2019 07:56:31 +0200
Message-ID: <CAMqqaJFKUfodEf50EuJvCURKS+3pA2mesk4Dt1K-GHZuOh24xA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: panel: Add parallel RGB mode for
 Ilitek ILI9341 panels
Content-Type: multipart/mixed; boundary="00000000000065ce3d058e8f3608"
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, thierry.reding@gmail.com, airlied@linux.ie
List-ID: <devicetree@vger.kernel.org>

--00000000000065ce3d058e8f3608
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rob,
my fault, sorry, backlight should not be required.
I'll fix this in the next patch version.

I'd like to post the DT bindings in the YAML format.
Work-in-progress YAML bindings file is in the attachment,
any comments would be highly appreciated.

Kind regards
Josef

st 24. 7. 2019 v 21:57 odes=C3=ADlatel Rob Herring <robh@kernel.org> napsal=
:
>
> On Mon, Jul 08, 2019 at 04:56:17PM +0200, Josef Lusticky wrote:
> > ILI9341 supports both SPI input mode and parallel RGB input mode.
> > This commit adds parallel RGB input mode bindings.
> >
> > Signed-off-by: Josef Lusticky <josef@lusticky.cz>
> > ---
> >  .../bindings/display/ilitek,ili9341.txt       | 67 ++++++++++++++++---
> >  1 file changed, 56 insertions(+), 11 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9341.t=
xt b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > index 169b32e4ee4e..629f38a1d0cd 100644
> > --- a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > +++ b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > @@ -1,27 +1,72 @@
> >  Ilitek ILI9341 display panels
> >
> > -This binding is for display panels using an Ilitek ILI9341 controller =
in SPI
> > -mode.
> > +This binding is for display panels using an Ilitek ILI9341 controller.
> > +The display panels are supported in the following graphical input mode=
s:
> > +- SPI input mode
> > +     MIPI-DBI Type 3 Option 1 or Option 3 is used to transfer
> > +     commands and graphical data
> > +- parallel RGB input mode
> > +     MIPI-DBI Type 3 Option 1 or Option 3 is used for commands
> > +     MIPI-DPI 18-bit parallel RGB connection is used to transfer
> > +     graphical data
> >
> > -Required properties:
> > -- compatible:        "adafruit,yx240qv29", "ilitek,ili9341"
> > -- dc-gpios:  D/C pin
> > -- reset-gpios:       Reset pin
> > +
> > +SPI input mode:
> >
> >  The node for this driver must be a child node of a SPI controller, hen=
ce
> > -all mandatory properties described in ../spi/spi-bus.txt must be speci=
fied.
> > +all mandatory properties described in spi/spi-bus.txt must be specifie=
d.
> > +
> > +Required properties in SPI input mode:
> > +- compatible:   "adafruit,yx240qv29", "ilitek,ili9341"
> > +- backlight:    phandle of the backlight device attached to the panel
>
> Why is backlight now required?
>
> > +
> > +Optional properties in SPI input mode:
> > +- rotation:     panel rotation in degrees counter clockwise (0,90,180,=
270)
> > +- dc-gpios:     GPIO spec for the D/C pin, see gpio/gpio.txt
> > +- reset-gpios:  GPIO spec for the reset pin, see gpio/gpio.txt
> > +
> > +
> > +Parallel RGB input mode:
> > +
> > +The node for this driver must be a child node of a SPI controller, hen=
ce
> > +all mandatory properties described in spi/spi-bus.txt must be specifie=
d.
> > +
> > +Required properties in parallel RGB input mode:
> > +- compatible:   "displaytech,dt024ctft", "ilitek,ili9341"
> > +- backlight:    phandle of the backlight device attached to the panel
> > +
> > +Optional properties in parallel RGB input mode:
> > +- dc-gpios:     GPIO spec for the D/C pin, see gpio/gpio.txt
> > +- reset-gpios:  GPIO spec for the reset pin, see gpio/gpio.txt
> >
> > -Optional properties:
> > -- rotation:  panel rotation in degrees counter clockwise (0,90,180,270=
)
> > -- backlight: phandle of the backlight device attached to the panel
> > +In parallel RGB input mode,
> > +the device node can contain one 'port' child node with one child
> > +'endpoint' node, according to the bindings defined in
> > +media/video-interfaces.txt. This node should describe panel's video bu=
s.
> >
> > -Example:
> > +
> > +Example in SPI input mode:
> >       display@0{
> >               compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> >               reg =3D <0>;
> >               spi-max-frequency =3D <32000000>;
> >               dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> >               reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> > +             backlight =3D <&backlight>;
> >               rotation =3D <270>;
> > +     };
> > +
> > +Example in parallel RGB input mode:
> > +     panel@{
> > +             compatible =3D "displaytech,dt024ctft", "ilitek,ili9341";
> > +             reg =3D <0>;
> > +             spi-max-frequency =3D <32000000>;
> > +             dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> > +             reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> >               backlight =3D <&backlight>;
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint =3D <&display_out>;
> > +                     };
> > +             };
> >       };
> > --
> > 2.20.1
> >

--00000000000065ce3d058e8f3608
Content-Type: text/plain; charset="US-ASCII"; name="ilitek,ili9341.txt"
Content-Disposition: attachment; filename="ilitek,ili9341.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jyjou8by0>
X-Attachment-Id: f_jyjou8by0

IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAolWUFNTCAxLjIKLS0tCiRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9pbGl0ZWssaWxpOTM0MS55
YW1sIwokc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKCnRpdGxlOiBJbGl0ZWsgSUxJOTM0MSBkaXNwbGF5IHBhbmVscwoKbWFpbnRhaW5lcnM6CiAg
LSBKb3NlZiBMdXN0aWNreSA8am9zZWZAbHVzdGlja3kuY3o+CgpkZXNjcmlwdGlvbjogfAogIFRo
aXMgYmluZGluZyBpcyBmb3IgZGlzcGxheSBwYW5lbHMgdXNpbmcgYW4gSWxpdGVrIElMSTkzNDEg
Y29udHJvbGxlci4KICBUaGUgZGlzcGxheSBwYW5lbHMgYXJlIHN1cHBvcnRlZCBpbiB0aGUgZm9s
bG93aW5nIGdyYXBoaWNhbCBpbnB1dCBtb2RlczoKICBTUEkgaW5wdXQgbW9kZQogICAgTUlQSS1E
QkkgVHlwZSAzIE9wdGlvbiAxIG9yIE9wdGlvbiAzIGlzIHVzZWQgdG8gdHJhbnNmZXIKICAgIGNv
bW1hbmRzIGFuZCBncmFwaGljYWwgZGF0YQogIFBhcmFsbGVsIFJHQiBpbnB1dCBtb2RlCiAgICBN
SVBJLURCSSBUeXBlIDMgT3B0aW9uIDEgb3IgT3B0aW9uIDMgaXMgdXNlZCBmb3IgY29tbWFuZHMK
ICAgIE1JUEktRFBJIDE4LWJpdCBwYXJhbGxlbCBSR0IgY29ubmVjdGlvbiBpcyB1c2VkIHRvIHRy
YW5zZmVyCiAgICBncmFwaGljYWwgZGF0YQoKYWxsT2Y6CiAgLSAkcmVmOiAvc2NoZW1hcy9zcGkv
c3BpLWNvbnRyb2xsZXIueWFtbCMKCnByb3BlcnRpZXM6CiAgY29tcGF0aWJsZToKICAgIGl0ZW1z
OgogICAgICAtIGNvbnN0OiBhZGFmcnVpdCx5eDI0MHF2MjkKCiAgYmFja2xpZ2h0OiB0cnVlCiAg
cmVzZXQtZ3Bpb3M6IHRydWUKICBkYy1ncGlvczogdHJ1ZQogIHJvdGF0aW9uOiB0cnVlCiAgcG9y
dDogdHJ1ZQoKYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCgpyZXF1aXJlZDoKICAtIGNvbXBh
dGlibGUKICAtIGJhY2tsaWdodAoKRXhhbXBsZSBpbiBTUEkgaW5wdXQgbW9kZToKCWRpc3BsYXlA
MHsKCQljb21wYXRpYmxlID0gImFkYWZydWl0LHl4MjQwcXYyOSIsICJpbGl0ZWssaWxpOTM0MSI7
CgkJcmVnID0gPDA+OwoJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDMyMDAwMDAwPjsKCQlkYy1ncGlv
cyA9IDwmZ3BpbzAgOSBHUElPX0FDVElWRV9ISUdIPjsKCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzAg
OCBHUElPX0FDVElWRV9ISUdIPjsKCQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CgkJcm90YXRp
b24gPSA8MjcwPjsKCX07CgpFeGFtcGxlIGluIHBhcmFsbGVsIFJHQiBpbnB1dCBtb2RlOgoJcGFu
ZWxAewoJCWNvbXBhdGlibGUgPSAiZGlzcGxheXRlY2gsZHQwMjRjdGZ0IiwgImlsaXRlayxpbGk5
MzQxIjsKCQlyZWcgPSA8MD47CgkJc3BpLW1heC1mcmVxdWVuY3kgPSA8MzIwMDAwMDA+OwoJCWRj
LWdwaW9zID0gPCZncGlvMCA5IEdQSU9fQUNUSVZFX0hJR0g+OwoJCXJlc2V0LWdwaW9zID0gPCZn
cGlvMCA4IEdQSU9fQUNUSVZFX0hJR0g+OwoJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKCQlw
b3J0IHsKCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZGlz
cGxheV9vdXQ+OwoJCQl9OwoJCX07Cgl9Owo=
--00000000000065ce3d058e8f3608--
