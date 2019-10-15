From: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date: Tue, 15 Oct 2019 00:03:43 -0700
Message-ID: <CALAqxLWk-29eNJ+hPjSBcLLeMKbaZEY9A3LVz6fGjv=mjRmNqw@mail.gmail.com>
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-3-john.stultz@linaro.org>
 <20191003112618.GA2420393@kroah.com> <CALAqxLWm_u3KsXHn4a6PdBCOKM1vs5k0xS3G5jY+M-=HBqUJag@mail.gmail.com>
 <9cfccb6a-fba1-61a3-3eb6-3009c2f5e747@redhat.com> <CALAqxLX3uSJKvRwzcQznaF4WK52BcM5Bh+PNXHmfDe1aTSUL8Q@mail.gmail.com>
 <fa44a7ab-14bc-24ec-a19b-7bf15e100ce1@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fa44a7ab-14bc-24ec-a19b-7bf15e100ce1@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 6, 2019 at 8:22 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Anyways back the code to add a usb role switch notifier. I do
> not think that this is a good idea, this is making "core" changes
> to deal with a special case. If you are going to use a notfier for
> this then IMHO the notifier should be part of the hikey960 usb role
> swtich driver and not be in the usb-role-switch class code, since
> this is very much a device specific hack.

Ok, that sounds fair.  I still need to find some way to hook into the
role-switch path between the tcpm and the dwc3 in order to switch to
the hub, but I guess I can try to add a hook somewhere in the dwc3
code itself. I'll dig on this a bit.

thanks
-john
