From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: DTS: vybrid: Update qspi node description for VF610
 BK4 board
Date: Tue, 30 Jul 2019 13:01:19 -0300
Message-ID: <CAOMZO5AoSCDCMRKpkWQ=0PwiFG-O9doGaA31FRhDCGmNr7Xefg@mail.gmail.com>
References: <20190730150552.24927-1-lukma@denx.de> <CAOMZO5AxPHHobQQhq30fjLVeSroLdvdT0+GqCWi8it1ejhDONA@mail.gmail.com>
 <20190730175336.382d833c@jawa>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730175336.382d833c@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Lukasz,

On Tue, Jul 30, 2019 at 12:53 PM Lukasz Majewski <lukma@denx.de> wrote:

> Shall I refer to the original commit (which added this DTS)? Or the
> original issue posted to linux-mtd [1] ?

You can add a Fixes tag like this:

Fixes: a67d2c52a82f ("ARM: dts: Add support for Liebherr's BK4 device
(vf610 based)")
