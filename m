From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v4 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Date: Wed, 19 Jun 2019 09:36:27 +0000
Message-ID: <VE1PR04MB66556830530B0B3488FE5DA6F1E50@VE1PR04MB6655.eurprd04.prod.outlook.com>
References: <20190520095238.29210-1-ran.wang_1@nxp.com>
 <3448272.3g8bHhgBA9@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3448272.3g8bHhgBA9@kreacher>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rafael,

On Wednesday, June 19, 2019 06:45, Rafael J. Wysocki wrote:
>=20
> On Monday, May 20, 2019 11:52:36 AM CEST Ran Wang wrote:
> > Some user might want to go through all registered wakeup sources and
> > doing things accordingly. For example, SoC PM driver might need to do
> > HW programming to prevent powering down specific IP which wakeup
> > source depending on. And is user's responsibility to identify if this
> > wakeup source he is interested in.
>=20
> I guess the idea here is that you need to walk wakeup devices and you not=
iced
> that there was a wakeup source object for each of them and those wakeup
> source objects were on a list, so you could walk wakeup devices by walkin=
g the
> list of wakeup source objects.
>=20
> That is fair enough, but the changelog above doesn't even talk about that=
.

How about this:
"Providing a API for helping walk through all registered wakeup devices on =
the list.
It will be useful for SoC PMU driver to know which device will work as a wa=
keup
source then do specific HW programming for them."

> > Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> > ---
> > Change in v4:
> > 	- None.
> >
> > Change in v3:
> > 	- Adjust indentation of *attached_dev;.
> >
> > Change in v2:
> > 	- None.
> >
> >  drivers/base/power/wakeup.c |   18 ++++++++++++++++++
> >  include/linux/pm_wakeup.h   |    3 +++
> >  2 files changed, 21 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> > index 5b2b6a0..6904485 100644
> > --- a/drivers/base/power/wakeup.c
> > +++ b/drivers/base/power/wakeup.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/suspend.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/debugfs.h>
> > +#include <linux/of_device.h>
> >  #include <linux/pm_wakeirq.h>
> >  #include <trace/events/power.h>
> >
> > @@ -226,6 +227,22 @@ void wakeup_source_unregister(struct
> wakeup_source *ws)
> >  	}
> >  }
> >  EXPORT_SYMBOL_GPL(wakeup_source_unregister);
> > +/**
> > + * wakeup_source_get_next - Get next wakeup source from the list
> > + * @ws: Previous wakeup source object, null means caller want first on=
e.
> > + */
> > +struct wakeup_source *wakeup_source_get_next(struct wakeup_source
> > +*ws) {
> > +	struct list_head *ws_head =3D &wakeup_sources;
> > +
> > +	if (ws)
> > +		return list_next_or_null_rcu(ws_head, &ws->entry,
> > +				struct wakeup_source, entry);
> > +	else
> > +		return list_entry_rcu(ws_head->next,
> > +				struct wakeup_source, entry);
> > +}
> > +EXPORT_SYMBOL_GPL(wakeup_source_get_next);
>=20
> This needs to be arranged along the lines of
> wakeup_sources_stats_seq_start/next/stop()
> because of the SRCU protection of the list.

Got it, how about this:
 230 /**                                                                   =
          =20
 231  * wakeup_source_get_next - Get next wakeup source from the list      =
          =20
 232  * @ws: Previous wakeup source object, null means caller want first on=
e.        =20
 233  */                                                                   =
          =20
 234 struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws)=
          =20
 235 {                                                                     =
          =20
 236         struct list_head *ws_head =3D &wakeup_sources;                =
            =20
 237         struct wakeup_source *next_ws =3D NULL;                       =
            =20
 238         int idx;                                                      =
          =20
 239                                                                       =
          =20
 240         idx =3D srcu_read_lock(&wakeup_srcu);                         =
            =20
 241         if (ws)                                                       =
                                                        =20
 242                 next_ws =3D list_next_or_null_rcu(ws_head, &ws->entry,=
            =20
 243                                 struct wakeup_source, entry);         =
          =20
 244         else                                                          =
          =20
 245                 next_ws =3D list_entry_rcu(ws_head->next,             =
            =20
 246                                 struct wakeup_source, entry);         =
          =20
 247         srcu_read_unlock(&wakeup_srcu, idx);                          =
          =20
 248                                                                       =
          =20
 249         return next_ws;                                               =
          =20
 250 }                                                                     =
          =20
 251 EXPORT_SYMBOL_GPL(wakeup_source_get_next);  =20

> >
> >  /**
> >   * device_wakeup_attach - Attach a wakeup source object to a device ob=
ject.
> > @@ -242,6 +259,7 @@ static int device_wakeup_attach(struct device *dev,
> struct wakeup_source *ws)
> >  		return -EEXIST;
> >  	}
> >  	dev->power.wakeup =3D ws;
> > +	ws->attached_dev =3D dev;
> >  	if (dev->power.wakeirq)
> >  		device_wakeup_attach_irq(dev, dev->power.wakeirq);
> >  	spin_unlock_irq(&dev->power.lock);
> > diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
> > index 0ff134d..913b2fb 100644
> > --- a/include/linux/pm_wakeup.h
> > +++ b/include/linux/pm_wakeup.h
> > @@ -50,6 +50,7 @@
> >   * @wakeup_count: Number of times the wakeup source might abort suspen=
d.
> >   * @active: Status of the wakeup source.
> >   * @has_timeout: The wakeup source has been activated with a timeout.
> > + * @attached_dev: The device it attached to
> >   */
> >  struct wakeup_source {
> >  	const char 		*name;
> > @@ -70,6 +71,7 @@ struct wakeup_source {
> >  	unsigned long		wakeup_count;
> >  	bool			active:1;
> >  	bool			autosleep_enabled:1;
> > +	struct device		*attached_dev;
>=20
> Please (a) call it just dev and (b) move it up (before wakeirq, say)

Got it, will update in next version.

Thanks & Regards,
Ran
>=20
> >  };
> >
> >  #ifdef CONFIG_PM_SLEEP
> > @@ -101,6 +103,7 @@ static inline void device_set_wakeup_path(struct
> > device *dev)  extern void wakeup_source_remove(struct wakeup_source
> > *ws);  extern struct wakeup_source *wakeup_source_register(const char
> > *name);  extern void wakeup_source_unregister(struct wakeup_source
> > *ws);
> > +extern struct wakeup_source *wakeup_source_get_next(struct
> > +wakeup_source *ws);
> >  extern int device_wakeup_enable(struct device *dev);  extern int
> > device_wakeup_disable(struct device *dev);  extern void
> > device_set_wakeup_capable(struct device *dev, bool capable);
> >
>=20
>=20
>=20
