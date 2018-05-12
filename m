Return-Path: <jic23@kernel.org>
Date: Sat, 12 May 2018 11:03:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2] iio: potentiostat: lmp91000: add LMP91002 support
Message-ID: <20180512110339.4992392b@archlinux>
In-Reply-To: <20180508154256.GA28095@rob-hp-laptop>
References: <20180508053401.32485-1-matt.ranostay@konsulko.com>
	<20180508154256.GA28095@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: Matt Ranostay <matt.ranostay@konsulko.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, 8 May 2018 10:42:56 -0500
Rob Herring <robh@kernel.org> wrote:

> On Mon, May 07, 2018 at 10:34:01PM -0700, Matt Ranostay wrote:
> > LMP91002 is register compatible so add devicetree and i2c client ids
> > 
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > ---
> > 
> > Changes from v1:
> > * Split out compatible options in multiple lines for the lmp91000.txt documentation
> > 
> >  Documentation/devicetree/bindings/iio/potentiostat/lmp91000.txt | 9 ++++++---
> >  drivers/iio/potentiostat/lmp91000.c                             | 2 ++
> >  2 files changed, 8 insertions(+), 3 deletions(-)  
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan
