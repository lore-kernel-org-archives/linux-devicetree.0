From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: using labels for stdout-path
Date: Thu, 11 May 2017 15:05:45 +0200
Message-ID: <20170511130545.co6pyyvlwuitbyne@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

on an i.MX28 based machine I want to have the console on &duart with
115200 Bd, 8 Bit, no parity.

The options for that are AFAICT:

 - use an alias, like:

 	stdout-path = "serialX:115200n8";

   the problem here is, that the duart doesn't have an alias. I guess I
   shouldn't introduce a new one for my setup?

 - use a label, like:

 	stdout-path = &duart, ":115200n8";

   This would be the prettiest, but that doesn't work, because there is
   a '\0' separating the path and the options.

 - use the full path, like:

 	stdout-path = "/apb@80000000/apbx@80040000/serial@80074000:115200n8";

   This is ugly.

Do I miss something? Is that worth to introduce new syntax, maybe

	stdout-path = &duart . ":115200n8";

or similar?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
