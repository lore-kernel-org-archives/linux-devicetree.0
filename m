From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add ddc i2c reference to veyron
Date: Thu, 3 Sep 2015 09:46:38 -0500
Message-ID: <CAL_JsqL838-somj-o2QtxRA9bXon5dHijx22v0mVowqyhKgoUQ@mail.gmail.com>
References: <1441229148-12095-1-git-send-email-dianders@chromium.org>
 <CAL_JsqLLPCy6OpsP4NNjUA6+UxeTC-zGjGPPU+MLhUqFXSSGJQ@mail.gmail.com> <20150903082210.GU21084@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150903082210.GU21084-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandru Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?B?5aea5pm65oOF?= <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 3, 2015 at 3:22 AM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Wed, Sep 02, 2015 at 07:13:24PM -0500, Rob Herring wrote:
>> On Wed, Sep 2, 2015 at 4:25 PM, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> > The ddc-i2c-bus property was missing from the veyron dtsi file since
>> > downstream the ddc-i2c-bus was still being specified in rk3288.dtsi and
>> > nobody noticed when the veyron dtsi was sent upstream.  Add it.
>> >
>> > Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > ---
>> > Note: I noticed that this was wrong but I don't currently have
>> > graphics up and running on upstream on veyron.  Posting this anyway
>> > since it's pretty clear that it's needed.  If someone else wants to
>> > try it out that'd be nice, otherwise I'll put it on my list to figure
>> > out how to get myself setup for graphics upstream.  ;)
>>
>> Based on your other patch, this is temporary, right?
>>
>> I've been looking at DRM a lot lately. I think specifying the i2c bus
>> in the hdmi chip or IP block node is wrong. If the I2C host is
>> separate from the HDMI block, then it's only connection is to the HDMI
>> connector. So the I2C host to the connector relationship is what the
>> DT should describe. HPD gpio is similar. Now if the HDMI bridge
>> controls DDC and HPD directly, then we don't need to describe those
>> connections.
>
> Except... we don't generally model connectors under DRM as a general
> rule.  (The fbdev video connector stuff happened without very much
> publicity afaics.)

True. We have a binding with no users in the kernel. I think we should
move in the direction of using it though. After all, it should not be
a question of fbdev vs. DRM support for the binding. Connectors are
certainly a concept within DRM, but they are very closely tied to
encoder/bridge drivers ATM. We should be able to separate them to
handle the common cases, but we have to have some consistency across
DT bindings to do that. I don't yet have more concrete proposals
though.

> It's not always appropriate to split it out from the bridge in any
> case.  Consider something like a TDA998x where the TDA998x itself
> takes care of reading the DDC bus, and doesn't provide an I2C-like
> interface.  If you try and split that into "bridge" or "encoder" and
> "connector" you end up having to invent a new kind of I2C thing which
> isn't an I2C adapter, or somehow squeezing an I2C adapter which isn't
> into the I2C layer.

Yes, that is fairly common (ADV75xx is same), and we would not
describe an I2C bus in DT in that case. Same with HPD directly handled
vs. a GPIO line. That is no different than what Doug has said:
ddc-i2c-bus is present if using the SOC's I2C host and absent if using
the HDMI block's DDC functionality. I'm only questioning the location
of the property.

Even if the bridge handles DDC and HPD, there is also regulator
control for the connector power supply. That's most likely never going
to be part of the bridge.

> The TDA998x provides an interface to read a block of EDID at a time.
> It always does the page register access.  You don't get to read it
> byte wise.  It doesn't fit into I2C as an adapter at all.

Agreed.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
