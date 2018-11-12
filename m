From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: Re: [PATCH anybus v3 5/6] dt-bindings: anybuss-host: document
 devicetree binding
Date: Mon, 12 Nov 2018 13:05:26 -0500
Message-ID: <CAGngYiUzA-GGOyX3+joUvf53zTELjiCU_TFLwaWAFgJXM4VHQQ@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-6-TheSven73@googlemail.com> <CAK8P3a1ZUaxJzfzYoqAK+_ZBazHzF6nG1V2aiZSoiQr6nDhiSQ@mail.gmail.com>
 <CAGngYiW5=oc486wq15yLbRLvO243PNALmouTDEh7QpO6GLO9Mg@mail.gmail.com> <CAK8P3a3QvQrOKeUs-9sFjDdzfesK27VP6fH7KVUjMW-gkmq-=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3QvQrOKeUs-9sFjDdzfesK27VP6fH7KVUjMW-gkmq-=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sven Van Asbroeck <svendev@arcx.com>, robh+dt@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, mark.rutland@arm.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, treding@nvidia.com, David Lechner <david@lechnology.com>, noralf@tronnes.org, johan@kernel.org, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh@linuxfoundation.org, john.garry@huawei.com, geert+renesas@glider.be, robin.murphy@arm.com, paul.gortmaker@windriver.com, sebastien.bourdelin@savoirfairelinux.com, icenowy@aosc.io, Stuart Yoder <stuyoder@gmail.com>, maxime.ripard@bootlin.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 9:27 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> We do the same thing on PCI and USB, where normally everything
> is probed through hardware access, but a device driver can look
> at dev->of_node to see if that contains any further properties.
>

This is very interesting. Spent some time trying to find an example of this
for pci/usb, but drew a blank. Could you point me to an example?

One of our products has pcie ethernet, but we have to patch it so it can
grab its mac address from the bootloader. You are saying that there is
a standard way to accomplish this?
