From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] usb: dwc2: optionally assert phy "full reset" when
 waking up
Date: Mon, 2 Nov 2015 09:48:21 -0800
Message-ID: <CAD=FV=WjyQBXbGjXYL540yC3qRQx_tAX_c7WOrS3r7O595fjEg@mail.gmail.com>
References: <1446236275-12698-1-git-send-email-dianders@chromium.org>
	<1446236275-12698-2-git-send-email-dianders@chromium.org>
	<CAL_JsqKCEC3=PmD27zZ2KMY-UwZTjoZrwnEimWOvgqLeJ6wRjg@mail.gmail.com>
	<CAD=FV=XdPK8YOimepgcOfcyHf+MkuxX9jT9YhVh6FV3Snq5aUg@mail.gmail.com>
	<CAL_JsqJ0pWV6mX2Nf-ccEvMg6jd+G76qZg0EVdRFu8obCLkHvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ0pWV6mX2Nf-ccEvMg6jd+G76qZg0EVdRFu8obCLkHvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, wulf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Gregory Herrero <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Nov 2, 2015 at 9:16 AM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Nov 2, 2015 at 10:22 AM, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> Rob,
>>
>> On Mon, Nov 2, 2015 at 8:12 AM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Fri, Oct 30, 2015 at 3:17 PM, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>>> From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
>>>> We can get the PHY out of its bad state by asserting its "port reset",
>>>> but unfortunately that seems to assert a reset onto the USB bus so it
>>>> could confuse things if we don't actually deenumerate / reenumerate the
>>>> device.
>>>>
>>>> We can also get the PHY out of its bad state by fully resetting it using
>>>> the reset from the CRU (clock reset unit), which does a more full
>>>> reset.  The CRU-based reset appears to actually cause devices on the bus
>>>> to be removed and reinserted, which fixes the problem (albeit in a hacky
>>>> way).
>>>
>>> The reset from the CRU goes to the PHY, correct? Therefore, the
>>> binding should reflect that. Connecting it to the host controller is a
>>> hack.
>>>
>>> So describe the reset connection properly and then add a .phy_reset()
>>> hook to the phy subsystem. Then call that when flag property you added
>>> is set.
>>
>> As per previous email, I disagree.  The fact that there may be more
>> than one reset exposed from the PHY and that there is not a tightly
>> coupled relationship between a PHY driver and a USB driver means that
>> we would need to re-invent the reset API on top of the PHY API.  In my
>> case I am exposing a single reset at the moment, but there may be
>> reasons to expose additional "PHY" resets in the future.
>
> Your previous approach was completely different. I was not arguing
> that the PHY driving reset to the host was wrong use of reset binding,
> just that it was an overkill. Now, it is just flat wrong unless you
> convince me that SRST_USBHOST1_PHY is a connection to the host rather
> than the PHY.

It still seems to me that the argument that there can be multiple
types of "phy reset" is still a sane argument.  Just because we
currently happen to need the one that resets the whole PHY now doesn't
mean that we won't need other different resets later.

...and if you're exposing multiple different resets, then the reset
API is the best one to use.

I _could_ see the argument that perhaps the reset should pass through
the PHY driver so that it could possibly in the future be aware of the
reset.  That is: the SRST could use the reset API to expose the PHY
reset to the PHY driver and then the PHY driver could in turn expose
the PHY reset (using the reset API) to the dwc2 driver.  At the moment
this would be a complete pass through, but structuring it that way
would later allow the PHY to do something with the reset.  How about
that?

-Doug
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
