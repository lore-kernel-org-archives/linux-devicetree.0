From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 00/11] add USB GPIO based connection detection driver
Date: Tue, 6 Aug 2019 15:26:50 +0200
Message-ID: <CACRpkdZ8LjG22QCA0tB+vMi7fPJNBiX-sL1+t0yZqcfRjMJF7Q@mail.gmail.com>
References: <1563958245-6321-1-git-send-email-chunfeng.yun@mediatek.com>
 <CACRpkdaBT24JPH_VsKtgp6fjWtVuqM50rXkDVYKmLHgR5hdJzA@mail.gmail.com> <1565077710.23705.21.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565077710.23705.21.camel@mhfsdcap03>
Sender: linux-kernel-owner@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Biju Das <biju.das@bp.renesas.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, moderated list:ARM/Mediatek So
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 9:48 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> On Mon, 2019-08-05 at 12:06 +0200, Linus Walleij wrote:
> > On Wed, Jul 24, 2019 at 10:51 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> > But for just "hey I'm plugged in" we can surely keep this
> > ID on GPIO detection in the USB subsystem.
>
> Sorry, you mean provide a common API? could you please describe more
> clearer about your suggestion?

Sorry I am not suggesting anything, this code is fine.

But:

> > I just get a bit insecure about how we should ideally
> > handle these "funny-PHY's".

I am more thinking about which subsystem these things really
belong in. But let's keep it like this for the simple GPIO case.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
