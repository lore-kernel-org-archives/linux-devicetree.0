From: delicious quinoa <delicious.quinoa@gmail.com>
Subject: Re: [PATCH v8] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Thu, 5 Dec 2013 16:53:01 -0600
Message-ID: <CANk1AXRJK+Zy2FYEn5jBevUr5Dr_tNeFf9=GbOnzxgiSOw7j8w@mail.gmail.com>
References: <1386088876-29205-1-git-send-email-delicious.quinoa@gmail.com>
	<1386088876-29205-2-git-send-email-delicious.quinoa@gmail.com>
	<20131205165439.GB5924@maple>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131205165439.GB5924@maple>
Sender: linux-doc-owner@vger.kernel.org
To: Jamie Iles <jamie@jamieiles.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 5, 2013 at 10:54 AM, Jamie Iles <jamie@jamieiles.com> wrote:
> Hi Alan,
>
> One minor comment below, otherwise looks great!
>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>
>
> Thanks,
>
> Jamie
>
> On Tue, Dec 03, 2013 at 10:41:16AM -0600, Alan Tull wrote:
>> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
>> new file mode 100644
>> index 0000000..e6dc61f
>> --- /dev/null
>> +++ b/drivers/gpio/gpio-dwapb.c
> ...
>> +static unsigned int dwapb_gpio_nr_ports(struct device_node *of_node)
>> +{
>> +     unsigned int nr_ports = 0;
>> +     struct device_node *np;
>> +
>> +     for_each_child_of_node(of_node, np)
>> +             ++nr_ports;
>> +
>> +     return nr_ports;
>> +}
>
> I notice that we now have of_get_child_count() which didn't exist when I
> first wrote the driver, we could use that now.

Thanks Jamie.

I'll include that in v8.  I'll post that within a few days.

Alan
