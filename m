From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v5 1/3] nvmem: dt: document SNVS LPGPR binding
Date: Mon, 19 Jun 2017 16:02:29 +0200
Message-ID: <f83cae78-4422-ce07-7a39-92ba70be8de6@i2se.com>
References: <20170609125730.25502-1-o.rempel@pengutronix.de>
 <20170609125730.25502-2-o.rempel@pengutronix.de>
 <8e50ff3d-d1f0-2795-5dc9-302979ca9694@i2se.com>
 <20170619060629.du3qmihhkkyym44h@pengutronix.de>
 <b8d7d65c-93c8-8b62-abb4-09d60c32bf84@i2se.com>
 <CAOMZO5Dd243VXCYBigTcFJ2aF4prZhWYtOuw7Z86M4X6nEXB=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5Dd243VXCYBigTcFJ2aF4prZhWYtOuw7Z86M4X6nEXB=A@mail.gmail.com>
Content-Language: de-DE
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>, Oleksij Rempel <ore@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Am 19.06.2017 um 14:52 schrieb Fabio Estevam:
> Hi Stefan,
>
> On Mon, Jun 19, 2017 at 7:58 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
>> do you know how the clock "lp_ipg_clk_s" should be handled?
> As per the Reference Manual there is no CCM gating bits for this clock.


I was only surprised that there is no clock handling in the driver.
Sorry, about that noise.
