From: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] regulator: pfuze100: Minor driver enhancements
Date: Mon, 26 May 2014 16:45:39 +0800
Message-ID: <1401093941-12386-1-git-send-email-xobs@kosagi.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The PFUZE100 supports enabling/disabling of SWB regulators, but the driver
doesn't currently support this.  The first patch adds support for the
enable/disable bit.

Additionally, there is a minor bug wherein GPIO0 IO0 will sometimes get
allocated as the PFUZE100 ena_gpio, due to the fact that ena_gpio defaults
to 0 which is a valid gpio.  The second patch fixes this case.

Sean Cross (2):
  regulator: pfuze100: Support SWB enable/disable
  regulator: pfuze100: Don't allocate an invalid gpio

 drivers/regulator/pfuze100-regulator.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
