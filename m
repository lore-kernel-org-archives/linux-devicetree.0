From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: gnss: add u-blox binding
Date: Mon, 7 May 2018 11:47:53 +0200
Message-ID: <20180507094753.GR2285@localhost>
References: <20180424163458.11947-1-johan@kernel.org>
 <20180424163458.11947-5-johan@kernel.org>
 <CAL_Jsq+mCp=geT8t_j+0fuTxAB7C9RYn6pESRpLc2GH273fM1Q@mail.gmail.com>
 <20180426091018.GU4615@localhost>
 <CAL_JsqK=xQBx2YCd0kDP0zLn_LAZb6Mi5UfSTQf2soooVz2unQ@mail.gmail.com>
 <20180502081637.GE2285@localhost>
 <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5242FCAD-3139-4A9C-B9FA-7BBAA0E6AE57@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 03, 2018 at 11:35:21AM +0200, H. Nikolaus Schaller wrote:

> I have realized that the w2sg0004 is an exception (although a Sirf chip)
> that it does not provide a WAKEUP signal. And another significant
> difference is that we have to keep the serdev UART enabled even if there
> is no user-space client. Otherwise we are not able to detect unexpected
> activity. So we unfortunately can't move serdev open/close into the .open
> and .close ops but need to open it in probe.

As have also been discussed elsewhere in this thread it may be possible,
and it is definitely desirable, to only keep the port open when really
needed. But given the complexity of implementing this, starting with a
simpler and less power efficient method for sirf-chips without WAKEUP
may be acceptable.

> Therefore, it is in my opinion still better to have a separate driver for
> the w2sg0004 instead of hacking the support of this chip into your WAKEUP
> capable sirfstar driver. So I suggest that you make WAKEUP a required
> property.

I disagree. The sirf driver subsumes your particular wi2wi module and
configurations without WAKEUP are described by the datasheets for other
modules as well.

> We had faced a comparable decision last year with the ov9650 and ov9655 camera
> sensors which are almost the same. But not same enough to integrate both into
> a single driver.

But here we are talking about two configuration for the same chip (even
if your particular chip only supports one).

Johan
