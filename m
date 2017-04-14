From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: Add bindings for Google Chromium
 EC HWMON
Date: Fri, 14 Apr 2017 07:48:15 -0500
Message-ID: <CAL_Jsq+OaMAdRLuC0BBDpOPapisaETaUZpEX10yJk=fYLQCCdg@mail.gmail.com>
References: <1491602410-31518-1-git-send-email-moritz.fischer@ettus.com>
 <1491602410-31518-2-git-send-email-moritz.fischer@ettus.com>
 <20170413200140.lcynmsv255ktoiyl@rob-hp-laptop> <20170413210707.GA16304@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413210707.GA16304-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 4:07 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On Thu, Apr 13, 2017 at 03:01:40PM -0500, Rob Herring wrote:
>> On Fri, Apr 07, 2017 at 03:00:09PM -0700, Moritz Fischer wrote:
>> > From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >
>> > Add bindings for the Chromium EC HWMON. The Chromium EC HWMON
>> > allows monitoring of temperature sensors and fans attached to the
>> > EC.
>> >
>> > Signed-off-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> > ---
>> >  .../devicetree/bindings/hwmon/cros-ec-hwmon.txt    | 25 ++++++++++++++++++++++
>> >  1 file changed, 25 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt b/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt
>> > new file mode 100644
>> > index 0000000..4c94869
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/hwmon/cros-ec-hwmon.txt
>> > @@ -0,0 +1,25 @@
>> > +Chromium Embedded Controller EC temperature and fan control
>> > +-----------------------------------------------------------
>> > +
>> > +Google's Chromium EC HWMON is a hwmon implemented byimplemented by the Chromium EC
>> > +firmware attached to the Embedded Controller (EC) and controlled via a host-command
>> > +interface.
>> > +
>> > +An EC HWMON node should be only found as a sub-node of the EC node (see
>> > +Documentation/devicetree/bindings/mfd/cros-ec.txt).
>> > +
>> > +Required properties:
>> > +- compatible: Must contain "google,cros-ec-hwmon"
>> > +
>> > +Example:
>> > +   embedded-controller@1e {
>> > +           reg = <0x1e>;
>> > +           compatible = "google,cros-ec-i2c";
>> > +           interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>> > +           interrupt-parent = <&gpio0>;
>> > +
>> > +           hwmon {
>> > +                   compatible = "google,cros-ec-hwmon";
>>
>> This is sufficient for all devices? I don't see that DT provides
>> anything here other than instantiating a device, but the parent device
>> can just as easily do that.
>>
> The parent driver (drivers/mfd/cros_ec_i2c.c) calls cros_ec_register(),
> which uses uses of_platform_populate() to populate all sub-devices.
> There are various examples in the dts files (look for "google,cros-ec").
> Does it really make sense to start a second method for instantiating
> sub-devices ?

Okay, I suppose not. That wasn't clear from the example.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
