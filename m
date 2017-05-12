From: Markus Mayer <code-7CzEARzsJhSsTnJN9+BGXg@public.gmane.org>
Subject: Enumerating multiple devices of the same kind
Date: Fri, 12 May 2017 16:28:45 -0700
Message-ID: <CANEuBv5+94On4oxKzOJBKC_Gi6ycJwtUEb477d3ZcnxFOVCe-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

We are in the position of needing to enumerate multiple devices of the
same kind in device tree. I was originally thinking to just use
"index". Florian pointed out that "cell-index" seemed to be what was
being used by others. I submitted that upstream. Rob subsequently
pointed out that cell-index is "not a valid property for FDT (only
real OpenFirmware)."

The whole thread is archived here: https://patchwork.kernel.org/patch/9686283/.

The driver has since been converted into a SoC driver (no longer part
of the hwmon subsystem) and the cell-index property has been removed
from the binding. I'll be sending all that out for upstreaming in the
near future.

The reworked binding now looks like this:

       dpfe_cpu0: dpfe-cpu@f1132000 {
               compatible = "brcm,bcm7271-dpfe-cpu", "brcm,dpfe-cpu";
               reg =  <0xf1132000 0x180
                       0xf1134000 0x1000
                       0xf1138000 0x4000>;
               reg-names = "dpfe-cpu", "dpfe-dmem", "dpfe-imem";
       };

We still need some form of index, however, since we do have SoCs that
have more than one such node. What would be the preferred approach to
include such an index in the node?

Thanks,
-Markus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
