From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 2/2] misc: xlnx_vcu: Add Xilinx ZYNQMP VCU logicoreIP
 init driver
Date: Fri, 15 Dec 2017 14:26:09 +0100
Message-ID: <CAK8P3a0nm_-pxGWXHx_FAXgXt1msE2bK0D4paBMWgryPyeS9xA@mail.gmail.com>
References: <29198c0a-783e-8aa0-00e4-44b1fa1acef7@infradead.org>
 <1513322656-4571-1-git-send-email-dshah@xilinx.com> <1513322656-4571-3-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513322656-4571-3-git-send-email-dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: gregkh <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In Fri, Dec 15, 2017 at 8:24 AM, Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Xilinx ZYNQMP logicoreIP Init driver is based on the new
> LogiCoreIP design created. This driver provides the processing system
> and programmable logic isolation. Set the frequency based on the clock
> information get from the logicoreIP register set.
>
> It is put in drivers/misc as there is no subsystem for this logicoreIP.
>
> Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

After giving this some more thought, I'd suggest you move the driver to
drivers/soc/xilinx or drivers/soc/zynq instead of drivers/misc/, and have
it merged by Michal Simek as a driver patch that will go through arm-soc.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
