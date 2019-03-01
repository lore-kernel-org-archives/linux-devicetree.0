From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4 1/9] staging: iio: ad7780: add gain & filter gpio
 support
Date: Fri, 1 Mar 2019 10:42:02 +0300
Message-ID: <20190301074024.GA9828@kadam>
References: <cover.1551358569.git.renatogeh@gmail.com>
 <b83c0558a600cb44677b0d06f31e014be550b8bf.1551358569.git.renatogeh@gmail.com>
 <4f945f058c8536a2731c4de3e0b9227a41cd2891.camel@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <4f945f058c8536a2731c4de3e0b9227a41cd2891.camel@analog.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: "Ardelean, Alexandru" <Alex.Ardelean@analog.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "lars@metafoo.de" <lars@metafoo.de>, "Hennerich,
 Michael" <Michael.Hennerich@analog.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-usp@googlegroups.com" <kernel-usp@googlegroups.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "giuliano.belinassi@usp.br" <giuliano.belinassi@usp.br>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "renatogeh@gmail.com" <renatogeh@gmail.com>, "Popa,
 Stefan Serban" <StefanSerban.Popa@analog.com>, "jic23@kernel.org" <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 01, 2019 at 06:56:14AM +0000, Ardelean, Alexandru wrote:
> On Thu, 2019-02-28 at 11:23 -0300, Renato Lui Geh wrote:
> > 
> > 
> > Previously, the AD7780 driver only supported gpio for the 'powerdown'
> > pin. This commit adds suppport for the 'gain' and 'filter' pin.
> > 
> > Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
> > Signed-off-by: Giuliano Belinassi <giuliano.belinassi@usp.br>
> > Co-developed-by: Giuliano Belinassi <giuliano.belinassi@usp.br>
> > ---
> > Changes in v3:
> >  - Renamed ad7780_chip_info's filter to odr
> >  - Renamed ad778x_filter to ad778x_odr_avail
> >  - Changed vref variable from unsigned int to unsigned long long to avoid
> >    overflow
> >  - Removed unnecessary AD_SD_CHANNEL macro
> > Changes in v4:
> >  - Removed useless macro
> >  - Added default case for switch to suppress warning
> >  - Removed chunks belonging to filter reading, adding these as a
> >    patch for itself
> > 
> >  drivers/staging/iio/adc/ad7780.c | 90 +++++++++++++++++++++++++++++---
> >  1 file changed, 84 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/staging/iio/adc/ad7780.c
> > b/drivers/staging/iio/adc/ad7780.c
> > index c4a85789c2db..87fbcf510d45 100644
> > --- a/drivers/staging/iio/adc/ad7780.c
> > +++ b/drivers/staging/iio/adc/ad7780.c
> > @@ -39,6 +39,12 @@
> >  #define AD7170_PATTERN         (AD7780_PAT0 | AD7170_PAT2)
> >  #define AD7170_PATTERN_MASK    (AD7780_PAT0 | AD7780_PAT1 | AD7170_PAT2)
> > 
> > +#define AD7780_GAIN_MIDPOINT   64
> > +#define AD7780_FILTER_MIDPOINT 13350
> > +
> > +static const unsigned int ad778x_gain[2]      = { 1, 128 };
> > +static const unsigned int ad778x_odr_avail[2] = { 10000, 16700 };
> 
> ad778x_odr_avail[2] is not used in this patch, so it should probably go
> into the next one 
> (i.e. staging: iio: ad7780: add filter reading to ad778x )
> 
> one good way of catching stuff like this is to do interactive rebase and
> compile your driver on each patch to see if the compiler catches this;
> i suspect the compiler would have thrown an error for this change
> 

GCC (v7.3) doesn't complain about unused variables if they're const.

regards,
dan carpenter
