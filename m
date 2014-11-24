From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 00/14] of: DT Overlay patches to be merged
Date: Mon, 24 Nov 2014 22:33:28 +0000
Message-ID: <1416868422-22103-1-git-send-email-grant.likely@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the second time I've posted the Devicetree Overlay patch series
with the intention of merging for v3.19. I'm reposting the entire series
again because I've done some mild rework and reordered a number of
things to make a bit more sense. Most notable changes are:
patch 04/14: Change the return value of of_reconfig_get_state_change() to an
             enum
patch 05/14: (new) Create empty stubs so the notifiers can be simpler
patch 07/14: (new) Rework notifiers to always use a structure for
             notifier data
patch 11/14 through 14/14: Add i2c and spi support

Mark and Wolfram, I've cc'd you on this series even though you'll only
be interested in 11,12 and 13,14 respectively. If you're okay with these
patches then I'd like to merge them through my tree to keep the
dependencies together.

Thanks,
g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
