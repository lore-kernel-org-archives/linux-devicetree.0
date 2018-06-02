From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH 1/2] clk: imx6ul: add GPIO clock gates
Date: Sat, 2 Jun 2018 16:04:13 +0200
Message-ID: <CAOf5uwneWyjNpD-tGGL7CgL2_jJFvDtzbi+NBg7wqGMGR4qGCw@mail.gmail.com>
References: <1526959560-6014-1-git-send-email-Anson.Huang@nxp.com>
 <1439344955.9677.1526991935718@email.1und1.de> <CAOMZO5BVhjwGpJ22qBihKcjWyvBkzNPU0cNtNY9HToLLEkYByA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BVhjwGpJ22qBihKcjWyvBkzNPU0cNtNY9HToLLEkYByA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Anson Huang <Anson.Huang@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi

On Sat, Jun 2, 2018 at 3:48 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Stefan,
>
> On Tue, May 22, 2018 at 9:25 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
>>> --- a/include/dt-bindings/clock/imx6ul-clock.h
>>> +++ b/include/dt-bindings/clock/imx6ul-clock.h
>>> @@ -242,20 +242,25 @@
>>>  #define IMX6UL_CLK_CKO2_PODF         229
>>>  #define IMX6UL_CLK_CKO2                      230
>>>  #define IMX6UL_CLK_CKO                       231
>>> +#define IMX6UL_CLK_GPIO1             232
>>> +#define IMX6UL_CLK_GPIO2             233
>>> +#define IMX6UL_CLK_GPIO3             234
>>> +#define IMX6UL_CLK_GPIO4             235
>>> +#define IMX6UL_CLK_GPIO5             236
>>
>> this change looks like a breakage of devicetree ABI. You are changing the mean of the existing clock IDs on i.MX6ULL, which probably regress the combination of older DTBs with newer kernel.
>
> Good point! I will send a fix for f5a4670de96678 ("clk: imx: Add new
> clo01 and clo2 controlled
> by CCOSR") which did the same reordering.
>

ull is a preatty new platform so one board was listed. Are you sure
that we need?

Michael

> Thanks



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
