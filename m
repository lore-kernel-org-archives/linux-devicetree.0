From: Andy Tang <andy.tang@nxp.com>
Subject: RE: [PATCH 2/2 v2] clk: qoriq: Separate root input clock for core
 PLLs on ls1012a
Date: Thu, 1 Jun 2017 08:34:24 +0000
Message-ID: <HE1PR0402MB282824858F29C431E97DBF07F3F60@HE1PR0402MB2828.eurprd04.prod.outlook.com>
References: <1489977443-33582-1-git-send-email-andy.tang@nxp.com>
 <1489977443-33582-2-git-send-email-andy.tang@nxp.com>
 <20170601082804.GE20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170601082804.GE20170@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Scott Wood <oss@buserror.net>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Thanks for your applying.

There are other two patches sent on April 6, 2017:
https://patchwork.kernel.org/patch/9665973/
https://patchwork.kernel.org/patch/9665977/

Hope they are in your review queue. Please give it a review.

Regards,
Andy

-----Original Message-----
From: Stephen Boyd [mailto:sboyd@codeaurora.org]=20
Sent: Thursday, June 01, 2017 4:28 PM
To: Andy Tang <andy.tang@nxp.com>
Cc: mturquette@baylibre.com; robh+dt@kernel.org; mark.rutland@arm.com; linu=
x-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel=
.org; linux-arm-kernel@lists.infradead.org; Scott Wood <oss@buserror.net>
Subject: Re: [PATCH 2/2 v2] clk: qoriq: Separate root input clock for core =
PLLs on ls1012a

On 03/20, Yuantian Tang wrote:
> From: Scott Wood <oss@buserror.net>
>=20
> ls1012a has separate input root clocks for core PLLs versus the=20
> platform PLL, with the latter described as sysclk in the hw docs.
> If a second input clock, named "coreclk", is present, this clock will=20
> be used for the core PLLs.
>=20
> Signed-off-by: Scott Wood <oss@buserror.net>
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next

--
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux =
Foundation Collaborative Project
