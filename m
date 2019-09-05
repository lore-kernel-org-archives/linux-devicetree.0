From: Oliver Graute <oliver.graute@kococonnector.com>
Subject: Re: [PATCH v1] watchdog: imx_sc: this patch just fixes whitespaces
Date: Thu, 5 Sep 2019 14:35:37 +0000
Message-ID: <20190905143525.GE23537@optiplex>
References: <20190905073730.22258-1-oliver.graute@kococonnector.com>
 <016e268c-f289-4127-a47e-3d8faa790ded@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <016e268c-f289-4127-a47e-3d8faa790ded@roeck-us.net>
Content-Language: en-US
Content-ID: <B922D784E86B724A8F2E4DD058D40B93@eurprd09.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 05/09/19, Guenter Roeck wrote:
> On 9/5/19 12:44 AM, Oliver Graute wrote:
> > Fix only whitespace errors in imx_sc_wdt_probe()
> > 
> > Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
> 
> This patch no longer applies due to commit "watchdog: imx_sc: Remove
> unnecessary error log".
> 

ok I'll rebase patch against linux-staging/watchdog-next

Best regards,

Oliver
