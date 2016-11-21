From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] usb: xhci: add support for performing fake doorbell
Date: Mon, 21 Nov 2016 08:57:38 +0100
Message-ID: <CACna6rw0tnjEOSqjd=q66yWZWa+oNAkH-tk=RLiLzz_=i0x-sA@mail.gmail.com>
References: <20161001215817.25384-1-zajec5@gmail.com> <20161017203036.23399-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161017203036.23399-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Mathias,

On 17 October 2016 at 22:30, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wro=
te:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Broadcom's Northstar XHCI controllers seem to need a special start
> procedure to work correctly. There isn't any official documentation of
> this, the problem is that controller doesn't detect any connected
> devices with default setup. Moreover connecting USB device to controller
> that doesn't run properly can cause SoC's watchdog issues.
>
> A workaround that was successfully tested on multiple devices is to
> perform a fake doorbell. This patch adds code for doing this and enables
> it on BCM4708 family.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> V2: Enable quirk for brcm,bcm4708 machines instead of adding separated bi=
nding
>     for it. Thanks Rob for your comment on this.

Do you think you can pick & push this one? V2 follows Rob's suggestion
and he has some DT knowledge for sure, so I guess it should be OK.
