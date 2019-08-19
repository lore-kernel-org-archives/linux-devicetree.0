From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 03/21] ARM: dts: imx7-colibri: prepare module device
 tree for FlexCAN
Date: Mon, 19 Aug 2019 13:09:34 +0200
Message-ID: <20190819110934.GM5999@X250>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-4-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190812142105.1995-4-philippe.schenker@toradex.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Max Krummenacher <max.krummenacher@toradex.com>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:21:18PM +0000, Philippe Schenker wrote:
> Prepare FlexCAN use on SODIMM 55/63 178/188. Those SODIMM pins are
> compatible for CAN bus use with several modules from the Colibri
> family.
> Add Better drivestrength and also add flexcan2.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Applied, thanks.
