From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V4 10/12] misc: xilinx_sdfec: Add stats & status ioctls
Date: Thu, 6 Jun 2019 18:27:23 +0000
Message-ID: <CH2PR02MB635905A42F3F667E81D30E27CB170@CH2PR02MB6359.namprd02.prod.outlook.com>
References: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
 <1558784245-108751-11-git-send-email-dragan.cvetic@xilinx.com>
 <20190606141138.GD7943@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606141138.GD7943@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday 6 June 2019 15:12
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V4 10/12] misc: xilinx_sdfec: Add stats & status ioct=
ls
>=20
> On Sat, May 25, 2019 at 12:37:23PM +0100, Dragan Cvetic wrote:
> > SD-FEC statistic data are:
> > - count of data interface errors (isr_err_count)
> > - count of Correctable ECC errors (cecc_count)
> > - count of Uncorrectable ECC errors (uecc_count)
> >
> > Add support:
> > 1. clear stats ioctl callback which clears collected
> > statistic data,
> > 2. get stats ioctl callback which reads a collected
> > statistic data,
> > 3. set default configuration ioctl callback,
> > 4. start ioctl callback enables SD-FEC HW,
> > 5. stop ioctl callback disables SD-FEC HW.
> >
> > In a failed state driver enables the following ioctls:
> > - get status
> > - get statistics
> > - clear stats
> > - set default SD-FEC device configuration
> >
> > Tested-by: Santhosh Dyavanapally <SDYAVANA@xilinx.com>
> > Tested by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> > Tested-by: Derek Kiernan <derek.kiernan@xilinx.com>
> > Tested-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
> > Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > ---
> >  drivers/misc/xilinx_sdfec.c      | 121 +++++++++++++++++++++++++++++++=
++++++++
> >  include/uapi/misc/xilinx_sdfec.h |  75 ++++++++++++++++++++++++
> >  2 files changed, 196 insertions(+)
> >
> > diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> > index 544e746..6e04492 100644
> > --- a/drivers/misc/xilinx_sdfec.c
> > +++ b/drivers/misc/xilinx_sdfec.c
> > @@ -189,6 +189,7 @@ struct xsdfec_clks {
> >   * @dev: pointer to device struct
> >   * @state: State of the SDFEC device
> >   * @config: Configuration of the SDFEC device
> > + * @intr_enabled: indicates IRQ enabled
> >   * @state_updated: indicates State updated by interrupt handler
> >   * @stats_updated: indicates Stats updated by interrupt handler
> >   * @isr_err_count: Count of ISR errors
> > @@ -207,6 +208,7 @@ struct xsdfec_dev {
> >  	struct device *dev;
> >  	enum xsdfec_state state;
> >  	struct xsdfec_config config;
> > +	bool intr_enabled;
> >  	bool state_updated;
> >  	bool stats_updated;
> >  	atomic_t isr_err_count;
> > @@ -290,6 +292,26 @@ static int xsdfec_dev_release(struct inode *iptr, =
struct file *fptr)
> >  	return 0;
> >  }
> >
> > +static int xsdfec_get_status(struct xsdfec_dev *xsdfec, void __user *a=
rg)
> > +{
> > +	struct xsdfec_status status;
> > +	int err;
> > +
> > +	status.fec_id =3D xsdfec->config.fec_id;
> > +	spin_lock_irqsave(&xsdfec->irq_lock, xsdfec->flags);
> > +	status.state =3D xsdfec->state;
> > +	xsdfec->state_updated =3D false;
> > +	spin_unlock_irqrestore(&xsdfec->irq_lock, xsdfec->flags);
> > +	status.activity =3D (xsdfec_regread(xsdfec, XSDFEC_ACTIVE_ADDR) &
> > +			   XSDFEC_IS_ACTIVITY_SET);
> > +
> > +	err =3D copy_to_user(arg, &status, sizeof(status));
> > +	if (err)
> > +		err =3D -EFAULT;
> > +
> > +	return err;
> > +}
> > +
> >  static int xsdfec_get_config(struct xsdfec_dev *xsdfec, void __user *a=
rg)
> >  {
> >  	int err;
> > @@ -850,6 +872,80 @@ static int xsdfec_cfg_axi_streams(struct xsdfec_de=
v *xsdfec)
> >  	return 0;
> >  }
> >
> > +static int xsdfec_start(struct xsdfec_dev *xsdfec)
> > +{
> > +	u32 regread;
> > +
> > +	regread =3D xsdfec_regread(xsdfec, XSDFEC_FEC_CODE_ADDR);
> > +	regread &=3D 0x1;
> > +	if (regread !=3D xsdfec->config.code) {
> > +		dev_dbg(xsdfec->dev,
> > +			"%s SDFEC HW code does not match driver code, reg %d, code %d",
> > +			__func__, regread, xsdfec->config.code);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Set AXIS enable */
> > +	xsdfec_regwrite(xsdfec, XSDFEC_AXIS_ENABLE_ADDR,
> > +			XSDFEC_AXIS_ENABLE_MASK);
> > +	/* Done */
> > +	xsdfec->state =3D XSDFEC_STARTED;
> > +	return 0;
> > +}
> > +
> > +static int xsdfec_stop(struct xsdfec_dev *xsdfec)
> > +{
> > +	u32 regread;
> > +
> > +	if (xsdfec->state !=3D XSDFEC_STARTED)
> > +		dev_dbg(xsdfec->dev, "Device not started correctly");
> > +	/* Disable AXIS_ENABLE Input interfaces only */
> > +	regread =3D xsdfec_regread(xsdfec, XSDFEC_AXIS_ENABLE_ADDR);
> > +	regread &=3D (~XSDFEC_AXIS_IN_ENABLE_MASK);
> > +	xsdfec_regwrite(xsdfec, XSDFEC_AXIS_ENABLE_ADDR, regread);
> > +	/* Stop */
> > +	xsdfec->state =3D XSDFEC_STOPPED;
> > +	return 0;
> > +}
> > +
> > +static int xsdfec_clear_stats(struct xsdfec_dev *xsdfec)
> > +{
> > +	atomic_set(&xsdfec->isr_err_count, 0);
> > +	atomic_set(&xsdfec->uecc_count, 0);
> > +	atomic_set(&xsdfec->cecc_count, 0);
>=20
> Atomics for counters?  Are you sure?  Don't we have some sort of sane
> counter api these days for stuff like this instead of abusing atomic
> variables?  What does the networking people use?  How often/fast do
> these change that you need to synchronize things?

Accepted.
No need to have them atomic. They are lock protected already.

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int xsdfec_get_stats(struct xsdfec_dev *xsdfec, void __user *ar=
g)
> > +{
> > +	int err;
> > +	struct xsdfec_stats user_stats;
> > +
> > +	spin_lock_irqsave(&xsdfec->irq_lock, xsdfec->flags);
> > +	user_stats.isr_err_count =3D atomic_read(&xsdfec->isr_err_count);
> > +	user_stats.cecc_count =3D atomic_read(&xsdfec->cecc_count);
> > +	user_stats.uecc_count =3D atomic_read(&xsdfec->uecc_count);
> > +	xsdfec->stats_updated =3D false;
> > +	spin_unlock_irqrestore(&xsdfec->irq_lock, xsdfec->flags);
>=20
> Wait, you just grabbed a lock, and then read atomic variables, why?  Why
> do these need to be atomic variables if you are already locking around
> them?  Unless you want to be "extra sure" they are safe?  :)

Accepted.
Absolutely no need for atomic variables.
=20
>=20
> Please fix up.
>=20
> thanks,
>=20
> greg k-h
