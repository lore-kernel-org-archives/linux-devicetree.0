From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/3] documentation: Add secure monitor binding documentation
Date: Mon, 6 Jun 2016 08:19:55 -0500
Message-ID: <CAL_Jsq+JqWjd9VBS_Wxbnada46k+cK0p9dVARCCJnqT1EajHbA@mail.gmail.com>
References: <1464520323-19531-1-git-send-email-carlo@caione.org>
 <1464520323-19531-3-git-send-email-carlo@caione.org> <20160602171422.GA17166@rob-hp-laptop>
 <20160603092517.GA18149@mephisto>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160603092517.GA18149@mephisto>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 3, 2016 at 4:25 AM, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> wrote:
> On 02/06/16 12:14, Rob Herring wrote:
>> On Sun, May 29, 2016 at 01:12:02PM +0200, Carlo Caione wrote:
>> > From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>> >
>> > Add the binding documentation for the Amlogic secure monitor driver.
>> >
>> > Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>> > ---
>> >  .../bindings/firmware/meson/meson_sm.txt           | 33 ++++++++++++++++++++++
>> >  1 file changed, 33 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
>> > new file mode 100644
>> > index 0000000..6f0b5bc
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
>> > @@ -0,0 +1,33 @@
>> > +* Amlogic Secure Monitor
>> > +
>> > +In the Amlogic SoCs the Secure Monitor code is used to provide access to the
>> > +NVMEM, enable JTAG, set USB boot, etc...
>> > +
>> > +Required properties for the secure monitor node:
>> > +- compatible: Should be "amlogic,meson-gxbb-sm"
>> > +
>> > +Example:
>> > +
>> > +   firmware {
>> > +           compatible = "simple-bus";
>>
>> Drop this. Sorry, but no abusing simple-bus to get automagic creation of
>> your platform device.
>
> Sounds reasonable. I can hook this up to some *_initcall. What about
> introducing a new FIRMWARE_OF_DECLARE() ?

Please don't add FIRMWARE_OF_DECLARE unless it needs to be early.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
