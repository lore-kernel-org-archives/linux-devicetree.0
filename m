From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 0/6] power: add power sequence library
Date: Thu, 28 Jul 2016 13:41:23 -0300
Message-ID: <CAOMZO5Dv_X-u6qKqAWtysAqmMw91bVoAaRvnc81yUGDxbd27rA@mail.gmail.com>
References: <1469007629-31757-1-git-send-email-peter.chen@nxp.com> <579A2B38.3000202@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <579A2B38.3000202@gmail.com>
Sender: linux-pm-owner@vger.kernel.org
To: Joshua Clayton <stillcompiling@gmail.com>
Cc: Peter Chen <peter.chen@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, USB list <linux-usb@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Troy
List-Id: devicetree@vger.kernel.org

Hi Joshua,

On Thu, Jul 28, 2016 at 12:56 PM, Joshua Clayton
<stillcompiling@gmail.com> wrote:

> I assume there is a v4 coming due to rmk's comments on patch 5.
> I couldn't figure out where to null the of_node in error paths, but in testing
> we did put a line of code to null the of_node on release.
>
> but...
> As an aside,
> I was hoping this series would magically fix a problem
> with the imx6q-evi which has forced us to disable
> runtime power management. But it did not. :(

I also see a similar problem on a mx28 board with a hub.

Does it help in your case if you pass 'usbcore.autosuspend=-1' in the
kernel command line?

Regards,

Fabio Estevam
