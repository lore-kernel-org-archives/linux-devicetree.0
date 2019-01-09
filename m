Return-Path: <SRS0=/bsn=PR=gmail.com=miguel.ojeda.sandonis@kernel.org>
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com> <20190107214136.5256-11-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-11-jae.hyun.yoo@linux.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Jan 2019 13:57:09 +0100
Message-ID: <CANiq72=dA1weOip-YzZRmsOEHOve2FdJh9_qbN2dmH8HR58WYg@mail.gmail.com>
Subject: Re: [PATCH v10 10/12] hwmon: Add PECI cputemp driver
Content-Type: text/plain; charset="UTF-8"
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Kishon Vijay Abraham I <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>, "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, David Kershner <david.kershner@unisys.com>, Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, openbmc@lists.ozlabs.org, Alan Cox <alan@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, Stef van Os <stef.van.os@prodrive-technologies.com>, Haiyue Wang <haiyue.wang@linux.intel.com>, James Feist <james.feist@linux.intel.com>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

A few minor nitpicks that you may consider.

On Mon, Jan 7, 2019 at 10:41 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> +       if (priv->temp_config[channel] & BIT(attr))
> +               if (channel < DEFAULT_CHANNEL_NUMS ||
> +                   (channel >= DEFAULT_CHANNEL_NUMS &&
> +                    (priv->core_mask & BIT(channel - DEFAULT_CHANNEL_NUMS))))
> +                       return 0444;

Maybe if ((...) && (...)) instead of double if?

> +       for (i = 0; i < priv->gen_info->core_max; i++)
> +               if (priv->core_mask & BIT(i))
> +                       while (i + DEFAULT_CHANNEL_NUMS >= priv->config_idx)
> +                               priv->temp_config[priv->config_idx++] =
> +                                       config_table[channel_core];

priv->config_idx <= i + DEFAULT_CHANNEL_NUMS seems more readable (i.e.
the while-loop variable first).

> +static inline bool peci_temp_need_update(struct temp_data *temp)
> +{
> +       if (temp->valid &&
> +           time_before(jiffies, temp->last_updated + UPDATE_INTERVAL))
> +               return false;
> +
> +       return true;
> +}

Simply return the condition result.

Cheers,
Miguel
