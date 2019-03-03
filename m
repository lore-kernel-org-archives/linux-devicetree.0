From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 00/10] iio mount matrix - revitalize missing bindings
 documentation and provide code for bmc150, bmg160, bma180, itg3200, hmc584x
Date: Sun, 3 Mar 2019 15:32:01 +0000
Message-ID: <20190303153201.440ac325@archlinux>
References: <cover.1550768574.git.hns@goldelico.com>
        <CAHp75VeMTd32S+bTgU2f1AS-NB67iuM+erT8qNJgPS7O0E1Cjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeMTd32S+bTgU2f1AS-NB67iuM+erT8qNJgPS7O0E1Cjg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio <linux-iio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Feb 2019 16:48:14 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Thu, Feb 21, 2019 at 7:04 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >
> > Fixes V2:
> > * make get_mount_matrix() functions more readable (use temp variable)
> >   (suggested by Jonathan and Andy)
> > * add these readability improvements also for ak8975 and mpu6050
> >   (suggested by Jonathan and Andy)
> > * squash bindings documentation into single commit for better discussion
> >   (suggested by Linus)
> > * FOR DISCUSSION: add some more clarifications to the bindings documentation
> >   and an attempt to define the magnetometer orientation
> > * add "iio: Allow to read mount matrix from ACPI" to the beginning of
> >   the series to make it compile
> >   (suggested by Andy)
> > * replace of_iio_read_mount_matrix() by iio_read_mount_matrix()
> >   (required by "iio: Allow to read mount matrix from ACPI")
> > * drop patch to convert bma180 to devm (potential race)
> >   (suggested by Jonathan)
> >
> > PATCH V1 2019-02-20 15:01:02:
> > This patch series adds the mount-matrix to several iio sensor drivers
> > used in handheld devices.
> >
> > The mount-matrix translates the quite arbitrary orientation of the sensor
> > on some printed circuit board to user-tangible orientation in handheld
> > devices that relates to typical screen orientation.
> >
> > There was a bindings documentation by Linus Walleij but the patch
> > did not make it into mainline. Therefore I resend it here.
> >
> > Next I have added some clarifications (at least I hope it clarifies)
> > in a second patch.
> >
> > Finally, the patch set implements the hooks for the mount matrix
> > in several iio drivers: bmc150, bma180, bmg160, itg3200, hmc5843.
> > This includes also one patch for the bma180 to convert it to devm API.
> >
> > We use them in different variants of the omap3-gta04 so a separate
> > patch set will provide device tree additions for them.
> >  
> 
> Thank you, it looks nice.
> FWIW,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 

Thanks to Linus and Andy for reviews.
I've picked up all but they documentation patch.  I think
it is 'very nearly there', but would like a few really minor
tweaks.  Seemed silly to stall the other patches on that though!

Thanks,

Jonathan
