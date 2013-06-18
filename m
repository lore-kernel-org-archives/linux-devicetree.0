From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v3 2/2] i2c: designware: add two optional property
 tx/rx-fifo-size
Date: Tue, 18 Jun 2013 18:22:58 +0200
Message-ID: <20130618162257.GF7718@katana>
References: <1370918230-24793-1-git-send-email-zhangfei.gao@linaro.org>
 <1370918230-24793-3-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6238680365223771222=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1370918230-24793-3-git-send-email-zhangfei.gao@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, baruch@tkos.co.il, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============6238680365223771222==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sDKAb4OeUBrWWL6P"
Content-Disposition: inline


--sDKAb4OeUBrWWL6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 10:37:10AM +0800, Zhangfei Gao wrote:
> rx-fifo-size and tx-fifo-size will be updated if provided from dts
>=20
> Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> CC: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../devicetree/bindings/i2c/i2c-designware.txt     |    7 +++++++
>  drivers/i2c/busses/i2c-designware-platdrv.c        |    3 +++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/D=
ocumentation/devicetree/bindings/i2c/i2c-designware.txt
> index e42a2ee..84717fe 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
> @@ -6,6 +6,11 @@ Required properties :
>   - reg : Offset and length of the register set for the device
>   - interrupts : <IRQ> where IRQ is the interrupt number.
> =20
> +Optional properties:
> +
> + - rx-fifo-size : 1 cell, Rx fifo size
> + - tx-fifo-size : 1 cell, Tx fifo size
> +

I'd think the bindings are okay, yet I wonder they are not more used in
practice. So, an ack from a dt-expert would be appreciated.

>  Recommended properties :
> =20
>   - clock-frequency : desired I2C bus clock frequency in Hz.
> @@ -18,5 +23,7 @@ Example :
>  		compatible =3D "snps,designware-i2c";
>  		reg =3D <0xf0000 0x1000>;
>  		interrupts =3D <11>;
> +		rx-fifo-size =3D <16>;
> +		tx-fifo-size =3D <16>;
>  		clock-frequency =3D <400000>;
>  	};
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/bu=
sses/i2c-designware-platdrv.c
> index 41659c0..6760cea 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -85,6 +85,7 @@ static int dw_i2c_probe(struct platform_device *pdev)
>  	struct dw_i2c_dev *dev;
>  	struct i2c_adapter *adap;
>  	struct resource *mem;
> +	struct device_node *np =3D pdev->dev.of_node;
>  	int irq, r;
> =20
>  	/* NOTE: driver uses the static register mapping */
> @@ -140,6 +141,8 @@ static int dw_i2c_probe(struct platform_device *pdev)
>  		dev->rx_fifo_depth =3D ((param1 >> 8)  & 0xff) + 1;
>  		dev->adapter.nr =3D pdev->id;
>  	}
> +	of_property_read_u32(np, "rx-fifo-size", &dev->rx_fifo_depth);
> +	of_property_read_u32(np, "tx-fifo-size", &dev->tx_fifo_depth);

Those can fail.

>  	r =3D i2c_dw_init(dev);
>  	if (r)
>  		return r;
> --=20
> 1.7.9.5
>=20

--sDKAb4OeUBrWWL6P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRwIlhAAoJEBQN5MwUoCm2BjQP/ApnqIEv1Z23wU4SjynOEOqB
CNcCgZue0J6mAB/20gyvdjrfRl5mEPPakDarOmosWaUQexy8pLOELMudokCEdYoW
nubae0aMaxG66DjYYeYkHaTo79QuP/lAy1dZU33Jnve44c9UyQi5nvhrkmcL/HzQ
knekhmr7coavgwbFGGQrVKlUCclOU514O5/0mFJZoSHmsAFrxMkuhLwZwDN056xX
1ezbwRlPCLYQPAl6ycxy1q/NcWfIC2aNM4JQgMgj6kV5Qw5tuX2tpb1kPApdNWV7
4I83wjUmY4sQWtpmRn3IAtMmi3fH/82PSfZb0bnhB8mHpH91yiMWmXGGf6HeMA1P
eg6HH+tJZdVJGUosRsyugxLw/7Zjy8NxEBvzANylsz15vvn7asY0CtLyqmciWmi3
GsT/JOccofCzH2NvZ21jbDCrSHektIKapElkyQbFQGLfoHPQAoNIMXxklvfWuYHP
dqHQy7iYog50L6BY/xtz9NX/eYY3FNZcBECZTq0mg1Bw3+EPCdzKQhd0rJONPnjV
/g7Ji+lA974SnlyIGtPUvE9Kg7qQHx4l1VyhP4nE8fKWl22S2TLiqR5vUXqDbn7a
BIbRACrk+XUi0ofRt0hIRyax2SedNCMu2RrplUrvYqYQkOmzKl+5zND8BsVMEwcY
C/3d1BCkXLnQ6HL43H+T
=Whes
-----END PGP SIGNATURE-----

--sDKAb4OeUBrWWL6P--


--===============6238680365223771222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6238680365223771222==--
