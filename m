From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 3/5] dt-bindings: timer: add i.MX EPIT timer binding
Date: Mon, 11 Jun 2018 12:10:42 -0600
Message-ID: <20180611181042.GA30888@rob-hp-laptop>
References: <20180607140544.22268-1-peron.clem@gmail.com>
 <20180607140544.22268-4-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180607140544.22268-4-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?iso-8859-1?Q?Cl=E9ment?= Peron <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 07, 2018 at 04:05:42PM +0200, Clément Péron wrote:
> From: Clément Peron <clement.peron@devialet.com>
> 
> Add devicetree binding document for NXP's i.MX SoC specific
> EPIT timer driver.
> 
> Signed-off-by: Clément Peron <clement.peron@devialet.com>
> ---
>  .../devicetree/bindings/timer/fsl,imxepit.txt | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/fsl,imxepit.txt

Reviewed-by: Rob Herring <robh@kernel.org>
