From: Rob Herring <robh@kernel.org>
Subject: Re: [Letux-kernel] [PATCH RFC] bluetooth: add uart h4 devices via serdev/devicetree
Date: Mon, 12 Nov 2018 18:17:38 -0600
Message-ID: <CABGGisxsdv+BTd5-HMzF8asEcWtL5F4CMzmkrBCwK=NibvqjLQ@mail.gmail.com>
References: <20181110232034.17277-1-andreas@kemnade.info> <20181111024648.7rt7rlhaqihtqecv@earth.universe>
 <20181112215812.18ebca35@aktux> <2C74C837-A6D3-47C9-BE59-CCA594289B94@goldelico.com>
 <20181112222726.73m2oca7hankvcjs@earth.universe>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181112222726.73m2oca7hankvcjs@earth.universe>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.reichel@collabora.com
Cc: hns@goldelico.com, andreas@kemnade.info, devicetree@vger.kernel.org, johan.hedberg@gmail.com, marcel@holtmann.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2018 at 4:27 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Mon, Nov 12, 2018 at 10:19:02PM +0100, H. Nikolaus Schaller wrote:
> > > Am 12.11.2018 um 21:59 schrieb Andreas Kemnade <andreas@kemnade.info>:
> > > On Sun, 11 Nov 2018 03:46:48 +0100
> > > Sebastian Reichel <sebastian.reichel@collabora.com> wrote:
> > >> On Sun, Nov 11, 2018 at 12:20:34AM +0100, Andreas Kemnade wrote:
> > >>> This is a first try to be able to use h4 devices specified in
> > >>> the devicetree, so you do not need to call hciattach and
> > >>> it can be automatically probed.
> > >>>
> > >>> Of course, proper devicetree bindings documentation is
> > >>> missing. And also you would extend that by regulator/
> > >>> enable gpio settings.
> > >>>
> > >>> But before proceeding further it should be checked if the
> > >>> general way of doing things is right.
> > >>>
> > >>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > >>> ---
> > >>
> > >> Patch looks good to me, just one note
> > >>
> > > I found one thing myself:
> > > Shouldn't we have a generic compatible string like "generic-h4".
> > > ehci-platform.c has for example:
> > >        { .compatible = "generic-ehci", },
> >
> > There might be differences in h4 compatible devices (e.g. default
> > baud rate) so that I would not bet there a "generic-h4" suffices
> > in the long run.

It will not because that doesn't define clocks, resets, gpios,
supplies, etc. and the interactions of all those.

> My suggestion is to use this in DT:
>
> compatible = "wi2wi,w2cbw003-bluetooth", "<something generic>";
>
> The driver can start with supporting just the generic compatible
> string. If somebody finds some incompatible differences, the driver
> can add a custom handler for the wi2wi chip without breaking DT
> ABI.

Any idea how many H4 devices there are? Somehow I doubt there are that
many to be unmanageable.

Rob
