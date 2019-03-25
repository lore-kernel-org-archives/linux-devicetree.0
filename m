From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 2/2] rtc: Add ASPEED RTC driver
Date: Mon, 25 Mar 2019 15:28:26 +0000
Message-ID: <CACPK8XfFTF2hDzwO33gE=fotEEC-CZztThoaYj98Le9JAsAQ-w@mail.gmail.com>
References: <20190325133159.10653-1-joel@jms.id.au>
 <20190325133159.10653-3-joel@jms.id.au>
 <20190325145954.GM30105@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325145954.GM30105@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-aspeed@lists.ozlabs.org, devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 25 Mar 2019 at 14:59, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> This seems mostly good to me.
>
> On 26/03/2019 00:01:59+1030, Joel Stanley wrote:
> > +     dev_dbg(dev, "%s: %4d-%02d-%02d %02d:%02d:%02d\n", __func__,
> > +                     1900 + tm->tm_year, tm->tm_mon + 1, tm->tm_mday,
> > +                     tm->tm_hour, tm->tm_min, tm->tm_sec);
> > +
>
> We now have %ptR, could you use that?

I tried this:

  dev_dbg(dev, "%s: %ptR", __func__, tm);

Yes, that appears to do the job. Can you make the change when applying?

>
> > +     rtc->rtc_dev->ops = &aspeed_rtc_ops;
> > +     rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
> > +     rtc->rtc_dev->range_max = 38814989399LL; /* 3199-12-31 23:59:59 */
> > +
>
> I'm curious how many RTC have been properly designed, could you run
> rtc-range?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tree/rtc-range.c

It appears to pass the test:

Testing 2000-02-28 23:59:59.
OK

Testing 2038-01-19 03:14:07.
OK

Testing 2069-12-31 23:59:59.
OK

Testing 2099-12-31 23:59:59.
OK

Testing 2100-02-28 23:59:59.
OK

Testing 2106-02-07 06:28:15.
OK

Testing 2262-04-11 23:47:16.
OK

The qemu model I have for the device failed though. A good test! Are
you going to put it in the kernel tree?

Cheers,

Joel
