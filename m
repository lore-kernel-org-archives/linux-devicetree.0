From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH anybus v4 6/7] dt-bindings: anybuss-host: document
 devicetree binding
Date: Wed, 28 Nov 2018 10:36:24 -0600
Message-ID: <CAL_JsqK--6UE9N2je3mkoxf_0+i5fTYqYpmTF2bpzFf-KRjhaQ@mail.gmail.com>
References: <20181121150709.6030-1-TheSven73@googlemail.com>
 <20181121150709.6030-7-TheSven73@googlemail.com> <20181126220804.GA23069@bogus>
 <CAGngYiWBBe7P80ASQJnS8woe6SKLgNUmqKxOHMeyV1fGSCpY_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiWBBe7P80ASQJnS8woe6SKLgNUmqKxOHMeyV1fGSCpY_w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Sven Van Asbroeck <svendev@arcx.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 28, 2018 at 9:38 AM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> Rob, thank you so much for the review !
>
> On Mon, Nov 26, 2018 at 5:08 PM Rob Herring <robh@kernel.org> wrote:
>
> > Unit-addresses are based on 'reg'. So this should either be '89' or
> > based on a definition for the bus (e.g. PCI uses dev and func).
> >
> >> +                     reg = <0x0089>;
> >
> > Is fieldbus type how one addresses a device on the bus?
>
> I'm afraid not. Anybus cards don't have an address, because only a single card
> can be connected to an anybus at a time.

Then you don't need reg as you should only have 1 child node.

> Fieldbus type defines the type/functionality of the connected card. Like pci
> device ids.

Which for PCI can be overridden in DT, but is part of reg.

> The current patchset allows devicetree nodes to be provided depending on
> the type of card connected to the bus. It identifies the card by type,
> not location.
>
> Is this not desired / allowed ?

No, 'reg' is how you address a device. You could use 'type' in the
compatible string if type implies some sort of standard class
interface.

> > I'm still not clear what a bridge vs. host is. Both examples are on WEIM
> > bus CS0?
>
> I agree that the terminology is too confusing. I'm looking to change it.
>
> Let's compare current anybus with a well-established bus architecture like pci:
>
>                                 pci                     anybus
> --------------------------------------------------------------------------------
> Common bus code (spec),         pci/pci_driver.c        fieldbus/anybuss-host.c
>   calls bus_register()                                  must be parallel bus
>                                                         subnode
>                                 no of compatible        has of compatible
> --------------------------------------------------------------------------------
> Device on bus, calls
>   XXX_client_driver_register()  hwmon/k8temp.c          fieldbus/hms-profinet.c
> --------------------------------------------------------------------------------
> Controller, silicon driver      pci/pcie-tango.c        fieldbus/anybus-bridge.c
>                                 platform_driver calls   platform_driver does not
>                                 pci_host_probe()        register with anybus
>
> I should probably rework this so it conforms more closely to the way it's done
> on pci. Would the following look any better?

Yes, this looks better.

>                                 pci                     anybus
> --------------------------------------------------------------------------------
> Common bus code (spec),         pci/pci_driver.c        anybus/anybus_driver.c

Maybe just anybus/core.c or anybus/bus.c. I'm guessing your
implementation will be *much* more simple than PCI.

>   calls bus_register()          no of compatible        no of compatible
> --------------------------------------------------------------------------------
> Device on bus, calls
>   XXX_client_driver_register()  hwmon/k8temp.c          fieldbus/hms-profinet.c
> --------------------------------------------------------------------------------
> Controller, silicon driver      pci/pcie-tango.c        anybus/arcx-controller.c
>                                 platform_driver calls   platform_driver calls
>                                 pci_host_probe()        anybus_host_probe()
>
> Of course, the analogy is not perfect, as there can only be a single card
> (device) connected to an anybus at a time.

Right, that should simplify the bus code a lot.

Rob
