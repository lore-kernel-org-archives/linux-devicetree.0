From: =?UTF-8?Q?Pawe=C5=82?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH v2 0/2] extcon: Add fsa9480 extcon driver
Date: Fri, 28 Jun 2019 14:45:19 +0200
Message-ID: <3193437b89fdb22ccc69d654153e5b2b692d207b.camel@gmail.com>
References: <20190621111352.22976-1-pawel.mikolaj.chmiel@gmail.com>
         <CACRpkdYD7Z7XX9wXFtBehJG_4NCt=m_MNsR5cESPRnO3tomKmQ@mail.gmail.com>
         <20190628123738.GA25339@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190628123738.GA25339@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Donggeun Kim <dg77.kim@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2019-06-28 at 14:37 +0200, Greg KH wrote:
> On Fri, Jun 28, 2019 at 11:28:11AM +0100, Linus Walleij wrote:
> > On Fri, Jun 21, 2019 at 12:14 PM Paweł Chmiel
> > <pawel.mikolaj.chmiel@gmail.com> wrote:
> > 
> > > This small patchset adds support for Fairchild Semiconductor
> > > FSA9480
> > > microUSB switch.
> > > 
> > > It has been tested on Samsung Galaxy S and Samsung Fascinate 4G,
> > > but it can be found also on other Samsung Aries (s5pv210) based
> > > devices.
> > > 
> > > Tomasz Figa (2):
> > >   dt-bindings: extcon: Add support for fsa9480 switch
> > >   extcon: Add fsa9480 extcon driver
> > 
> > This is surely an important driver since almost all elder Samsung
> > mobiles use this kind of switch. So
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > This driver I see is already sent to Greg for inclusion in the next
> > kernel.
> > I just wonder if you guys are even aware of this driver for the
> > same
> > hardware added by Donggeun Kim in 2011:
> > drivers/misc/fsa9480.c
Yes, new one is based on this driver (plus device tree and regmap).
Originally this new driver was written for 3.18 kernel.
> > 
> > That said I am all for pulling in this new driver because it is
> > surely
> > better and supports device tree.
> > 
> > But can we please also send Greg a patch to delete the old driver
> > so we don't have two of them now?
> > 
> > The old driver have no in-tree users so it can be deleted without
> > side effects. Out-of-tree users can certainly adapt to the new
> > extcon driver.
> > 
> > If you want I can send a deletion patch for the misc driver?
If You could do this (and maybe it'll get merged faster) i'll be great.

Thanks
> 
> Please, I'll gladly take a patch that deletes code :)If You ca
>
> thanks,
> 
> greg k-h
