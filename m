From: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
Subject: staging: fsl-mc: Convert to use platform_msi infrastrucutre
Date: Wed, 13 Apr 2016 12:30:50 +0200
Message-ID: <1460543456-11345-1-git-send-email-mbrugger@suse.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, stuart.yoder-3arQi8VN3Tc@public.gmane.org, jroedel-l3A5Bk7waGM@public.gmane.org, agraf-l3A5Bk7waGM@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhaktipriya96-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mbrugger-IBi9RG/b67k@public.gmane.org
List-Id: devicetree@vger.kernel.org

Freescale MC driver can't be build as module as it uses it's own
msi implementation. This patch set converts the driver to use platform_msi
infrastructure instead, so that we can build the driver as a module.

Apart from that we have to export some functions of the msi framework to
handle the domain.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
