From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 00/11] add USB GPIO based connection detection driver
Date: Mon, 5 Aug 2019 12:06:56 +0200
Message-ID: <CACRpkdaBT24JPH_VsKtgp6fjWtVuqM50rXkDVYKmLHgR5hdJzA@mail.gmail.com>
References: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Biju Das <biju.das@bp.renesas.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, moderated list:ARM/Mediatek So
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 10:51 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> Because the USB Connector is introduced and the requirement of
> usb-connector.txt binding, the old way using extcon to support
> USB Dual-Role switch is now deprecated, meanwhile there is no
> available common driver when use Type-B connector, typically
> using an input GPIO to detect USB ID pin.

However while this was going on,
drivers/extcon/extcon-fsa9480.c was merged and that detects
not only GPIO on the USB port but multiplexed usecases such
as UART over the USB micro PHY (and no that UART is not
a USB UART, but an actual RX/TX over D-/D+).

That driver also measure a whole slew of funny resistance
values on the ID pin, that is how it does its job.

But for just "hey I'm plugged in" we can surely keep this
ID on GPIO detection in the USB subsystem.

I just get a bit insecure about how we should ideally
handle these "funny-PHY's".

Yours,
Linus Walleij
