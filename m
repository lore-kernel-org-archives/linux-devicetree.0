From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: fsl: imx8mq: enable the thermal management
 unit (TMU)
Date: Tue, 12 Mar 2019 17:32:23 -0300
Message-ID: <CAOMZO5B3DohJ73wdnp2qm+-6b_B3hw38YOi=52dHA9NzUFVEnw@mail.gmail.com>
References: <20190311213124.29325-1-angus@akkea.ca> <CAHQ1cqEHr1mB2EH3-fJPrYa+nkcWPPjmCTjSt-XsDnJp-SCf+w@mail.gmail.com>
 <9f25fb1a0acb35539dcd802502c49058@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9f25fb1a0acb35539dcd802502c49058@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, dl-linux-imx <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Angus,

On Tue, Mar 12, 2019 at 5:19 PM Angus Ainslie <angus@akkea.ca> wrote:

> I tried applying those to linux-next. They don't apply very cleanly
> there so I gave up.

You need to apply this commit first:
https://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal.git/patch/?id=7797ff424818c975b59c35880dbc90fe08350204
