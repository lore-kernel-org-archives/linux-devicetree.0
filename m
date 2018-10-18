From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH V2] ARM: dts: imx6qdl-icore: Add missing stdout-path
 property
Date: Thu, 18 Oct 2018 20:45:32 +0200
Message-ID: <20181018184532.xe2llbhwjuffgchx@pengutronix.de>
References: <20181018150305.21408-1-shyam.saini@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181018150305.21408-1-shyam.saini@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com, kernel@pengutronix.de, l.stach@pengutronix.de, fabio.estevam@nxp.com, michael@amarulasolutions.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, jagan@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Thu, Oct 18, 2018 at 08:33:05PM +0530, Shyam Saini wrote:
> This would help us to get early boot logs by passing "earlycon" to
> kernel bootargs.
> =

> Further, by adding this we don't have to depend on complex earlyprintk
> configs for early boot logs.
> =

> Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>

minor nit: your S-o-b line should be the last thing you write. So it's

	Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
	Reviewed-by: Fabio Estevam <festevam@gmail.com>
	Signed-off-by: John Maintainer <john@example.org>

if John added the Reviewed-by tag and =


	Reviewed-by: Fabio Estevam <festevam@gmail.com>
	Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
	Signed-off-by: John Maintainer <john@example.org>

if it was you.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
