From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6sll-evk: make pfuze100 sw4 always on
Date: Mon, 25 Jun 2018 09:22:47 -0300
Message-ID: <CAOMZO5Coi-LRXG8vepnm-eSSx75LLEtsZ90WrtK6rEy76u+OBQ@mail.gmail.com>
References: <1529648932-4832-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529648932-4832-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Fri, Jun 22, 2018 at 3:28 AM, Anson Huang <Anson.Huang@nxp.com> wrote:
> On i.MX6SLL EVK board, PFuze100's SW4 is supplying
> LPDDR3, it needs to be always on. This patch fixes
> Linux kernel boot up hang caused by SW4 being turned
> off:
>
> [    1.693613] cfg80211: failed to load regulatory.db
> [    1.700063] SW4: disabling
> [    1.703973] SWBST: disabling

It would be nice to mention in the commit log what was the patch that
caused the breakage, just like Robin did for imx6sl-evk.

Thanks,
