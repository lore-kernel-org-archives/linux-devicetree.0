From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] rtc: mxc_v2: add driver for i.MX53 SRTC
Date: Tue, 5 Dec 2017 12:12:10 -0200
Message-ID: <CAOMZO5DkHM4L17eHQVANhtrkQkP8ayvVtXD9aVu==5CnauJqeA@mail.gmail.com>
References: <20171205140646.30367-1-linux-kernel-dev@beckhoff.com> <20171205140646.30367-4-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205140646.30367-4-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ph
List-Id: devicetree@vger.kernel.org

On Tue, Dec 5, 2017 at 12:06 PM,  <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org> wrote:
> From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
>
> Add RTC_DRV_MXC_V2 config option
>
> Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>

You should add the Kconfig as part of the patch that introduces the driver.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
