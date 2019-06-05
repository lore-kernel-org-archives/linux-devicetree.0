From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: imx6sx-udoo-neo: enable i2c-2 and i2c-4 for
 onboard sensors
Date: Wed, 5 Jun 2019 12:19:38 -0300
Message-ID: <CAOMZO5AtsCBdxD_O_ke8hEZMx8Mzhj1V1T5XZ0RkSw+y7+VG0g@mail.gmail.com>
References: <20190601070718.26971-1-pbrobinson@gmail.com>
 <20190601070718.26971-3-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190601070718.26971-3-pbrobinson@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 1, 2019 at 4:07 AM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The i2c2 bus has a external plug which enables the easy connection of external
> "bricks" with sensors of various kinds, while i2c4 on the Extended/Full boards
> has a pair of on board motion sensors, accelerometer and magnetometer on one chip
> and gyroscope on another so it makes sense to enable these i2c buses for use.
> Tested on UDOO Neo Full.
>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
