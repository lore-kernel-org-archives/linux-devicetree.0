From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH V2 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Date: Mon, 20 May 2019 02:15:50 +0000
Message-ID: <AM5PR0402MB2865ED4DFB84BF2AE85EF0ABF1060@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190517033946.30763-1-ran.wang_1@nxp.com>
 <20190519213457.GG31403@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190519213457.GG31403@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Monday, May 20, 2019 05:35, Pavel Machek wrote:
>=20
> > --- a/include/linux/pm_wakeup.h
>=20
> > @@ -70,6 +71,7 @@ struct wakeup_source {
> >  	unsigned long		wakeup_count;
> >  	bool			active:1;
> >  	bool			autosleep_enabled:1;
> > +	struct device	*attached_dev;
> >  };
> >
> >  #ifdef CONFIG_PM_SLEEP
>=20
> You might want to format this similary to the rest...

OK, will update, thanks.

Regards,
Ran
