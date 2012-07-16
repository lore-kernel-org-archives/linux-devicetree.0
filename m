From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2 v3] USB: host: Add Device tree support for dwc3-exynos
Date: Mon, 16 Jul 2012 11:27:37 +0530
Message-ID: <1342418259-23802-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, prashanth.g-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org, av.tikhomirov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changes from v1:
1) Rebased on 'usb-next' branch.

Vivek Gautam (2):
  USB: dwc3-exynos: Add support for device tree
  USB: dwc3-exynos: Add vbus setup function to the exynos dwc3 glue
    layer

 drivers/usb/dwc3/dwc3-exynos.c |   47 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
