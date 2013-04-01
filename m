From: Anton Vorontsov <anton@enomsg.org>
Subject: Re: [PATCH 2/2] power_supply: tps65090: Setup compatible property
 for dt
Date: Sun, 31 Mar 2013 23:18:04 -0700
Message-ID: <20130401061803.GB30190@lizard>
References: <1363897985-19980-1-git-send-email-rklein@nvidia.com>
 <1363897985-19980-2-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363897985-19980-2-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2013 at 04:33:05PM -0400, Rhyland Klein wrote:
> Setup the compatible property so that when this device is registered
> through device tree, it can match the expected compatiblity string
> used in the tps65090 driver.
>=20
> Signed-off-by: Rhyland Klein <rklein@nvidia.com>
> ---
>  drivers/power/tps65090-charger.c |   10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/power/tps65090-charger.c b/drivers/power/tps6509=
0-charger.c
> index 0c66c66..3b3dafd 100644
> --- a/drivers/power/tps65090-charger.c
> +++ b/drivers/power/tps65090-charger.c
> @@ -204,7 +204,7 @@ static int tps65090_charger_probe(struct platform=
_device *pdev)
> =20
>  	pdata =3D dev_get_platdata(pdev->dev.parent);
> =20
> -	if (!pdata && tps65090_mfd->dev->of_node)
> +	if (!pdata && pdev->dev.of_node)

  CC      drivers/power/tps65090-charger.o
drivers/power/tps65090-charger.c: In function =E2=80=98tps65090_charger=
_probe=E2=80=99:
drivers/power/tps65090-charger.c:198:19: warning: unused variable =E2=80=
=98tps65090_mfd=E2=80=99 [-Wunused-variable]

=2E..I fixed this up and applied the patches.

Thanks!

Anton
