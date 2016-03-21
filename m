From: <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Series adding Arria10 L2 Cache EDAC
Date: Mon, 21 Mar 2016 11:01:37 -0500
Message-ID: <1458576106-24505-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org

This version refactors how the EDAC is configured for Arria10 since
the ECC hardware is significantly different than Cyclone5 and Arria5.
Since all the IRQs are shared, a new probe function based on the 
xgene codebase was used.

[PATCHv3 1/9] EDAC: Altera L2 Kconfig change from select to depends
[PATCHv3 2/9] EDAC, altera: Move Device structs and defines to
[PATCHv3 3/9] EDAC, altera: Remove platform device from check_deps()
[PATCHv3 4/9] EDAC, altera: Abstract ECC Enable Mask in check_deps()
[PATCHv3 5/9] EDAC, altera: Add register offset for ECC Error Inject
[PATCHv3 6/9] Documentation: dt: socfpga: Add Altera Arria10 L2
[PATCHv3 7/9] EDAC, altera: Addition of Arria10 L2 Cache ECC
[PATCHv3 8/9] ARM: socfpga: Enable Arria10 L2 cache ECC on startup
[PATCHv3 9/9] ARM: dts: Add Altera Arria10 L2 Cache EDAC devicetree
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
