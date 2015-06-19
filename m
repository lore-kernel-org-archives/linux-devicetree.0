MIME-Version: 1.0
In-Reply-To: <20150612172411.68e08669@home.neil.brown.name>
References: <1434024020-17048-1-git-send-email-cuissard@marvell.com>
	<1434024020-17048-3-git-send-email-cuissard@marvell.com>
	<CAL_JsqKtCT9wLS5xqHoJ9K_2Y+Tw8g7mP=MSkDBXO9TexHd9pg@mail.gmail.com>
	<20150612172411.68e08669@home.neil.brown.name>
Date: Thu, 18 Jun 2015 21:36:46 -0500
Message-ID: <CAL_JsqKMQgwokgneX_qR8k_cKh3fDNjhy5y3dTto=UsEcc54Bw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] NFC: nfcmrvl: add UART driver
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Neil Brown <neilb@suse.de>
Cc: Vincent Cuissard <cuissard@marvell.com>, linux-nfc@lists.01.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 12, 2015 at 2:24 AM, Neil Brown <neilb@suse.de> wrote:
> On Thu, 11 Jun 2015 23:06:54 -0500
> Rob Herring <robherring2@gmail.com> wrote:
>
>> Adding Neil Brown who has been doing a UART slave binding[1].
>
> Thanks for the heads-up.

Here's another one [1].

> This is quite a different approach to configuring a device that is attached to
> a UART, but then I think it is trying to handle different issues than my
> approach and the two can easily co-exist.

Yes, but the binding is pretty similar.

> My need was for a driver to be activated when the tty device was opened.
> So the uart needs to examine the child in devicetree, find the "compatible"
> driver, probe it, and allow it to intercept "open" requests.
>
> This need is to be able to configure a particular driver that is attached to a
> particular line discipline.
> So (if I understand correctly), the /dev/ttyXX would be opened, an line
> discipline would be selected, and ioctl to that line discipline would select
> the driver and then that drive goes and looks in devicetree, find the
> configuration, and makes use of it.

I guess you co

> It may be a pipe dream, but it might be nice if these could be combined.  When
> the uart looks in device tree, if it finds a child which specifies a
> line-discipline, it could activate that line discipline directly which could
> then extract other information  and activate the relevant drive, which could
> then gather the relevant configuration information.
>
> I do think my current code would get confused if it found this device tree node
> under a uart.
> It currently thinks any device tree node with a "compatible" attribute implies
> a device that will have a driver.  So it won't register the tty device until
> that driver appears.  That would be a problem for this NFC driver.
>
> It probably makes sense to change my approach so that the tty still gets
> registered immediately, but when the driver appears it gets connected in to the
> tty somehow.   I'll have to give that some thought.

[1] http://www.spinics.net/lists/linux-bluetooth/msg62629.html
