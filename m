From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] media: et8ek8: Add documentation
Date: Wed, 15 Jun 2016 13:41:18 -0500
Message-ID: <CAL_JsqKDxnc-pTOcdbL4iWFB9qU5924N0TV0NFw=A-zGN8boXQ@mail.gmail.com>
References: <1465659593-16858-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1465659593-16858-3-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <20160614220517.GA23504@rob-hp-laptop> <20160615043116.GG26360@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160615043116.GG26360-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 14, 2016 at 11:31 PM, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org> wrote:
> Hi Rob,
>
> On Tue, Jun 14, 2016 at 05:05:17PM -0500, Rob Herring wrote:
>> On Sat, Jun 11, 2016 at 06:39:53PM +0300, Ivaylo Dimitrov wrote:
>> > Add DT bindings description
>>
>> Not exactly the best commit msg.
>>
>> >
>> > Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  .../bindings/media/i2c/toshiba,et8ek8.txt          | 50 ++++++++++++++++++++++
>> >  1 file changed, 50 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
>> > new file mode 100644
>> > index 0000000..997d268
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
>> > @@ -0,0 +1,50 @@
>> > +Toshiba et8ek8 5MP sensor
>> > +
>> > +Toshiba et8ek8 5MP sensor is an image sensor found in Nokia N900 device
>> > +
>> > +More detailed documentation can be found in
>> > +Documentation/devicetree/bindings/media/video-interfaces.txt .
>> > +
>> > +
>> > +Mandatory properties
>> > +--------------------
>> > +
>> > +- compatible: "toshiba,et8ek8"
>> > +- reg: I2C address (0x3e, or an alternative address)
>> > +- vana-supply: Analogue voltage supply (VANA), 2.8 volts
>>
>> > +- clocks: External clock to the sensor
>> > +- clock-frequency: Frequency of the external clock to the sensor
>>
>> These should be mutually-exclusive. If you have a clock, then you can
>> get the frequency at runtime.
>
> Yes, you can. But the intention is to set the frequency: the sensor requires
> a particular, pre-determined frequency. Typically this is specific to the
> board.

Okay, then state that in the description.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
