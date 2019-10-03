From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date: Thu, 3 Oct 2019 14:33:38 -0700
Message-ID: <CALAqxLX3uSJKvRwzcQznaF4WK52BcM5Bh+PNXHmfDe1aTSUL8Q@mail.gmail.com>
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <20191003112618.GA2420393@kroah.com> <CALAqxLWm_u3KsXHn4a6PdBCOKM1vs5k0xS3G5jY+M-=HBqUJag@mail.gmail.com>
 <9cfccb6a-fba1-61a3-3eb6-3009c2f5e747@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9cfccb6a-fba1-61a3-3eb6-3009c2f5e747@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 3, 2019 at 1:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 03-10-2019 22:45, John Stultz wrote:
> > The HiKey960 has only one USB controller, but in order to support both
> > USB-C gadget/OTG and USB-A (host only) ports. When the USB-C
> > connection is attached, it powers down and disconnects the hub. When
> > the USB-C connection is detached, it powers the hub on and connects
> > the controller to the hub.
>
> When you say one controller, do you mean 1 host and 1 gadget controller,
> or is this one of these lovely devices where a gadget controller gets
> abused as / confused with a proper host controller?

I'm not totally sure myself, but I believe it's the latter, as the
host ports have to be disabled in order for the gadet/otg port to
function.

There was a similar situation w/ the original HiKey board (dwc2
controller) as well, though the switching was done fully in hardware
and we only needed some minor tweaks to the driver to keep the state
transitions straight.

> And since you are doing a usb-role-switch driver, I guess that the
> role-switch is integrated inside the SoC, so you only get one pair
> of USB datalines to the outside ?

I believe so, but again, I don't have a ton of knowledge about the SoC
details, Chen Yu would probably be the right person to answer, but I
don't know if he's doing upstreaming anymore.

> This does seem rather special, it might help if you can provide a diagram
> with both the relevant bits inside the SoC as well as what lives outside
> the Soc. even if it is in ASCII art...

There is a schematic pdf here:
https://github.com/96boards/documentation/raw/master/consumer/hikey/hikey960/hardware-docs/HiKey960_Schematics.pdf

The larger block diagram on page 3 might be helpful, but you can find
more details on the usb hub bits on page 17 and 18.

thanks
-john
