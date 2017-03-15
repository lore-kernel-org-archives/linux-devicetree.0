From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/4] iio: accel: adxl345: Setup DATA_READY trigger
Date: Wed, 15 Mar 2017 13:06:18 +0200
Message-ID: <CAHp75VcUApPamBGTY0zwqeOn+P3G4OcDbS__+=RZ+t_3uAi5Qg@mail.gmail.com>
References: <1489403497-27849-1-git-send-email-eraretuya@gmail.com>
 <1489403497-27849-4-git-send-email-eraretuya@gmail.com> <CAHp75Vcz1RTdncG5L1S7q2LVHK6TEA813pjTpue4n3DDcCrMAg@mail.gmail.com>
 <20170315094923.GA3080@Socrates-UM>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170315094923.GA3080@Socrates-UM>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Michael Hennerich <michael.hennerich@analog.com>, Daniel Baluta <daniel.baluta@gmail.com>, Alison Schofield <amsfield22@gmail.com>, Florian Vaussard <florian.vaussard@heig-vd.ch>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 15, 2017 at 11:49 AM, Eva Rachel Retuya <eraretuya@gmail.com> wrote:
> On Mon, Mar 13, 2017 at 02:12:54PM +0200, Andy Shevchenko wrote:
>> On Mon, Mar 13, 2017 at 1:11 PM, Eva Rachel Retuya <eraretuya@gmail.com> wrote:

> Hello Andy,
> Thanks for the review.

You are welcome!

>> > +static irqreturn_t adxl345_irq(int irq, void *p)
>> > +{
>> > +       struct iio_dev *indio_dev = p;
>> > +       struct adxl345_data *data = iio_priv(indio_dev);
>> > +       int ret = IRQ_NONE;
>> > +       u32 int_stat;
>> > +
>>
>> > +       ret = regmap_read(data->regmap, ADXL345_REG_INT_SOURCE, &int_stat);
>>
>> > +       if (ret < 0)
>> > +               return ret;
>>
>> It makes little sense AFAIU.
>>
>
> Can you please elaborate further your comment regarding this?

It's defined as enum and returned value is not in a range.

Also it would be useful to look at kernel/irq/manage.c for the
implementation details.

>> P.S. Are you doing this stuff on your own or you are working for some
>> company? If the latter applies, please, consider to do *internal*
>> review first.

> I'm doing it on my own as a project for Outreachy and have mentors to ask
> for advice and/or questions.

Ah, okay, that is fine then!

-- 
With Best Regards,
Andy Shevchenko
