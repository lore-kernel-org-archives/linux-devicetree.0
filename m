From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 4/4] thermal: qoriq: Add clock operations
Date: Tue, 30 Jul 2019 00:56:33 -0300
Message-ID: <CAOMZO5D33zPEu8zkq-KYvDv4Xzd8OoshSbzOCrBw1hwwJr-qNg@mail.gmail.com>
References: <20190729083915.4855-1-Anson.Huang@nxp.com> <20190729083915.4855-4-Anson.Huang@nxp.com>
 <CAOMZO5AgP0BrHyFKz78rsEz1XQMgSNzMmtTV6Q+GYtCGBiFMEQ@mail.gmail.com> <DB3PR0402MB39161F938C25012015B9739CF5DC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB39161F938C25012015B9739CF5DC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "rui.zhang" <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Tue, Jul 30, 2019 at 12:00 AM Anson Huang <anson.huang@nxp.com> wrote:

> Shawn already applied the patch, and Abel has the AHB clock patch to fix that,
> so just wait for the AHB clock patch in instead of revert the TMU clock patch?

Sorry, I don't understand Abel's patch as there is not a proper
description of what it tries to fix.

If I understand correctly Abel's patch is not the proper fix and the
real fix for the kernel TMU hang in linux-next is to manage the TMU
clock inside the TMU driver, like you did in this patch.

To avoid a revert one possible solution would be to send only this one
as a fix for 5.3. You can point that it Fixes the commit that adds
i.MX8M support for the TMU driver.
