From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Mon, 20 Feb 2017 21:05:04 +0100
Message-ID: <20170220210504.2473ce90@crub>
References: <1487600724-17607-1-git-send-email-agust@denx.de>
        <1487600724-17607-3-git-send-email-agust@denx.de>
        <CAAtXAHeO_+6ZXP51nxFgyLYR9cjqLrqmoYEniqXmZudF=3uhFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAtXAHeO_+6ZXP51nxFgyLYR9cjqLrqmoYEniqXmZudF=3uhFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Moritz,

On Mon, 20 Feb 2017 09:27:35 -0800
Moritz Fischer mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org wrote:

>Anatolij,
>
>small nits inline.
...

>> +       gpiod_set_value(conf->prog_b, 1);
>> +
>> +       udelay(1); /* min is 500 ns */  
>
>Maybe make this a named constant.

Okay, I can add

  const size_t prog_pulse_us = 1;
  ...
  udelay(prog_pulse_us);

...
>> +       gpiod_set_value(conf->prog_b, 0);
>> +
>> +       if (gpiod_get_value(conf->done)) {
>> +               dev_err(&mgr->dev, "Unexpected DONE pin state...\n");
>> +               return -EIO;
>> +       }
>> +
>> +       /* program latency */
>> +       usleep_range(1000, 1500);  
>
>Same here.

Okay, will change here as well.

Thanks for review! I'll wait some time for more comments and
will submit v3 then.

Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
