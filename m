From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH 1/3] mfd: bd718x7: Remove hardcoded config for button
 press duration
Date: Mon, 20 May 2019 09:11:48 +0000
Message-ID: <67cb37340895aa6a2f0f005945e72dc1ee72253e.camel@fi.rohmeurope.com>
References: <cover.1558341613.git.leonard.crestez@nxp.com>
 <ed27e04ba7486cce7860197bc8c76bcedafde398.1558341613.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ed27e04ba7486cce7860197bc8c76bcedafde398.1558341613.git.leonard.crestez@nxp.com>
Content-Language: de-DE
Content-ID: <07E3616871749845AB212EDAA1F64813@de.rohmeurope.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, "lee.jones@linaro.org" <lee.jones@linaro.org>
Cc: "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "yibin.gong@nxp.com" <yibin.gong@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2019-05-20 at 08:55 +0000, Leonard Crestez wrote:
> The reset button on imx8mm-evk is tied to PWRON_B pin of bd71847 and
> the
> long press duration is set to zero from OTP. The linux driver
> overrides
> those values and breaks reset from button.
> 
> Overwriting OTP or bootloader configuration with some hardcoded
> defaults
> is not desirable, keep already programmed values instead.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
Acked-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
