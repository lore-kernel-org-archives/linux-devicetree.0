From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v2 2/2] misc: Add Xilinx ZYNQMP VCU logicoreIP init driver
Date: Thu, 7 Dec 2017 22:47:05 +0100
Message-ID: <CAOFm3uH4ibn972gdmESSvK1JS9H1MwHk-PWDvHkZc8yUUUN_eA@mail.gmail.com>
References: <20171207104757.GA27343@kroah.com> <1512682276-6082-1-git-send-email-dshah@xilinx.com>
 <1512682276-6082-3-git-send-email-dshah@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512682276-6082-3-git-send-email-dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Dhaval,

On Thu, Dec 7, 2017 at 10:31 PM, Dhaval Shah <dhaval.shah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Xilinx ZYNQMP logicoreIP Init driver is based on the new
> LogiCoreIP design created. This driver provides the processing system
> and programmable logic isolation. Set the frequency based on the clock
> information get from the logicoreIP register set.
>
> It is put in drivers/misc as there is no subsystem for this logicoreIP.
>
> Signed-off-by: Dhaval Shah <dshah-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since v2:
>  * Removed the "default n" from the Kconfig
>  * More help text added to explain more about the logicoreIP driver
>  * SPDX id is relocated at top of the file with // style comment
>  * Removed the export API and header file and make it a single driver
>    which provides logocoreIP init.
>  * Provide the information in commit message as well for the why driver
>    in drivers/misc.

Thank you for the SPDX comments updates.

Acked-by: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>

-- 
Cordially
Philippe Ombredanne
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
