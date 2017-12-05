From: Tyler Baker <tyler@opensourcefoundries.com>
Subject: Re: [PATCH 4/8] ARM: dts: imx7s: add dma support
Date: Tue, 5 Dec 2017 12:59:06 -0800
Message-ID: <CAH=dhFR1Js-O5udMUPdFygz4GYuu32YricR6k-PV20sfddkL7w@mail.gmail.com>
References: <20171130201434.14122-1-tyler@opensourcefoundries.com>
 <20171130201434.14122-5-tyler@opensourcefoundries.com> <CAOMZO5BVK=KHJ7ohdCE=LRpo25FrM9d_vGSTm-GFpM6=wyvbuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BVK=KHJ7ohdCE=LRpo25FrM9d_vGSTm-GFpM6=wyvbuA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 1, 2017 at 12:17 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Thu, Nov 30, 2017 at 6:14 PM,  <tyler@opensourcefoundries.com> wrote:
>> From: Tyler Baker <tyler@opensourcefoundries.com>
>>
>> Enable dma on all SPI and UART interfaces.
>
> You only touched SPI ports, not the UART.

I'll update the commit message, thanks.
