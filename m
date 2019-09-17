From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH v3 1/5] i3c: master: detach/free devices fail on
 pre_assign_dyn_addr()
Date: Tue, 17 Sep 2019 10:02:34 +0000
Message-ID: <SN6PR12MB26553AEDB14A6B6275AA98CCAE8F0@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567608245.git.vitor.soares@synopsys.com>
 <d16914bbe06cf82cdbf9a0480310bd9cc2e4d8a9.1567608245.git.vitor.soares@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d16914bbe06cf82cdbf9a0480310bd9cc2e4d8a9.1567608245.git.vitor.soares@synopsys.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vitor Soares <Vitor.Soares@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "pgaj@cadence.com" <pgaj@cadence.com>, Joao Pinto <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

From: Vitor Soares <vitor.soares@synopsys.com>
Date: Thu, Sep 05, 2019 at 11:00:34

> As for today, the I3C framework is keeping in memory and master->bus.devs
> list the devices that fail during pre_assign_dyn_addr() and send them on
> DEFSLVS command.
>=20
> According to MIPI I3C Bus spec the DEFSLVS command is used to inform any
> Secondary Master about the Dynamic Addresses that were assigned to I3C
> devices and the I2C devices present on the bus.
>=20
> This issue could be fixed by changing i3c_master_defslvs_locked() to
> ignore unaddressed i3c devices but the i3c_dev_desc would be allocated an=
d
> attached to HC unnecessarily. This can cause that some HC aren't able to
> do DAA for HJ capable devices due to lack of space in controller.
>=20
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
> Changes in v3:
>   - Change commit message
>=20
> Changes in v2:
>   - Move out detach/free the i3c_dev_desc from pre_assign_dyn_addr()
>   - Convert i3c_master_pre_assign_dyn_addr() to return an int
>=20
>  drivers/i3c/master.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 5f4bd52..586e34f 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1426,19 +1426,19 @@ static void i3c_master_detach_i2c_dev(struct i2c_=
dev_desc *dev)
>  		master->ops->detach_i2c_dev(dev);
>  }
> =20
> -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> +static int i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
>  {
>  	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
>  	int ret;
> =20
>  	if (!dev->boardinfo || !dev->boardinfo->init_dyn_addr ||
>  	    !dev->boardinfo->static_addr)
> -		return;
> +		return 0;
> =20
>  	ret =3D i3c_master_setdasa_locked(master, dev->info.static_addr,
>  					dev->boardinfo->init_dyn_addr);
>  	if (ret)
> -		return;
> +		return ret;
> =20
>  	dev->info.dyn_addr =3D dev->boardinfo->init_dyn_addr;
>  	ret =3D i3c_master_reattach_i3c_dev(dev, 0);
> @@ -1449,10 +1449,12 @@ static void i3c_master_pre_assign_dyn_addr(struct=
 i3c_dev_desc *dev)
>  	if (ret)
>  		goto err_rstdaa;
> =20
> -	return;
> +	return 0;
> =20
>  err_rstdaa:
>  	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> +
> +	return ret;
>  }
> =20
>  static void
> @@ -1647,7 +1649,7 @@ static int i3c_master_bus_init(struct i3c_master_co=
ntroller *master)
>  	enum i3c_addr_slot_status status;
>  	struct i2c_dev_boardinfo *i2cboardinfo;
>  	struct i3c_dev_boardinfo *i3cboardinfo;
> -	struct i3c_dev_desc *i3cdev;
> +	struct i3c_dev_desc *i3cdev, *i3ctmp;
>  	struct i2c_dev_desc *i2cdev;
>  	int ret;
> =20
> @@ -1746,8 +1748,14 @@ static int i3c_master_bus_init(struct i3c_master_c=
ontroller *master)
>  	 * Pre-assign dynamic address and retrieve device information if
>  	 * needed.
>  	 */
> -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> -		i3c_master_pre_assign_dyn_addr(i3cdev);
> +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> +				 common.node) {
> +		ret =3D i3c_master_pre_assign_dyn_addr(i3cdev);
> +		if (ret) {
> +			i3c_master_detach_i3c_dev(i3cdev);
> +			i3c_master_free_i3c_dev(i3cdev);
> +		}
> +	}
> =20
>  	ret =3D i3c_master_do_daa(master);
>  	if (ret)
> --=20
> 2.7.4

I think I clearly explain why the current solution is problematic and my=20
choices for the proposal solution.
Please let me know if there is anything else that I can improve in this=20
patch.

Best regards,
Vitor Soares
