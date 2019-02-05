From: Chris Spencer <spencercw@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add RTC support
Date: Tue, 5 Feb 2019 13:48:42 +0000
Message-ID: <CAGUNXRSvtEG95XG+y3DDza4gXu6nyZcGUPiPwKRqp5PgGTu8ig@mail.gmail.com>
References: <1548946870-29037-1-git-send-email-abel.vesa@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548946870-29037-1-git-send-email-abel.vesa@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Baruch Siach <baruch@tkos.co.il>, dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>
List-Id: devicetree@vger.kernel.org

On Thu, 31 Jan 2019 at 15:03, Abel Vesa <abel.vesa@nxp.com> wrote:
> Add RTC support for i.MX8MQ.
>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Tested on my i.MX8MQ-EVK. The system time is now retained between
reboots, but not if the system is fully powered down. Judging by the
absence of coin battery on the board I'm guessing the SNVS is simply
not powered when the main supply is turned off, in which case this
isn't a problem.

Tested-by: Chris Spencer <christopher.spencer@sea.co.uk>
