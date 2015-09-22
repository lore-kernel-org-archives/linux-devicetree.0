From: Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>
Subject: Re: [PATCH v11 3/4] add FPGA manager core
Date: Tue, 22 Sep 2015 17:29:29 -0500
Message-ID: <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
 <1442935271-10375-4-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442935271-10375-4-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Petr Cvek <petr.cvek-qphu/3gb4gc@public.gmane.org>, deliciou
List-Id: devicetree@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 10:21:10AM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>=20
> API to support programming FPGA's.
>=20
> The following functions are exported as GPL:
> * fpga_mgr_buf_load
>    Load fpga from image in buffer
>=20
> * fpga_mgr_firmware_load
>    Request firmware and load it to the FPGA.
>=20
> * fpga_mgr_register
> * fpga_mgr_unregister
>    FPGA device drivers can be added by calling
>    fpga_mgr_register() to register a set of
>    fpga_manager_ops to do device specific stuff.
>=20
> * of_fpga_mgr_get
> * fpga_mgr_put
>    Get/put a reference to a fpga manager.
>=20
> The following sysfs files are created:
> * /sys/class/fpga_manager/<fpga>/name
>   Name of low level driver.

Don't 'struct device's already have a name?  Why do you need another name
attribute?

>=20
> * /sys/class/fpga_manager/<fpga>/state
>   State of fpga manager
>=20
> Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
[..]
> +++ b/drivers/fpga/fpga-mgr.c
> @@ -0,0 +1,382 @@
[..]
> +int fpga_mgr_buf_load(struct fpga_manager *mgr, u32 flags, const char *b=
uf,
> +		      size_t count)
> +{
> +	struct device *dev =3D &mgr->dev;
> +	int ret;
> +
> +	if (!mgr)
> +		return -ENODEV;

This seems overly defensive.

[..]
> +int fpga_mgr_firmware_load(struct fpga_manager *mgr, u32 flags,
> +			   const char *image_name)
> +{
> +	struct device *dev =3D &mgr->dev;
> +	const struct firmware *fw;
> +	int ret;
> +
> +	if (!mgr)
> +		return -ENODEV;

Again; I'm of the opinion this is needlessly defensive.

> +
> +	dev_info(dev, "writing %s to %s\n", image_name, mgr->name);
> +
> +	mgr->state =3D FPGA_MGR_STATE_FIRMWARE_REQ;
> +
> +	ret =3D request_firmware(&fw, image_name, dev);
> +	if (ret) {
> +		mgr->state =3D FPGA_MGR_STATE_FIRMWARE_REQ_ERR;
> +		dev_err(dev, "Error requesting firmware %s\n", image_name);
> +		return ret;
> +	}
> +
> +	ret =3D fpga_mgr_buf_load(mgr, flags, fw->data, fw->size);
> +	if (ret)
> +		return ret;
> +
> +	release_firmware(fw);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(fpga_mgr_firmware_load);
> +
> +static const char * const state_str[] =3D {
> +	[FPGA_MGR_STATE_UNKNOWN] =3D		"unknown",
> +	[FPGA_MGR_STATE_POWER_OFF] =3D		"power off",
> +	[FPGA_MGR_STATE_POWER_UP] =3D		"power up",
> +	[FPGA_MGR_STATE_RESET] =3D		"reset",
> +
> +	/* requesting FPGA image from firmware */
> +	[FPGA_MGR_STATE_FIRMWARE_REQ] =3D		"firmware request",
> +	[FPGA_MGR_STATE_FIRMWARE_REQ_ERR] =3D	"firmware request error",
> +
> +	/* Preparing FPGA to receive image */
> +	[FPGA_MGR_STATE_WRITE_INIT] =3D		"write init",
> +	[FPGA_MGR_STATE_WRITE_INIT_ERR] =3D	"write init error",
> +
> +	/* Writing image to FPGA */
> +	[FPGA_MGR_STATE_WRITE] =3D		"write",
> +	[FPGA_MGR_STATE_WRITE_ERR] =3D		"write error",
> +
> +	/* Finishing configuration after image has been written */
> +	[FPGA_MGR_STATE_WRITE_COMPLETE] =3D	"write complete",
> +	[FPGA_MGR_STATE_WRITE_COMPLETE_ERR] =3D	"write complete error",
> +
> +	/* FPGA reports to be in normal operating mode */
> +	[FPGA_MGR_STATE_OPERATING] =3D		"operating",
> +};

Is it really necessary to expose the whole FPGA manager state machine to
userspace?  Is the only justification "for debugging"?

If so, that seems pretty short-sighted, as it then makes the state
machine part of the stable usermode API.  It even makes less sense given
this patchsets current state: configuration of the FPGA is not something
that userspace is directly triggering.

> +
> +static ssize_t name_show(struct device *dev,
> +			 struct device_attribute *attr, char *buf)
> +{
> +	struct fpga_manager *mgr =3D to_fpga_manager(dev);
> +
> +	return sprintf(buf, "%s\n", mgr->name);
> +}
> +
> +static ssize_t state_show(struct device *dev,
> +			  struct device_attribute *attr, char *buf)
> +{
> +	struct fpga_manager *mgr =3D to_fpga_manager(dev);
> +
> +	return sprintf(buf, "%s\n", state_str[mgr->state]);
> +}

Is it possible that the state of the FPGA has changed since the last
time we've done an update?  Should the lower-level drivers' state()
callback be invoked here?

> +
> +static DEVICE_ATTR_RO(name);
> +static DEVICE_ATTR_RO(state);
> +
> +static struct attribute *fpga_mgr_attrs[] =3D {
> +	&dev_attr_name.attr,
> +	&dev_attr_state.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(fpga_mgr);
> +
> +static int fpga_mgr_of_node_match(struct device *dev, const void *data)
> +{
> +	return dev->of_node =3D=3D data;
> +}
> +
> +/**
> + * of_fpga_mgr_get - get an exclusive reference to a fpga mgr
> + * @node:	device node
> + *
> + * Given a device node, get an exclusive reference to a fpga mgr.
> + *
> + * Return: fpga manager struct or IS_ERR() condition containing error co=
de.
> + */
> +struct fpga_manager *of_fpga_mgr_get(struct device_node *node)
> +{
> +	struct fpga_manager *mgr;
> +	struct device *dev;
> +
> +	if (!node)
> +		return ERR_PTR(-EINVAL);
> +
> +	dev =3D class_find_device(fpga_mgr_class, NULL, node,
> +				fpga_mgr_of_node_match);
> +	if (!dev)
> +		return ERR_PTR(-ENODEV);
> +
> +	mgr =3D to_fpga_manager(dev);
> +	put_device(dev);

Who's ensuring the FPGA manager device's lifetime between _get and _put?

> +	if (!mgr)
> +		return ERR_PTR(-ENODEV);
> +
> +	/* Get exclusive use of fpga manager */
> +	if (!mutex_trylock(&mgr->ref_mutex))
> +		return ERR_PTR(-EBUSY);
> +
> +	if (!try_module_get(THIS_MODULE)) {
> +		mutex_unlock(&mgr->ref_mutex);
> +		return ERR_PTR(-ENODEV);
> +	}
> +
> +	return mgr;
> +}
[..]
> +int fpga_mgr_register(struct device *dev, const char *name,
> +		      const struct fpga_manager_ops *mops,
> +		      void *priv)
> +{
> +	struct fpga_manager *mgr;
> +	const char *dt_label;
> +	int id, ret;
> +
> +	if (!mops || !mops->write_init || !mops->write ||
> +	    !mops->write_complete || !mops->state) {
> +		dev_err(dev, "Attempt to register without fpga_manager_ops\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!name || !strlen(name)) {
> +		dev_err(dev, "Attempt to register with no name!\n");
> +		return -EINVAL;
> +	}
> +
> +	mgr =3D kzalloc(sizeof(*mgr), GFP_KERNEL);
> +	if (!mgr)
> +		return -ENOMEM;
> +
> +	id =3D ida_simple_get(&fpga_mgr_ida, 0, 0, GFP_KERNEL);
> +	if (id < 0) {
> +		ret =3D id;
> +		goto error_kfree;
> +	}
> +
> +	mutex_init(&mgr->ref_mutex);
> +
> +	mgr->name =3D name;
> +	mgr->mops =3D mops;
> +	mgr->priv =3D priv;
> +
> +	/*
> +	 * Initialize framework state by requesting low level driver read state
> +	 * from device.  FPGA may be in reset mode or may have been programmed
> +	 * by bootloader or EEPROM.
> +	 */
> +	mgr->state =3D mgr->mops->state(mgr);
> +
> +	device_initialize(&mgr->dev);
> +	mgr->dev.class =3D fpga_mgr_class;
> +	mgr->dev.parent =3D dev;
> +	mgr->dev.of_node =3D dev->of_node;
> +	mgr->dev.id =3D id;
> +	dev_set_drvdata(dev, mgr);
> +
> +	dt_label =3D of_get_property(mgr->dev.of_node, "label", NULL);
> +	if (dt_label)
> +		ret =3D dev_set_name(&mgr->dev, "%s", dt_label);
> +	else
> +		ret =3D dev_set_name(&mgr->dev, "fpga%d", id);

I'm wondering if an alias {} node is better for this.

[..]
> +++ b/include/linux/fpga/fpga-mgr.h
[..]
> +/*
> + * FPGA Manager flags
> + * FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
> + */
> +#define FPGA_MGR_PARTIAL_RECONFIG	BIT(0)
> +
> +/**
> + * struct fpga_manager_ops - ops for low level fpga manager drivers
> + * @state: returns an enum value of the FPGA's state
> + * @write_init: prepare the FPGA to receive confuration data

                                               ^configuration

> + * @write: write count bytes of configuration data to the FPGA
> + * @write_complete: set FPGA to operating state after writing is done
> + * @fpga_remove: optional: Set FPGA into a specific state during driver =
remove

Any specific state?  State in the FPGA-manager-state-machine case?  Or a
basic 'reset' state?

  Josh

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWAdZGAAoJEKp7ZBKwQFArz3IIALPgirbCPRcmdg30ZCOvTRUC
ck4a90DGNvOAp612GENxMCixJcADgXs2+2mpkoi3IpD2YWWKKRiP85RRdjpu9JbA
iSLgq2Q5gYaQdNjzE9NSioEwdPIV06+TONL90r+vNmQdY+8XTjck6+10TI1350UX
A9IjHUkuuBNcDEzIvehIXyrWjctpEAJYLYhYbxuFF6CYxF08Ec+o+La/8W4mXkGd
aBnX6eJW1DEeLzcQIVw6Dozdx78VbOZdvCZInVzuXTInyCao6e9w+5aevjONDEt7
UfVNSgLtz++eBgmcmmick4xByJBEfgsaBNLUDuUp8qG1yIip8CFpPRvJ7f4DjX8=
=xAV/
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
