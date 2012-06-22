From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RESEND] of: add const to struct of_device_id.data
Date: Fri, 22 Jun 2012 07:56:13 +0200
Message-ID: <20120622055613.GL5642@pengutronix.de>
References: <1335171381-24869-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20120607102014.GI22191@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120607102014.GI22191@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>
Cc: kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Thu, Jun 07, 2012 at 12:20:14PM +0200, Uwe Kleine-K=F6nig wrote:
> Drivers should never need to modify the data of a device id. So it ca=
n
> be const which in turn allows more consts in the driver.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> (Cc +=3D lkml + Grant)
>=20
> Hello,
>=20
> this might introduce warnings in drivers that access the data member
> without using const, so this is definitly merge window material if it=
 is
> considered at all.
ping

Best regards
Uwe

>  include/linux/mod_devicetable.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devi=
cetable.h
> index 501da4c..183f411 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -222,7 +222,7 @@ struct of_device_id
>  	char	type[32];
>  	char	compatible[128];
>  #ifdef __KERNEL__
> -	void	*data;
> +	const void *data;
>  #else
>  	kernel_ulong_t data;
>  #endif
> --=20
> 1.7.10
>=20
>=20
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig      =
      |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
