From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] add dts file to enable support for ls1046afrwy board.
Date: Wed, 8 May 2019 11:00:14 -0300
Message-ID: <CAOMZO5C=dAN0LkhbTqCApmhv1msxAC8B2=u6D0gtC2KYV7T-HQ@mail.gmail.com>
References: <20190508135501.17578-1-pramod.kumar_1@nxp.com> <20190508135501.17578-3-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508135501.17578-3-pramod.kumar_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Kumar <pramod.kumar_1@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vabhav Sharma <vabhav.sharma@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Pramod,

On Wed, May 8, 2019 at 10:56 AM Pramod Kumar <pramod.kumar_1@nxp.com> wrote:

> +&fman0 {
> +       ethernet@e0000 {

You have passed @e0000 without a corresponfing reg entry.

This causes dtc build warnings with W=1.

Please make sure you don't introduce new W=1 warnings.
