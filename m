Return-Path: <SRS0=7eZY=P2=linux.intel.com=jae.hyun.yoo@kernel.org>
Subject: Re: [PATCH v10 10/12] hwmon: Add PECI cputemp driver
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-11-jae.hyun.yoo@linux.intel.com>
 <CANiq72=dA1weOip-YzZRmsOEHOve2FdJh9_qbN2dmH8HR58WYg@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8ef997aa-2971-2907-3821-e71f9e8dd53a@linux.intel.com>
Date: Fri, 18 Jan 2019 09:52:50 -0800
MIME-Version: 1.0
In-Reply-To: <CANiq72=dA1weOip-YzZRmsOEHOve2FdJh9_qbN2dmH8HR58WYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>, "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, David Kershner <david.kershner@unisys.com>, Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, openbmc@lists.ozlabs.org, Alan Cox <alan@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Stef van Os <stef.van.os@prodrive-technologies.com>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

Hi Miguel,

On 1/9/2019 4:57 AM, Miguel Ojeda wrote:
> Hi,
> 
> A few minor nitpicks that you may consider.
> 
> On Mon, Jan 7, 2019 at 10:41 PM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> +       if (priv->temp_config[channel] & BIT(attr))
>> +               if (channel < DEFAULT_CHANNEL_NUMS ||
>> +                   (channel >= DEFAULT_CHANNEL_NUMS &&
>> +                    (priv->core_mask & BIT(channel - DEFAULT_CHANNEL_NUMS))))
>> +                       return 0444;
> 
> Maybe if ((...) && (...)) instead of double if?
> 

Okay, that would be neater. Will change it.

>> +       for (i = 0; i < priv->gen_info->core_max; i++)
>> +               if (priv->core_mask & BIT(i))
>> +                       while (i + DEFAULT_CHANNEL_NUMS >= priv->config_idx)
>> +                               priv->temp_config[priv->config_idx++] =
>> +                                       config_table[channel_core];
> 
> priv->config_idx <= i + DEFAULT_CHANNEL_NUMS seems more readable (i.e.
> the while-loop variable first).
> 

Yeah, that would be better for readability. Will change it too.

>> +static inline bool peci_temp_need_update(struct temp_data *temp)
>> +{
>> +       if (temp->valid &&
>> +           time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
>> +               return false;
>> +
>> +       return true;
>> +}
> 
> Simply return the condition result.
> 

I'm assuming you meant:

return !(temp->valid && time_before(jiffies, temp->last_updated +
                                              UPDATE_INTERVAL));

Will change it as well.

Thanks for your review!

Regards,
Jae
