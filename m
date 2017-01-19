From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
Date: Thu, 19 Jan 2017 11:56:08 -0600
Message-ID: <20170119175608.5okfpsfutv7oawoo@rob-hp-laptop>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
 <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>, linux-mtd@lists.infradead.org, kernel@pengutronix.de, Geert Uytterhoeven <geert@linux-m68k.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Jagan Teki <jagan@openedev.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 17, 2017 at 12:03:38PM +0100, Uwe Kleine-K=F6nig wrote:
> The MR25 family doesn't support JEDEC, so they need explicit mentioning
> in the list of supported spi IDs. This makes it possible to add these
> using for example:
> =

> 	compatible =3D "everspin,mr25h40";
> =

> There was already an entry for mr25h256. Move that one out of the "keep
> for compatibility" section and put in a new group for Everspin MRAMs.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1:
> =

>  - use Kib instead of kib
> =

> Changes since v2:
> =

>  - update dt docs
>  - handle already existing mr25h256 in m25p_ids[]
> =

> Thanks to Cyrille for catching these.
> =

>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>  drivers/mtd/devices/m25p80.c                            | 6 +++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
