From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 00/20] i.MX Media Driver
Date: Mon, 2 Jan 2017 19:09:41 -0200
Message-ID: <CAOMZO5DM4aRwzCWkRoZLmbCxn155YL+CUR_gJyDh+FjzSKD3PQ@mail.gmail.com>
References: <1483050455-10683-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1483050455-10683-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Steve Longerbeam <slongerbeam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devel@driverdev.osuosl.org, Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>, Steve Longerbeam <steve_longerbeam@mentor.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-media <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Steve,

On Thu, Dec 29, 2016 at 8:27 PM, Steve Longerbeam <slongerbeam@gmail.com> wrote:
> This is a media driver for video capture on i.MX.
>
> Refer to Documentation/media/v4l-drivers/imx.rst for example capture
> pipelines on SabreSD, SabreAuto, and SabreLite reference platforms.
>
> This patchset includes the OF graph layout as proposed by Philipp Zabel,
> with only minor changes which are enumerated in the patch header.

Patches 13, 14 and 19 miss your Signed-off-by tag.

Tested the whole series on a mx6qsabresd:

Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
