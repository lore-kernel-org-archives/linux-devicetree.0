From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 00/10] iio mount matrix - revitalize missing bindings
 documentation and provide code for bmc150, bmg160, bma180, itg3200, hmc584x
Date: Fri, 22 Feb 2019 17:24:10 +0100
Message-ID: <CACRpkdbb_7JZ=TdtAfqRJZ5C3JjORqKbOqZZP71+_v+0QLpUQg@mail.gmail.com>
References: <cover.1550768574.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550768574.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>li
List-Id: devicetree@vger.kernel.org

On Thu, Feb 21, 2019 at 6:03 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> Fixes V2:
> * make get_mount_matrix() functions more readable (use temp variable)
>   (suggested by Jonathan and Andy)
> * add these readability improvements also for ak8975 and mpu6050
>   (suggested by Jonathan and Andy)
> * squash bindings documentation into single commit for better discussion
>   (suggested by Linus)
> * FOR DISCUSSION: add some more clarifications to the bindings documentation
>   and an attempt to define the magnetometer orientation
> * add "iio: Allow to read mount matrix from ACPI" to the beginning of
>   the series to make it compile
>   (suggested by Andy)
> * replace of_iio_read_mount_matrix() by iio_read_mount_matrix()
>   (required by "iio: Allow to read mount matrix from ACPI")
> * drop patch to convert bma180 to devm (potential race)
>   (suggested by Jonathan)

I'm a big fan of this series and I really like what you did with my old
patch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
