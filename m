From: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v3 2/2] iio: dac: vf610_dac: Add IIO DAC driver for
 Vybrid SoC
Date: Thu, 25 Feb 2016 21:00:45 +0530
Message-ID: <20160225153045.GA15913@Sanchayan-Arch>
References: <cover.1456121233.git.maitysanchayan@gmail.com>
 <1a70acdd3ffae273bbfe2f80c5e3952d152921df.1456121233.git.maitysanchayan@gmail.com>
 <20160223205437.GA27366@rob-hp-laptop>
 <56CE18AC.6020603@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CE18AC.6020603-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 16-02-24 20:55:08, Jonathan Cameron wrote:
> On 23/02/16 20:54, Rob Herring wrote:
> > On Mon, Feb 22, 2016 at 11:48:37AM +0530, Sanchayan Maity wrote:
> >> Add driver support for DAC peripheral on Vybrid SoC.
> >>
> >> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  Documentation/ABI/testing/sysfs-bus-iio-vf610      |   9 +
> >>  .../devicetree/bindings/iio/dac/vf610-dac.txt      |  20 ++
> > 
> > For the binding:
> > 
> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Applied to the togreg branch of iio.git - initially pushed out as testing
> for the autobuilders to play with it.

Thanks Jonathan.

> 
> Note the dts change probably wants to go via the relevant arch trees.
> I can take it with an appropriate ack if not.

Generally shawn picks up the device tree changes once the driver makes
it to his for-next branch. I will ping shawn to pick this up once the
driver lands in shawn's for-next branch.

Regards,
Sanchayan.
