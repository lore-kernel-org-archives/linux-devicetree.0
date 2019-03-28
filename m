From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/4] dmaengine: imx-sdma: Add clock ratio 1:1 check
Date: Thu, 28 Mar 2019 19:52:03 -0300
Message-ID: <CAOMZO5DPHCReoQtYcRj01rETdF79sba+tHDJCSrVpCLbq4gW0Q@mail.gmail.com>
References: <20190328133828.20999-1-angus@akkea.ca> <20190328133828.20999-3-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328133828.20999-3-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Daniel Baluta <daniel.baluta@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Angus,

On Thu, Mar 28, 2019 at 10:39 AM Angus Ainslie (Purism) <angus@akkea.ca> wrote:
>
> On imx8mq B0 chip, AHB/SDMA clock ratio 2:1 can't be supported,
> since SDMA clock ratio has to be increased to 250Mhz, AHB can't reach
> to 500Mhz, so use 1:1 instead.
>
> To limit this change to the imx8mq for now this patch also adds an
> im8mq-sdma compatible string.
>
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>

This has already been applied and it is in linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20190328&id=25aaa75df1e659901d77085bcdd25eaabf265688

Please send an incremental fix instead.
