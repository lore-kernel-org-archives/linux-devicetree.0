From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/panel: simple: add lg,acx467akm-7 panel
Date: Wed, 17 Apr 2019 23:04:05 +0200
Message-ID: <CACRpkdbc97ypN0D=HH=J6m=wUQq2mGJO16Eit_nUTFH2FUrQEg@mail.gmail.com>
References: <20181124200628.24393-1-masneyb@onstation.org> <CACRpkdYqxUJKZGHGX0qPVaSVW4vzHYBMp-FARA2uP85W9AX5wA@mail.gmail.com>
 <20190320091727.GA13882@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320091727.GA13882@basecamp>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Dave Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 20, 2019 at 10:17 AM Brian Masney <masneyb@onstation.org> wrote=
:
> On Tue, Mar 05, 2019 at 11:42:15PM +0100, Linus Walleij wrote:
> > On Sat, Nov 24, 2018 at 9:06 PM Brian Masney <masneyb@onstation.org> wr=
ote:
> >
> > > Add binding for the LG ACX467AKM-7 4.95" 1080=C3=971920 LCD panel tha=
t is
> > > found on the LG Nexus 5 (hammerhead) phone. This appears to be a JDI
> > > panel based on some Internet searches, however a specific model numbe=
r
> > > could not be found. I disassembled an old Nexus 5 with a broken
> > > screen and the LG part number is the only model number present on the
> > > back of the panel, so I think that is probably the best ID to use.
> > >
> > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Tell me if you need me to merge this to the DRM misc tree.
>
> It would be great if you could take this patch, plus the corresponding
> change to panel-simple.c [1]
>
> [1] https://lore.kernel.org/lkml/20181124200628.24393-2-masneyb@onstation=
.org/

Both patches applied to drm-misc-next (will be in v5.2). Sorry for taking s=
o
long, I had some urgent other priorities.

Yours,
Linus Walleij
