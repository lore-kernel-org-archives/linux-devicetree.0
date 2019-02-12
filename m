From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] ARM: dts: pfla02: prepare storage devices to add
 paritions
Date: Tue, 12 Feb 2019 08:12:03 +0100
Message-ID: <20190212071202.52ctrzbr4uoi634x@pengutronix.de>
References: <20190204152956.13471-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190204152956.13471-1-m.felsch@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, c.hemp@phytec.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

On Mon, Feb 04, 2019 at 04:29:55PM +0100, Marco Felsch wrote:
> Partitions in the NOR and EEPROM are application specific. Prepare the
> SoM device tree so platform device tree's can add partitions.

Even though there is no in-tree user (and maybe there will never be) I
would like to see this kind of patch applied.

Our usecase is that the paritioning is defined in the bootloader (here:
barebox) and before jumping into Linux the (maybe) provided dts is fixed
up to contain the right partitioning. So the Linux device tree doesn't
usually include the partitioning, but as barebox contains a copy of the
the device tree files from Linux it helps here to simplify the board
specific device tree. So:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
