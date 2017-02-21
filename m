From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] usb: add DT bindings for farady fotg2 host controller
Date: Tue, 21 Feb 2017 08:43:53 -0600
Message-ID: <CAL_JsqK7VDomXqMz3YJqL5QjnSb-anwXtG+exz4g_BjPLOaiXQ@mail.gmail.com>
References: <20170208200010.21522-1-ulli.kroll@googlemail.com>
 <20170208200010.21522-3-ulli.kroll@googlemail.com> <20170215230042.4m3niqf5wizbrgb4@rob-hp-laptop>
 <alpine.LNX.2.00.1702171054320.9178@T420s>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LNX.2.00.1702171054320.9178@T420s>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 17, 2017 at 4:07 AM, Hans Ulli Kroll
<ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi Rob,
>
> On Wed, 15 Feb 2017, Rob Herring wrote:
>
>> On Wed, Feb 08, 2017 at 09:00:09PM +0100, Hans Ulli Kroll wrote:
>> > This adds DT bindings for the Faraday FOTG2 host controller.
>> >
>> > Signed-off-by: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/usb/fotg2-host.txt | 15 +++++++++++++++
>> >  1 file changed, 15 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/usb/fotg2-host.txt
>> >
>> > diff --git a/Documentation/devicetree/bindings/usb/fotg2-host.txt b/Documentation/devicetree/bindings/usb/fotg2-host.txt
>> > new file mode 100644
>> > index 000000000000..4c07566a4bf5
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/usb/fotg2-host.txt
>> > @@ -0,0 +1,15 @@
>> > +Faraday FOTG Host controller
>> > +
>> > +Required properties:
>> > +
>> > +- compatible: should be "faraday,fotg210-hcd"
>>
>> hcd as in "host controller driver"? Bindings describe h/w not drivers.
>>
>> It's an OTG controller or host controller?
>>
>
> here only the host controller part used.
>
> faraday fotg2 is a dual role hcd/otg device and here is only the
> host part used.

Because you don't care about device mode or restricted by the IP
configuration or SoC integration? The former is a user choice and
shouldn't be part of DT. The latter should be implied by an SoC
specific compatible string. Using only a compatible string for a
licensed IP is not specific enough as vendors use differing versions
and integrate them in different ways.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
