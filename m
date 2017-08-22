From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: Add support for TI LMP92001
Date: Tue, 22 Aug 2017 17:23:18 +0100
Message-ID: <20170822162318.sg7ccobciymy5b7h@dell>
References: <1503383171-15515-1-git-send-email-s.abhisit@gmail.com>
 <20170822150330.00007eeb@huawei.com>
 <CAMV_pUZm2My0CpAr0o6qZTP0A6DLn+LXTvte_8+m=h4Uu6DE4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMV_pUZm2My0CpAr0o6qZTP0A6DLn+LXTvte_8+m=h4Uu6DE4A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Abhisit Sangjan <s.abhisit@gmail.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, robh@kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?iso-8859-1?Q?Jean-Fran=E7ois?= Dagenais <jeff.dagenais@gmail.com>, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 22 Aug 2017, Abhisit Sangjan wrote:

> Hi Jonathan - Thank you for your review, I will clean up and submit again.

Please do not top post, only reply in-line.

Also, when replying to a mail, especially one of this length, please
snip past your last comment.  Some people complain that it's a waste
of data (which I don't really subscribe to TBH), but it certainly is a
waste of people's time.  I just spent a good amount of time scrolling
through your reply looking for a response to Jonathan's review, but
none was found.

> On Tue, Aug 22, 2017 at 9:03 PM, Jonathan Cameron <
> Jonathan.Cameron@huawei.com> wrote:
> 
> > On Tue, 22 Aug 2017 13:26:11 +0700
> > <s.abhisit@gmail.com> wrote:
> >
> > > From: Abhisit Sangjan <s.abhisit@gmail.com>
> > >
> > > TI LMP92001 Analog System Monitor and Controller
> > >
> > > 8-bit GPIOs.
> > > 12 DACs with 12-bit resolution.
> > > The GPIOs and DACs are shared port function with Cy function pin to
> > > take control the pin suddenly from external hardware.
> > > DAC's referance voltage selectable for Internal/External.
> > >
> > > 16 + 1 ADCs with 12-bit resolution.
> > > Built-in internal Temperature Sensor on channel 17.
> > > Windows Comparator Function is supported on channel 1-3 and 9-11 for
> > > monitoring with interrupt signal (pending to implement for interrupt).
> > > ADC's referance voltage selectable for Internal/External.
> > >
> > > Signed-off-by: Abhisit Sangjan <s.abhisit@gmail.com>
> >
> > As Lee said, break this up.  I've done a quick read through but much easier
> > to parse in smaller parts!

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
