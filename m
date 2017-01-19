From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx7s-warp: Fix watchdog pinmux
Date: Thu, 19 Jan 2017 09:56:35 -0200
Message-ID: <CAOMZO5D9UAi_mJ4UmVuUXT-=dcvSjFyPDwLssyBL1Nr88kQpQQ@mail.gmail.com>
References: <20170119090924.19636-1-s.hauer@pengutronix.de>
 <20170119090924.19636-2-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170119090924.19636-2-s.hauer@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 7:09 AM, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> The watchdog pin is controlled by the iomuxc_lpsr, not the regular
> iomux, so move it there.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
