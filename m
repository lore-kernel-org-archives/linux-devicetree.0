From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date: Thu, 3 Oct 2019 22:56:24 +0200
Message-ID: <9cfccb6a-fba1-61a3-3eb6-3009c2f5e747@redhat.com>
References: <20191002231617.3670-1-john.stultz@linaro.org>
 <20191002231617.3670-3-john.stultz@linaro.org>
 <20191003112618.GA2420393@kroah.com>
 <CALAqxLWm_u3KsXHn4a6PdBCOKM1vs5k0xS3G5jY+M-=HBqUJag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLWm_u3KsXHn4a6PdBCOKM1vs5k0xS3G5jY+M-=HBqUJag@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 03-10-2019 22:45, John Stultz wrote:
> On Thu, Oct 3, 2019 at 4:26 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Wed, Oct 02, 2019 at 11:16:16PM +0000, John Stultz wrote:
>>> From: Yu Chen <chenyu56@huawei.com>
>>>
>>> This patch adds notifier for drivers want to be informed of the usb rol=
e
>>> switch.
>>
>> Ick, I hate notifiers, they always come back to cause problems.
>>
>> What's just wrong with a "real" call to who ever needs to know this?
>> And who does need to know this anyway?  Like Hans said, if we don't have
>> a user for it, we should not add it.
>=20
> So in this case, its used for interactions between the dwc3 driver and
> the hikey960 integrated USB hub, which is controlled via gpio (which I
> didn't submit here as I was trying to keep things short and
> reviewable, but likely misjudged).
>=20
> The HiKey960 has only one USB controller, but in order to support both
> USB-C gadget/OTG and USB-A (host only) ports. When the USB-C
> connection is attached, it powers down and disconnects the hub. When
> the USB-C connection is detached, it powers the hub on and connects
> the controller to the hub.

When you say one controller, do you mean 1 host and 1 gadget controller,
or is this one of these lovely devices where a gadget controller gets
abused as / confused with a proper host controller?

And since you are doing a usb-role-switch driver, I guess that the
role-switch is integrated inside the SoC, so you only get one pair
of USB datalines to the outside ?

This does seem rather special, it might help if you can provide a diagram
with both the relevant bits inside the SoC as well as what lives outside
the Soc. even if it is in ASCII art...

Regards,

Hans
