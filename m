From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 1/1] spi: initialize of_node in spi_alloc_master
Date: Thu, 14 Oct 2010 08:08:50 -0600
Message-ID: <AANLkTinuCazEW6HbSAUZ0Qnf1qLOtOD81zZHcycXdUVr@mail.gmail.com>
References: <1287045461-20470-1-git-send-email-jonas@southpole.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1287045461-20470-1-git-send-email-jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 14, 2010 at 2:37 AM, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org> wrote:
> spi_alloc_master should do the work of setting the of_node on the device =
if
> it is set on the incoming parent.
>
> Signed-off-by: Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>

Hi Jonas.

Thanks for the patch, but I have to nack it.  The way it is done right
now is by design.  Each spi bus driver is responsible to ensure that
the correct device tree node is used for the spi bus, which is not
necessarily the same node as the bus controller node (depending on the
binding).  The bus driver always needs the ability to use a different
node, or to omit OF registrations entirely.

Cheers,
g.

> ---
> =A0drivers/spi/mpc512x_psc_spi.c | =A0 =A01 -
> =A0drivers/spi/mpc52xx_psc_spi.c | =A0 =A01 -
> =A0drivers/spi/mpc52xx_spi.c =A0 =A0 | =A0 =A01 -
> =A0drivers/spi/spi.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A03 +++
> =A0drivers/spi/spi_mpc8xxx.c =A0 =A0 | =A0 =A01 -
> =A0drivers/spi/spi_ppc4xx.c =A0 =A0 =A0| =A0 =A01 -
> =A0drivers/spi/xilinx_spi.c =A0 =A0 =A0| =A0 =A03 ---
> =A07 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/spi/mpc512x_psc_spi.c b/drivers/spi/mpc512x_psc_spi.c
> index 77d9e7e..1ab1807 100644
> --- a/drivers/spi/mpc512x_psc_spi.c
> +++ b/drivers/spi/mpc512x_psc_spi.c
> @@ -441,7 +441,6 @@ static int __devinit mpc512x_psc_spi_do_probe(struct =
device *dev, u32 regaddr,
> =A0 =A0 =A0 =A0master->setup =3D mpc512x_psc_spi_setup;
> =A0 =A0 =A0 =A0master->transfer =3D mpc512x_psc_spi_transfer;
> =A0 =A0 =A0 =A0master->cleanup =3D mpc512x_psc_spi_cleanup;
> - =A0 =A0 =A0 master->dev.of_node =3D dev->of_node;
>
> =A0 =A0 =A0 =A0tempp =3D ioremap(regaddr, size);
> =A0 =A0 =A0 =A0if (!tempp) {
> diff --git a/drivers/spi/mpc52xx_psc_spi.c b/drivers/spi/mpc52xx_psc_spi.c
> index 983fbbf..44077f8 100644
> --- a/drivers/spi/mpc52xx_psc_spi.c
> +++ b/drivers/spi/mpc52xx_psc_spi.c
> @@ -398,7 +398,6 @@ static int __init mpc52xx_psc_spi_do_probe(struct dev=
ice *dev, u32 regaddr,
> =A0 =A0 =A0 =A0master->setup =3D mpc52xx_psc_spi_setup;
> =A0 =A0 =A0 =A0master->transfer =3D mpc52xx_psc_spi_transfer;
> =A0 =A0 =A0 =A0master->cleanup =3D mpc52xx_psc_spi_cleanup;
> - =A0 =A0 =A0 master->dev.of_node =3D dev->of_node;
>
> =A0 =A0 =A0 =A0mps->psc =3D ioremap(regaddr, size);
> =A0 =A0 =A0 =A0if (!mps->psc) {
> diff --git a/drivers/spi/mpc52xx_spi.c b/drivers/spi/mpc52xx_spi.c
> index ec9f0b1..b46dbd0 100644
> --- a/drivers/spi/mpc52xx_spi.c
> +++ b/drivers/spi/mpc52xx_spi.c
> @@ -438,7 +438,6 @@ static int __devinit mpc52xx_spi_probe(struct platfor=
m_device *op,
> =A0 =A0 =A0 =A0master->setup =3D mpc52xx_spi_setup;
> =A0 =A0 =A0 =A0master->transfer =3D mpc52xx_spi_transfer;
> =A0 =A0 =A0 =A0master->mode_bits =3D SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST;
> - =A0 =A0 =A0 master->dev.of_node =3D op->dev.of_node;
>
> =A0 =A0 =A0 =A0dev_set_drvdata(&op->dev, master);
>
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index b5a78a1..28f9d1a 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -482,6 +482,9 @@ struct spi_master *spi_alloc_master(struct device *de=
v, unsigned size)
> =A0 =A0 =A0 =A0device_initialize(&master->dev);
> =A0 =A0 =A0 =A0master->dev.class =3D &spi_master_class;
> =A0 =A0 =A0 =A0master->dev.parent =3D get_device(dev);
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 master->dev.of_node =3D dev->of_node;
> +#endif
> =A0 =A0 =A0 =A0spi_master_set_devdata(master, &master[1]);
>
> =A0 =A0 =A0 =A0return master;
> diff --git a/drivers/spi/spi_mpc8xxx.c b/drivers/spi/spi_mpc8xxx.c
> index 1dd86b8..5a35741 100644
> --- a/drivers/spi/spi_mpc8xxx.c
> +++ b/drivers/spi/spi_mpc8xxx.c
> @@ -1014,7 +1014,6 @@ mpc8xxx_spi_probe(struct device *dev, struct resour=
ce *mem, unsigned int irq)
> =A0 =A0 =A0 =A0master->setup =3D mpc8xxx_spi_setup;
> =A0 =A0 =A0 =A0master->transfer =3D mpc8xxx_spi_transfer;
> =A0 =A0 =A0 =A0master->cleanup =3D mpc8xxx_spi_cleanup;
> - =A0 =A0 =A0 master->dev.of_node =3D dev->of_node;
>
> =A0 =A0 =A0 =A0mpc8xxx_spi =3D spi_master_get_devdata(master);
> =A0 =A0 =A0 =A0mpc8xxx_spi->dev =3D dev;
> diff --git a/drivers/spi/spi_ppc4xx.c b/drivers/spi/spi_ppc4xx.c
> index 80e172d..ca18432 100644
> --- a/drivers/spi/spi_ppc4xx.c
> +++ b/drivers/spi/spi_ppc4xx.c
> @@ -407,7 +407,6 @@ static int __init spi_ppc4xx_of_probe(struct platform=
_device *op,
> =A0 =A0 =A0 =A0master =3D spi_alloc_master(dev, sizeof *hw);
> =A0 =A0 =A0 =A0if (master =3D=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> - =A0 =A0 =A0 master->dev.of_node =3D np;
> =A0 =A0 =A0 =A0dev_set_drvdata(dev, master);
> =A0 =A0 =A0 =A0hw =3D spi_master_get_devdata(master);
> =A0 =A0 =A0 =A0hw->master =3D spi_master_get(master);
> diff --git a/drivers/spi/xilinx_spi.c b/drivers/spi/xilinx_spi.c
> index 80f2db5..1b47363 100644
> --- a/drivers/spi/xilinx_spi.c
> +++ b/drivers/spi/xilinx_spi.c
> @@ -390,9 +390,6 @@ struct spi_master *xilinx_spi_init(struct device *dev=
, struct resource *mem,
>
> =A0 =A0 =A0 =A0master->bus_num =3D bus_num;
> =A0 =A0 =A0 =A0master->num_chipselect =3D pdata->num_chipselect;
> -#ifdef CONFIG_OF
> - =A0 =A0 =A0 master->dev.of_node =3D dev->of_node;
> -#endif
>
> =A0 =A0 =A0 =A0xspi->mem =3D *mem;
> =A0 =A0 =A0 =A0xspi->irq =3D irq;
> --
> 1.7.1
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
