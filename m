From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2] dt-bindings: hwmon: Add missing documentation for lm75
Date: Thu, 28 Feb 2019 23:00:44 +0530
Message-ID: <CAMty3ZDR_Vnutobg=wjzwPZ_pkD4pLA76Lpec9u4OR8OtmuLGA@mail.gmail.com>
References: <20190212113808.3040-1-jagan@amarulasolutions.com> <20190228151543.GA18597@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228151543.GA18597@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2019 at 8:45 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Feb 12, 2019 at 05:08:08PM +0530, Jagan Teki wrote:
> > Add missing dt-binding documentation for lm75 hwmon sensor.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v2:
> > -  Add all compatible nodes available in lm75.
> >
> >  .../devicetree/bindings/hwmon/lm75.txt        | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/lm75.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
> > new file mode 100644
> > index 000000000000..12d8cf7cf592
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
> > @@ -0,0 +1,37 @@
> > +*LM75 hwmon sensor.
> > +
> > +Required properties:
> > +- compatible: manufacturer and chip name, one of
> > +             "adi,adt75",
> > +             "dallas,ds1775",
> > +             "dallas,ds75",
> > +             "dallas,ds7505",
> > +             "gmt,g751",
> > +             "national,lm75",
> > +             "national,lm75a",
> > +             "national,lm75b",
> > +             "maxim,max6625",
> > +             "maxim,max6626",
> > +             "maxim,max31725",
> > +             "maxim,max31726",
> > +             "maxim,mcp980x",
> > +             "st,stds75",
> > +             "st,stlm75",
> > +             "microchip,tcn75",
> > +             "ti,tmp100",
> > +             "ti,tmp101",
> > +             "ti,tmp105",
> > +             "ti,tmp112",
> > +             "ti,tmp175",
> > +             "ti,tmp275",
> > +             "ti,tmp75",
> > +             "ti,tmp75c",
>
> Some of these are in trivial-devices.yaml already. So you either need to
> remove them from there. Or you can move all these to trivial-devices and
> benefit from having a schema. I prefer the latter, but either way is
> fine. You can remove them from trivial-devices.yaml in a separate patch,
> so:

Thanks, Rob.

I will remove trivial devices from here wrt trivial-devices.yaml in
separate patch.

Guenter, could you please pick this.
