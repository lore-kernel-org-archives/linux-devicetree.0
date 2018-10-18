From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: Add missing stdout-path property
Date: Thu, 18 Oct 2018 11:55:22 -0300
Message-ID: <CAOMZO5Di60q+ma2ASe-PbSitAPMEBvWN1Sa2uQY6CKN6rEkSgg@mail.gmail.com>
References: <20181018145128.21117-1-shyam.saini@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181018145128.21117-1-shyam.saini@amarulasolutions.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shyam Saini <shyam.saini@amarulasolutions.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 11:52 AM Shyam Saini
<shyam.saini@amarulasolutions.com> wrote:
>
> This would help us to get early boot logs by passing "earlycon" to
> kernel bootargs.
>
> Further, by adding this we don't have to depend on complex earlyprintk
> configs for early boot logs.
>
> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>

In the Subject please mention the board name:

ARM: dts: imx6qdl-icore: Add missing stdout-path property

With this change in place then you can add:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
