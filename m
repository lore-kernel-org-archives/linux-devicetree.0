From: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v5 1/3] watchdog: add rza_wdt driver
Date: Sat, 4 Mar 2017 22:36:07 +0000
Message-ID: <SG2PR06MB1165967967FCFF06C1BF048F8A2A0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170303173201.5597-1-chris.brandt@renesas.com>
 <20170303173201.5597-2-chris.brandt@renesas.com>
 <64cc8948-1940-f219-fb87-800b3d617030@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <64cc8948-1940-f219-fb87-800b3d617030-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Content-Language: en-US
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday, March 04, 2017, Guenter Roeck wrote:
> > +#include <linux/platform_device.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/delay.h>
> > +#include <linux/watchdog.h>
> > +#include <linux/clk.h>
> > +
>=20
> Also needs to include <linux/bitops.h>. While at it, please order include
> files alphabetically.

OK.

> > +	platform_set_drvdata(pdev, priv);
>=20
> This is now unnecessary.

OK.


Thank you,
Chris

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
