From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v5 1/2] iio:temperature:max31856:Add device tree bind
 info
Date: Sun, 3 Mar 2019 13:02:03 +0000
Message-ID: <20190303130203.256a5905@archlinux>
References: <20190226150214.19467-1-patrick.havelange@essensium.com>
        <20190227235947.GA27130@bogus>
        <CAKKE0ZFNm1BNS5xbgo4D1Kp0U+TbL35A9Uk-r245CPVkAuE=XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKKE0ZFNm1BNS5xbgo4D1Kp0U+TbL35A9Uk-r245CPVkAuE=XQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrick Havelange <patrick.havelange@essensium.com>
Cc: Rob Herring <robh@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, Matt Weber <matthew.weber@rockwellcollins.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 28 Feb 2019 16:15:55 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> On Thu, Feb 28, 2019 at 12:59 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Feb 26, 2019 at 04:02:13PM +0100, Patrick Havelange wrote:  
> > > From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> > >
> > > This patch added device tree binding info for MAX31856 driver.
> > >
> > > Signed-off-by: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> > > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> > > ---
> > > Changes
> > > v1 -> v2
> > > [Matt
> > >  - Removed comment block and added possibilities of
> > >    thermocouple type in device tree binding doc.
> > >
> > > v2 -> v3
> > >  - Rebased
> > >
> > > v3 -> v4
> > >  - Removed one-shot property related information.
> > >  - Used standard name 'temp-sensor'
> > >
> > > v4 -> v5
> > > [Patrick
> > >  - Rename thermocouple type to maxim,thermocouple-type for DT entry
> > > ---
> > >  .../bindings/iio/temperature/max31856.txt     | 29 +++++++++++++++++++
> > >  1 file changed, 29 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/iio/temperature/max31856.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/iio/temperature/max31856.txt b/Documentation/devicetree/bindings/iio/temperature/max31856.txt
> > > new file mode 100644
> > > index 000000000000..b4396069b8fa
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/temperature/max31856.txt
> > > @@ -0,0 +1,29 @@
> > > +Maxim MAX31856 thermocouple support
> > > +
> > > +https://datasheets.maximintegrated.com/en/ds/MAX31856.pdf
> > > +
> > > +Required properties:
> > > +     - compatible: must be "maxim,max31856"
> > > +     - reg: SPI chip select number for the device
> > > +     - spi-max-frequency: As per datasheet max. supported freq is 5000000
> > > +     - spi-cpha: must be defined for max31856 to enable SPI mode 1
> > > +     - maxim,thermocouple-type: Type of thermocouple (By default is K-Type)
> > > +             0x00 : TYPE_B
> > > +             0x01 : TYPE_E
> > > +             0x02 : TYPE_J
> > > +             0x03 : TYPE_K (default)
> > > +             0x04 : TYPE_N
> > > +             0x05 : TYPE_R
> > > +             0x06 : TYPE_S
> > > +             0x07 : TYPE_T  
> >
> > These appear to be standard types. Perhaps this should be a common
> > property instead?  
> 
> A remark on the v4 of the patch recommended to add a vendor prefix. It
> also mentioned that it could be done as a generic type with a
> translation layer for each driver.
> Maybe this generic type could be introduced in a separate patch, or
> when another driver also uses that kind of thermocouple-type, as there
> is no other use of it for the moment it seems.

Hmm. If Rob is keen, it might be good to define this standard now.

The big advantage for you is that you can define the numbers to involve
no transition layer for your device.

A quick look at wikipedia suggests there are additional types:
TYPE_M
TYPE_C
TYPE_G
TYPE_P
+ some weird types without a letter.

We have missed the coming merge window for this one so have
a bit of time.  Perhaps you could propose such a generic binding?
For now that binding could just include the values you care about
and new ones can be added when needed.

We would want a dt header to give them defined names to help
with readability.

Apologies for making you go around again on this.

Jonathan


> 
> 
> >  
> > > +
> > > +     Refer to spi/spi-bus.txt for generic SPI slave bindings.
> > > +
> > > + Example:
> > > +     temp-sensor@0 {
> > > +             compatible = "maxim,max31856";
> > > +             reg = <0>;
> > > +             spi-max-frequency = <5000000>;
> > > +             spi-cpha;
> > > +             maxim,thermocouple-type = <0x03>;
> > > +     };
> > > --
> > > 2.19.1
> > >  
