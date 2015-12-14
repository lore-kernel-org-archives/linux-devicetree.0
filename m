From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] extcon: arizona: Update device tree binding for mic
 detect configurations
Date: Mon, 14 Dec 2015 09:18:50 +0000
Message-ID: <20151214091850.GS6058@localhost.localdomain>
References: <1449767299-29691-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1449767299-29691-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <566E238E.4050007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <566E238E.4050007@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Mon, Dec 14, 2015 at 11:03:58AM +0900, Chanwoo Choi wrote:
> Hi Charles,
>=20
> On 2015=EB=85=84 12=EC=9B=94 11=EC=9D=BC 02:08, Charles Keepax wrote:
> > Update the device tree binding documentation to include documentati=
on for
> > the wlf,micd-configs property that is used to specify the configura=
tions
> > for headset polarity detection (CTIA / OTMP).
> >=20
> > Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> > ---
> >  Documentation/devicetree/bindings/extcon/extcon-arizona.txt | 8 ++=
++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizon=
a.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> > index 238e10e..fd9b898 100644
> > --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> > +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> > @@ -37,5 +37,13 @@ Optional properties:
> >      milliseconds.
> >    - wlf,micd-force-micbias : Force MICBIAS continuously on during =
microphone
> >      detection.
> > +  - wlf,micd-configs : Headset polarity configurations (generally =
used for
> > +    detection of CTIA / OMTP headsets), the field can be of variab=
le length
> > +    but should always be a multiple of 3 cells long, each three ce=
ll group
> > +    represents one polarity configuration.
> > +    The first cell defines the accessory detection pin, zero will =
use MICDET1
> > +    and all other values will use MICDET2.
> > +    The second cell represents the MICBIAS to be used.
> > +    The third cell represents the value of the micd-pol-gpio pin.
>=20
> I think that you better to add the example using the 'wlf,micd-config=
s'
> to improve the understanding of using this property.
> because the number of 'wlf,micd-configs' value is not fixed.
>=20
> Also,
> How about do you add the real example for all arizona properties on s=
eparate patch?

Yeah that seems sensible I will do a patch to add an example to
this file.

Thanks,
Charles
