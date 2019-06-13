From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V3 4/4] dt-bindings: arm: imx: Add the soc binding for
 i.MX8MQ
Date: Thu, 13 Jun 2019 06:54:29 -0600
Message-ID: <CAL_JsqKQgQ=+4xt41_2X3ddsO=rt4u--MJ28+p=is33c1=0DQg@mail.gmail.com>
References: <20190613051344.1170-1-Anson.Huang@nxp.com>
 <20190613051344.1170-4-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190613051344.1170-4-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Bai Ping <ping.bai@nxp.com>, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Leonard Crestez <leonard.crestez@nxp.com>, Fabio Estevam <festevam@gmail.com>, =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Pankaj Bansal <pankaj.bansal@nxp.com>, NXP Linux Team <Linux-imx@nxp.com>, devicetree@vger.kernel.org, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <Michal.Vokac@ysoft.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Vabhav Sharma <vabhav.sharma@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Dong Aisheng <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yang-Leo Li <leoyang.li@nxp.c>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 11:12 PM <Anson.Huang@nxp.com> wrote:
>
> From: Anson Huang <Anson.Huang@nxp.com>
>
> This patch adds the soc & board binding for i.MX8MQ.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch, as I just found i.MX8MQ SoC & board binding is missed, so add this patch
> based on i.MX8MN binding, so put it in same series to avoid dependency issue.
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
