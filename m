From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Gpio reset handling
Date: Tue, 15 Sep 2009 16:27:04 -0600
Message-ID: <fa686aa40909151527r36334528ne1194523f141a8a2@mail.gmail.com>
References: <4AAFDDD1.9070702@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4AAFDDD1.9070702-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2009 at 12:32 PM, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org> wrote:
> Hi All,
>
> I would like to find out proper way how to handle xilinx reset gpio.
> We are using gpio for soft reset.
[...]
> Ok and here about description of reset port
> I see two option to write new trigger
> 1. new reset trigger and add it to gpio-leds node - but this should be in=
 gpio-leds node which make
> no sense to me
>
> =A0 =A0 =A0 =A0reset {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label =3D "Heartbeat";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpios =3D <&gpio_res 3 1>;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linux,default-trigger =3D "reset";
> =A0 =A0 =A0 =A0}

This looks like an abuse of the LED infrastructure.

> 2. create own reset node
>
> reset {
> =A0 =A0 =A0 =A0compatible =3D "gpio-reset";
> =A0 =A0 =A0 =A0reset0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label "Soft reset";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpios =3D <&gpio_res 1 1>;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0reset1 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label "Phy reset";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0gpios =3D <&gpio_res 2 1>;
> =A0 =A0 =A0 =A0}
> }
>
> For this node there should be better reset description not just label wit=
h different description.
> I expect that it will be useful soft and hard reset and maybe you can fin=
d some others.

It sounds like what you are doing is very board specific.  It is
probably premature to design a 'generic' binding for something that
may very well not turn out to be very generic at all.  What I'd do is
create yourself a node for holding board specific properties (like the
binding to the gpio reset line) and parse that data from your board
specific setup code.  I suppose you could also do it from an
of_platform driver, but like irq controllers, it probably doesn't make
a lot of sense to.

So, something like this perhaps:

    machine {
        compatible =3D "<vendor>,<board>-machine";
        soft-reset-gpio =3D <&gpio_res 1 1>;
        phy-reset-gpio =3D <&gpio_res 2 1>;
    };

I don't much like the node name "machine", but I can't think of
anything better at the moment.

Note, this suggestion uses "soft-reset-gpio" and "phy-reset-gpio"
properties instead of the currently documented "gpios" property.  This
usage isn't supported by the current gpio support code, but that code
can be modified, and I think this approach is clearer (as long as the
expected usage of "<vendor>,<board>-machine" is documented.

Cheers,
g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
