From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/panel: simple: add lg,acx467akm-7
 panel
Date: Wed, 20 Mar 2019 05:17:27 -0400
Message-ID: <20190320091727.GA13882@basecamp>
References: <20181124200628.24393-1-masneyb@onstation.org>
 <CACRpkdYqxUJKZGHGX0qPVaSVW4vzHYBMp-FARA2uP85W9AX5wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYqxUJKZGHGX0qPVaSVW4vzHYBMp-FARA2uP85W9AX5wA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Dave Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Tue, Mar 05, 2019 at 11:42:15PM +0100, Linus Walleij wrote:
> On Sat, Nov 24, 2018 at 9:06 PM Brian Masney <masneyb@onstation.org> wrote:
> 
> > Add binding for the LG ACX467AKM-7 4.95" 1080×1920 LCD panel that is
> > found on the LG Nexus 5 (hammerhead) phone. This appears to be a JDI
> > panel based on some Internet searches, however a specific model number
> > could not be found. I disassembled an old Nexus 5 with a broken
> > screen and the LG part number is the only model number present on the
> > back of the panel, so I think that is probably the best ID to use.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Tell me if you need me to merge this to the DRM misc tree.

It would be great if you could take this patch, plus the corresponding
change to panel-simple.c [1]

[1] https://lore.kernel.org/lkml/20181124200628.24393-2-masneyb@onstation.org/

Thanks,

Brian
