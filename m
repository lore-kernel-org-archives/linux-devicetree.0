From: Chee Nouk Phoo <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [[PATCH v2] 0/2] Add Altera Modular ADC Driver
Date: Tue, 1 Sep 2015 14:49:57 -0700
Message-ID: <1441144199-20231-1-git-send-email-cnphoon@altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, cnphoon.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chee Nouk Phoon <cnphoon-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

This is 2nd version of the patch set to add support for Altera Modular ADC and
Altera Modular Dual ADC in MAX10 device family. This patch combines two separate
patches of driver and device tree binding. 

v1->v2 changes:
- update compatibility string
- update macros naming
- remove Nios2 arch dependency
- using snprintf instead of sprintf
- improve error handing
- parse resource using reg-name instead of index
- use _relaxed version of writel and readl
- remove uncessary private data

History:
--------
[v1]https://lkml.org/lkml/2015/8/27/32
    https://lkml.org/lkml/2015/8/20/227

Chee Nouk Phoon (2):
  Altera Modular ADC driver device binding
  Altera Modular ADC driver support

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
