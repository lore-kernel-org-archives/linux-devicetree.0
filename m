From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 8/9] dt-bindings: iio: humidity: hts221: support open
 drain mode
Date: Tue, 11 Jul 2017 13:42:54 -0500
Message-ID: <CAL_JsqJa7JeofpG=66AnVrTP4XtVrp9B4-QoLTyK08GzF4L5uQ@mail.gmail.com>
References: <20170709165704.26311-1-lorenzo.bianconi@st.com>
 <20170709165704.26311-9-lorenzo.bianconi@st.com> <20170711025158.vpt6bcznkhi3bslm@rob-hp-laptop>
 <20170711192656.7fd08a1c@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170711192656.7fd08a1c-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 11, 2017 at 1:26 PM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, 10 Jul 2017 21:51:58 -0500
> Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>> On Sun, Jul 09, 2017 at 06:57:03PM +0200, Lorenzo Bianconi wrote:
>> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/iio/humidity/hts221.txt | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/iio/humidity/hts221.txt b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
>> > index fca263e13400..732b83c06c08 100644
>> > --- a/Documentation/devicetree/bindings/iio/humidity/hts221.txt
>> > +++ b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
>> > @@ -5,6 +5,14 @@ Required properties:
>> >  - reg: i2c address of the sensor / spi cs line
>> >
>> >  Optional properties:
>> > +- drive-open-drain: the interrupt/data ready line will be configured
>>
>> Needs a vendor prefix and "drdy-open-drain" would be more specific.
> This is straight out of the pinctrl bindings and has been used in a few
> other places as well.  I can see it should really be more obviously
> associated with the drdy pin though.  A few IIO drivers already
> use this binding (st sensors and the lsm6dsx).  If we are going
> to decide it's a bad idea we should deprecate those bindings and
> add whatever we do here as well.

Ah, okay. Then the description should have a  "see pinctrl.txt" for
the description.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
