From: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Subject: [PATCHv4 0/2] clk: keystone: add sci-clk support
Date: Mon, 22 May 2017 16:01:51 +0300
Message-ID: <1495458113-7366-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This revision is a rebase on top of 4.12-rc1, with following changes:

1) Dropped the usage of dt-bindings include genpd/k2g.h as this is
   apparently going to be removed
2) Dropped the dt-bindings include file for the clock identifiers
   based on item [1]. The identifiers are only used once for anything
   within the driver, and it is more readable this way also. The DT
   users should use magic numbers for accessing the clocks, relative
   to what is done for example for IP addresses etc.
3) Fixed the node name for the clocks in patch #1
4) Init time failure fixes in patch #2
5) Some other minor fixes for comments provided for v3 of the patch #2

Boot tested with some additional patches on top on keystone-k2g.

(Bootable reference branch, NOT FOR MERGE:
 https://github.com/t-kristo/linux-pm/tree/4.12-rc1-ti-sci-v4c-integ)

-Tero

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
