From: Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6] mwifiex: parse device tree node for PCIe
Date: Wed, 26 Oct 2016 14:16:22 -0700
Message-ID: <CACK8Z6GHv6Fm20EExRWh+QafOF8jg7te9aXoZo5GdNNiOxvv6g@mail.gmail.com>
References: <1477070156-109965-1-git-send-email-rajatja@google.com>
 <1477084869-15612-1-git-send-email-rajatja@google.com> <20161026201735.GA10192@localhost>
 <20161026204648.GD3989@dtor-ws> <CACK8Z6H1ACBo7nDxaXR3Vn9cPdyRqxxzdgYz7vNmojiSvjbW5A@mail.gmail.com>
 <20161026205634.GA13170@localhost> <20161026210648.GE3989@dtor-ws> <20161026210805.GA14423@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161026210805.GA14423@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xinming Hu <huxm-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Amitkumar Karwar <akarwar-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Brian Norris <briannorris-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rajat Jain <rajatxjain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 26, 2016 at 2:08 PM, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Wed, Oct 26, 2016 at 02:06:48PM -0700, Dmitry Torokhov wrote:
>> On Wed, Oct 26, 2016 at 01:56:34PM -0700, Brian Norris wrote:
>> > On Wed, Oct 26, 2016 at 01:51:48PM -0700, Rajat Jain wrote:
>> > >    On Wed, Oct 26, 2016 at 1:46 PM, Dmitry Torokhov
>> > >    <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > >      On Wed, Oct 26, 2016 at 01:17:36PM -0700, Brian Norris wrote:
>> > >      Sorry, I just saw this... Why do we need devicetree data for
>> > >      discoverable bus (PCI)? How does the driver work on systems that do not
>> > >      use DT? Why do we need them to behave differently?
>> > >
>> > >    There are a couple of out-of-band GPIO pins from Marvell chip that can
>> > >    serve as wake-up pins (wake up the CPU when asserted). The Marvell chip
>> > >    has to be told which GPIO pin is to be used as the wake-up pin. The pin to
>> > >    be used is system / platform dependent. (On some systems it could be
>> > >    GPIO13, on others it could be GPIO14 etc depending on how the marvell chip
>> > >    is wired up to the CPU).
>>
>> So wakeup pin is not wired to PCIe WAKE?
>
> Not in our case.
>
>> > There's also calibration data. See "marvell,caldata*" and
>> > "marvell,wakeup-pin" properties. Currently only for SDIO, in
>> > Documentation/devicetree/bindings/net/wireless/marvell-sd8xxx.txt, but
>> > we're adding support for PCIe.
>>
>> How would it all work if I moved the PCIe module from one device to
>> another?
>
> These boards are soldered down, at least in the case I care about.

That is right. Since the out of band wake-up pin is not standard on
the PCIe connector - this feature is for soldered chips only.


>
> Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
