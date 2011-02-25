From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] dt: add a match table pointer to struct device
Date: Fri, 25 Feb 2011 08:46:52 -0700
Message-ID: <AANLkTikauP8+PgFyicdSQzJ19ZvqpV=3ZnRTjSvY78qc@mail.gmail.com>
References: <20110223025233.25131.47193.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110223025233.25131.47193.stgit@localhost6.localdomain6>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Greg, any thoughts on this change?  I'd like to take it via my tree so
I can finally dump the last vestiges of of_platform_bus_type.

Thanks,
g.

On Tue, Feb 22, 2011 at 7:52 PM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> Add a new .of_match field to struct device which points at the
> matching device driver .of_match_table entry when a device is probed
> via the device tree
>
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
> =A0include/linux/device.h =A0 =A0| =A0 =A01 +
> =A0include/linux/of_device.h | =A0 =A05 +++--
> =A02 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/device.h b/include/linux/device.h
> index ca5d252..8d8e267 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -441,6 +441,7 @@ struct device {
> =A0 =A0 =A0 =A0struct dev_archdata =A0 =A0 archdata;
>
> =A0 =A0 =A0 =A0struct device_node =A0 =A0 =A0*of_node; /* associated =
device tree node */
> + =A0 =A0 =A0 const struct of_device_id *of_match; /* matching of_dev=
ice_id from driver */
>
> =A0 =A0 =A0 =A0dev_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devt; =A0 /*=
 dev_t, creates the sysfs "dev" */
>
> diff --git a/include/linux/of_device.h b/include/linux/of_device.h
> index 975d347..8bfe6c1 100644
> --- a/include/linux/of_device.h
> +++ b/include/linux/of_device.h
> @@ -18,10 +18,11 @@ extern void of_device_make_bus_id(struct device *=
dev);
> =A0* @drv: the device_driver structure to test
> =A0* @dev: the device structure to match against
> =A0*/
> -static inline int of_driver_match_device(const struct device *dev,
> +static inline int of_driver_match_device(struct device *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 const struct device_driver *drv)
> =A0{
> - =A0 =A0 =A0 return of_match_device(drv->of_match_table, dev) !=3D N=
ULL;
> + =A0 =A0 =A0 dev->of_match =3D of_match_device(drv->of_match_table, =
dev);
> + =A0 =A0 =A0 return dev->of_match !=3D NULL;
> =A0}
>
> =A0extern struct platform_device *of_dev_get(struct platform_device *=
dev);
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
