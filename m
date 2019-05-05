From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: isl29018: convert bindings to YAML
 format
Date: Sun, 5 May 2019 12:42:07 +0100
Message-ID: <20190505124207.650e6a83@archlinux>
References: <20190427182359.27254-1-masneyb@onstation.org>
        <CAL_Jsq+Wzc8W11E0XYg5bKfGoYNxFu0U0-Rdk5PqXZf40W21ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Wzc8W11E0XYg5bKfGoYNxFu0U0-Rdk5PqXZf40W21ZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Brian Masney <masneyb@onstation.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Mark Rutland <mark.rutland@arm.com>, Anson Huang <anson.huang@nxp.com>, "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Apr 2019 07:44:14 -0500
Rob Herring <robh+dt@kernel.org> wrote:

> On Sat, Apr 27, 2019 at 1:25 PM Brian Masney <masneyb@onstation.org> wrote:
> >
> > Convert the isl29018 device tree bindings to the new YAML format.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> > I'm willing to be listed as the maintainer since this is one of the
> > drivers that I moved out out of staging unless one of the original
> > authors wants to be listed instead.
> >
> > I added the BSD-2-Clause to the new binding document. I wrote the
> > original document and the only commit since then was from Rob in
> > commit 791d3ef2e111 ("dt-bindings: remove 'interrupt-parent' from
> > bindings")
> >
> >  .../bindings/iio/light/isl29018.txt           | 27 ---------
> >  .../bindings/iio/light/isl29018.yaml          | 56 +++++++++++++++++++
> >  2 files changed, 56 insertions(+), 27 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/iio/light/isl29018.txt
> >  create mode 100644 Documentation/devicetree/bindings/iio/light/isl29018.yaml  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
Applied to the togreg branch of iio.git and pushed out as testing for
the autobuilders to play with it.

Thanks,

Jonathan
