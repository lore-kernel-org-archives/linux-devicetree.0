From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v4 4/9] staging:iio:ad7780: add chip ID values and mask
Date: Sun, 3 Mar 2019 14:53:47 +0000
Message-ID: <20190303145347.41d49646@archlinux>
References: <cover.1551358569.git.renatogeh@gmail.com>
 <90c573cd53bb54d49de6ac270bcff66880ccfeb5.1551358569.git.renatogeh@gmail.com>
 <190e26b19b8ed6559b92d3a000d852bbb0099a52.camel@analog.com>
 <20190303140107.ljjo3flatwmd44ya@renatolg>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190303140107.ljjo3flatwmd44ya@renatolg>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "lars@metafoo.de" <lars@metafoo.de>, "Hennerich,
 Michael" <Michael.Hennerich@analog.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "kernel-usp@googlegroups.com" <kernel-usp@googlegroups.com>, "Ardelean,
 Alexandru" <Alex.Ardelean@analog.com>, "giuliano.belinassi@usp.br" <giuliano.belinassi@usp.br>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>
List-Id: devicetree@vger.kernel.org

On Sun, 3 Mar 2019 11:01:09 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> On 03/01, Ardelean, Alexandru wrote:
> >On Thu, 2019-02-28 at 11:24 -0300, Renato Lui Geh wrote:  
> >>
> >>
> >> The ad7780 supports both the ad778x and ad717x families. Each chip has
> >> a corresponding ID. This patch provides a mask for extracting ID values
> >> from the status bits and also macros for the correct values for the
> >> ad7170, ad7171, ad7780 and ad7781.
> >>
> >> Signed-off-by: Renato Lui Geh <renatogeh@gmail.com>
> >> ---
> >>  drivers/staging/iio/adc/ad7780.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/staging/iio/adc/ad7780.c
> >> b/drivers/staging/iio/adc/ad7780.c
> >> index 56c49e28f432..ad7617a3a141 100644
> >> --- a/drivers/staging/iio/adc/ad7780.c
> >> +++ b/drivers/staging/iio/adc/ad7780.c
> >> @@ -26,10 +26,14 @@
> >>  #define AD7780_RDY             BIT(7)
> >>  #define AD7780_FILTER          BIT(6)
> >>  #define AD7780_ERR             BIT(5)
> >> -#define AD7780_ID1             BIT(4)
> >> -#define AD7780_ID0             BIT(3)
> >>  #define AD7780_GAIN            BIT(2)
> >>
> >> +#define AD7170_ID              0
> >> +#define AD7171_ID              1
> >> +#define AD7780_ID              1
> >> +#define AD7781_ID              0
> >> +
> >> +#define AD7780_ID_MASK         (BIT(3) | BIT(4))  
> >
> >This also doesn't have any functionality change.
> >The AD7170_ID, AD7171_ID, AD7780_ID & AD7781_ID IDs are also unused (maybe
> >in a later patch they are ?).  
> 
> They aren't. I added them following a previous review suggestion. Should
> I remove them?

Can we check them?  It's always useful to confirm that the device is
the one you think it is.  Then we can either use what is there
with a suitable warning, or if that is tricky just fault out as the
dt is giving us the wrong part number.

J

> >
> >I would also leave the AD7780_ID1 & AD7780_ID0 definitions in place, since
> >they're easier matched with the datasheet.
> >  
> >>
> >>  #define AD7780_PATTERN_GOOD    1
> >>  #define AD7780_PATTERN_MASK    GENMASK(1, 0)
> >> --
> >> 2.21.0
> >>  
