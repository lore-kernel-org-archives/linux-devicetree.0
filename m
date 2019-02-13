From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC v7 0/5] pstore/block: new support logger for block devices
Date: Wed, 13 Feb 2019 14:35:14 -0600
Message-ID: <CAL_JsqKqytWzdE1R6t+=U8Qtg2Q4PnjZYU_N9aarq4Mo5L5wLg@mail.gmail.com>
References: <1548245116-6360-1-git-send-email-liaoweixiong@allwinnertech.com> <CAGXu5jLE8dr4+G6fFmwcbm8YAs=RB+OiupyPCX6COhVu6av__w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jLE8dr4+G6fFmwcbm8YAs=RB+OiupyPCX6COhVu6av__w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: liaoweixiong <liaoweixiong@allwinnertech.com>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Arnd Bergmann <arnd@arndb.de>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 12, 2019 at 2:54 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Jan 23, 2019 at 4:06 AM liaoweixiong
> <liaoweixiong@allwinnertech.com> wrote:
> >
> > Why should we need pstore_block?
> > 1. Most embedded intelligent equipment have no persistent ram, which
> > increases costs. We perfer to cheaper solutions, like block devices.
> > In fast, there is already a sample for block device logger in driver
> > MTD (drivers/mtd/mtdoops.c).
> > 2. Do not any equipment have battery, which means that it lost all data
> > on general ram if power failure. Pstore has little to do for these
> > equipments.
> >
> > [PATCH v7]
> > On patch 1:
> > 1. Fix line over 80 characters.
> > On patch 2:
> > 1. Insert a separate patch for DT bindings.
>
> This is looking good. Can you address the DT bindings review concerns,
> and send a v8?

If it was not clear, the DT concerns are this shouldn't be using DT.
There are already industry standard ways to locate a specific region
on block devices. Use those. Then this will work on my PC.

Rob
