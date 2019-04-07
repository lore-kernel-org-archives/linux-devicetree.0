From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 00/10] iio mount matrix - revitalize missing bindings
 documentation and provide code for bmc150, bmg160, bma180, itg3200, hmc584x
Date: Sun, 7 Apr 2019 12:41:57 +0100
Message-ID: <20190407124157.1b3f1cd3@archlinux>
References: <cover.1550768574.git.hns@goldelico.com>
        <CAHp75VeMTd32S+bTgU2f1AS-NB67iuM+erT8qNJgPS7O0E1Cjg@mail.gmail.com>
        <20190303153201.440ac325@archlinux>
        <3A50A918-61AB-4710-B9DA-DF041A898944@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3A50A918-61AB-4710-B9DA-DF041A898944@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio <linux-iio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 4 Apr 2019 08:29:12 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi Jonathan,
> 
> > Am 03.03.2019 um 16:32 schrieb Jonathan Cameron <jic23@kernel.org>:
> > 
> > Thanks to Linus and Andy for reviews.
> > I've picked up all but they documentation patch.  I think
> > it is 'very nearly there', but would like a few really minor
> > tweaks.  Seemed silly to stall the other patches on that though!  
> 
> Seems they have stalled elsewhere since they did not yet arrive in linux-next.
The iio tree is not directly pulled into linux-next.  Hence IIO patches
only turn up there once I've sent a pull request to Greg and they have
entered the staging-next tree.

They still haven't quite made it into linux-next, but I'd imagine they
will tomorrow.

Jonathan

> 
> The documentation patch is still on my todo list and will need a little more time
> but that should not block the others.
Absolutely, this was just tree handling delays and me messing up a pull
request to slow things down even more.

Jonathan

> 
> BR and thanks,
> Nikolaus
> 
