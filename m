From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: cm-fx6: extend board support
Date: Tue, 21 Jan 2014 18:13:28 +0200
Message-ID: <1390320812-25100-1-git-send-email-grinberg@compulab.co.il>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Extend support for cm-fx6 (Utilite) board.
Add SATA, USB OTG, and USB Host port 1 support.

Igor Grinberg (4):
  ARM: dts: cm-fx6: rearrange the dts file
  ARM: dts: cm-fx6: add SATA support
  ARM: dts: cm-fx6: add support for USB OTG
  ARM: dts: cm-fx6: add support for USB host port 1

 arch/arm/boot/dts/imx6q-cm-fx6.dts | 77 ++++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 11 deletions(-)

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
