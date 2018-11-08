From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 5/6] dt-bindings: anybuss-host: document
 devicetree binding
Date: Thu, 8 Nov 2018 15:27:17 +0100
Message-ID: <CAK8P3a3QvQrOKeUs-9sFjDdzfesK27VP6fH7KVUjMW-gkmq-=Q@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com>
 <20181104155501.14767-6-TheSven73@googlemail.com> <CAK8P3a1ZUaxJzfzYoqAK+_ZBazHzF6nG1V2aiZSoiQr6nDhiSQ@mail.gmail.com>
 <CAGngYiW5=oc486wq15yLbRLvO243PNALmouTDEh7QpO6GLO9Mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGngYiW5=oc486wq15yLbRLvO243PNALmouTDEh7QpO6GLO9Mg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, noralf@tronnes.org, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.r>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 8, 2018 at 3:21 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> Hi Arnd, thank you for the review and the feedback !
>
> >
> > To allow describing connected devices, I think we need a #address-cells
> > and #size-cells property here, with fixed values.
>
> I'm not sure I understand. Connected devices aren't described in the
> devicetree. The anybus specification defines an id register, which is
> then used to load the client driver automatically, in the manner of
> pci/usb.
>
> In case I have misinterpreted your feedback, could you clarify a bit?

This is related to my reply on another patch of this series. I think it's
likely that you need to be able to describe anybus devices in DT
for additional properties in some cases, even if the common case
doesn't need it.

We do the same thing on PCI and USB, where normally everything
is probed through hardware access, but a device driver can look
at dev->of_node to see if that contains any further properties.

       Arnd
