From: Jacky Bai <ping.bai-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 2/2] ARM: imx: Add speed grading check for imx6ul
Date: Tue, 3 Jan 2017 01:01:47 +0000
Message-ID: <AM3PR04MB530A48CFF0C4089F762ACA6876E0@AM3PR04MB530.eurprd04.prod.outlook.com>
References: <1480475098-2037-1-git-send-email-ping.bai@nxp.com>
 <1480475098-2037-2-git-send-email-ping.bai@nxp.com>
 <20161230115717.GR6177@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161230115717.GR6177@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> On Wed, Nov 30, 2016 at 11:04:58AM +0800, Bai Ping wrote:
> > On i.MX6UL, it has two type of part, the difference is the max ARM
> > frequency that can run at(528MHz/700MHz).
> > The part can be identified by part marking for speed grading fuse.
> > This patch add speed grading check to disable the unsupported OPP
> > dynamically.
> >
> > Signed-off-by: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
>=20
> We chose to handle such speed grading thing in IMX platform code with the
> assumption that this is a special case for i.MX6Q only.  No, I'm not goin=
g to take
> such code for any other i.MX6 SoCs.  Please patch cpufreq driver to handl=
e the
> speed grading check.
>=20

Thanks, I will try to add in cpufreq.

> Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
