From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH v5 1/6] fieldbus_dev: add Fieldbus Device subsystem.
Date: Thu, 6 Dec 2018 13:32:14 -0500
Message-ID: <CAGngYiWY2hz2uXEEsEQJuF3vhF6w6TnxyzgGk9TXse0=iPmT6A@mail.gmail.com>
References: <20181204220224.27324-1-TheSven73@googlemail.com>
 <20181204220224.27324-2-TheSven73@googlemail.com> <20181205101659.GA27058@kroah.com>
 <CAGngYiXXrrqGxTt339EP53tschLgZ82eRGvGifHQw6pg=C88+Q@mail.gmail.com>
 <20181205191724.GA434@kroah.com> <CAGngYiWG74nDt1_hN0-bKCDRxm-f=N-Rnjtk02Vd7dgKtGRaBA@mail.gmail.com>
 <20181206140750.GB18947@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206140750.GB18947@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Arnd Bergmann <arnd@arndb.de>, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Greg,

On Thu, Dec 6, 2018 at 9:07 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> And as these are really devices, why not make them a "device" and a bus?
> What type of topology do you have on these busses?  Are everything
> "flat" and connected directly to a PCI/USB/platform device?  Or are
> there multiple devices attached to a single controller?
>
> It really feels like you want to use 'struct device' and a bus_type and
> not a class here to me...
>

I don't believe that the bus/device abstraction is appropriate for fieldbus
peripherals. But obviously I'm not a fieldbus or kernel expert, so I keep an
open mind to any elegant solutions I may have missed.

The name FieldBUS is misleading - it's an industrial network, not a bus. The
underlying network technology varies: Profinet runs over Ethernet,
Profibus over RS485. The topology is typical for networks AFAIK.

The actual layout of the raw packets exchanged over the network is proprietary;
fieldbus cards will typically implement this internally, and hide the details.

To the user, a fieldbus card typically exposes shared memory regions.
For example, a robotic arm may store its arm angle at offset 27 of its memory
region. The PC controlling the arm writes a new value to offset 27 in the
memory of its own fieldbus card. The cards then communicate over the network,
the memory in the arm's fieldbus card is updated, and the arm is notified of
the data change by an interrupt.

Like I said, I'm by no means a fieldbus expert. But this 'feels' unlike a
device/bus abstraction. And it also doesn't 'feel' right to make this part
of the network stack. But I keep an open mind.

Sven
