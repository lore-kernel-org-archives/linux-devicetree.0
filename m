From: Yang Li <pku.leo@gmail.com>
Subject: Re: [PATCH v2 2/2] usb: dwc3: Add workaround for host mode VBUS
 glitch when boot
Date: Mon, 25 Feb 2019 15:28:56 -0600
Message-ID: <CADRPPNSxYqCcRR9nLBodJydn=kCdERnX26_7zq_cvfGrZBRWcQ@mail.gmail.com>
References: <20190219072358.43493-1-ran.wang_1@nxp.com> <20190219072358.43493-2-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219072358.43493-2-ran.wang_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 19, 2019 at 1:24 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> When DWC3 is set to host mode by programming register DWC3_GCTL, VBUS
> (or its control signal) will be turned on immediately on related Root Hub
> ports. Then, the VBUS is turned off for a little while(15us) when do xhci
> reset (conducted by xhci driver) and back to normal finally, we can
> observe a negative glitch of related signal happen.
>
> This VBUS glitch might cause some USB devices enumeration fail if kernel
> boot with them connected. Such as LS1012AFWRY/LS1043ARDB/LX2160AQDS
> /LS1088ARDB with Kingston 16GB USB2.0/Kingston USB3.0/JetFlash Transcend
> 4GB USB2.0 drives. The fail cases include enumerated as full-speed device
> or report wrong device descriptor, etc.
>
> One SW workaround which can fix this is by programing all xhci PORTSC[PP]
> to 0 to turn off VBUS immediately after setting host mode in DWC3 driver
> (per signal measurement result, it will be too late to do it in
> xhci-plat.c or xhci.c). Then, after xhci reset complete in xhci driver,
> PORTSC[PP]s' value will back to 1 automatically and VBUS on at that time,
> no glitch happen and normal enumeration process has no impact.
>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
> Changes in v2:
>   - Rename related property to 'snps,host-vbus-glitches'
>   - Rename related dwc member to 'host_vbus_glitches'
>   - Add member 'host_vbus_glitches' description in 'dwc3'
>
>  drivers/usb/dwc3/core.c |   47 +++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/dwc3/core.h |   12 +++++++++++-
>  2 files changed, 58 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index a1b126f..02d11bc 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -100,6 +100,41 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
>         return 0;
>  }
>
> +/*
> + * dwc3_power_of_all_roothub_ports - Power off all Root hub ports
> + * @dwc3: Pointer to our controller context structure
> + */
> +static void dwc3_power_off_all_roothub_ports(struct dwc3 *dwc)
> +{
> +       int i, port_num;
> +       u32 reg, op_regs_base, offset;
> +       void __iomem            *xhci_regs;
> +
> +       /* xhci regs is not mapped yet, do it temperary here */
> +       if (dwc->xhci_resources[0].start) {
> +               xhci_regs = ioremap(dwc->xhci_resources[0].start,
> +                               DWC3_XHCI_REGS_END);
> +               if (IS_ERR(xhci_regs)) {
> +                       dev_err(dwc->dev, "Failed to ioremap xhci_regs\n");
> +                       return;
> +               }
> +
> +               op_regs_base = HC_LENGTH(readl(xhci_regs));
> +               reg = readl(xhci_regs + XHCI_HCSPARAMS1);
> +               port_num = HCS_MAX_PORTS(reg);
> +
> +               for (i = 1; i <= port_num; i++) {
> +                       offset = op_regs_base + XHCI_PORTSC_BASE + 0x10*(i-1);

Define the 0x10 as macro?  And why don't you have the initial value of
i loop to be 0 to avoid the (i-1) here?

> +                       reg = readl(xhci_regs + offset);
> +                       reg &= ~PORT_POWER;
> +                       writel(reg, xhci_regs + offset);
> +               }
> +
> +               iounmap(xhci_regs);
> +       } else
> +               dev_err(dwc->dev, "xhci base reg invalid\n");
> +}
> +
>  void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
>  {
>         u32 reg;
> @@ -109,6 +144,15 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)
>         reg |= DWC3_GCTL_PRTCAPDIR(mode);
>         dwc3_writel(dwc->regs, DWC3_GCTL, reg);
>
> +       /*
> +        * We have to power off all Root hub ports immediately after DWC3 set
> +        * to host mode to avoid VBUS glitch happen when xhci get reset later.
> +        */
> +       if (dwc->host_vbus_glitches) {
> +               if (mode == DWC3_GCTL_PRTCAP_HOST)
> +                       dwc3_power_off_all_roothub_ports(dwc);
> +       }
> +
>         dwc->current_dr_role = mode;
>  }
>
> @@ -1306,6 +1350,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         dwc->dis_metastability_quirk = device_property_read_bool(dev,
>                                 "snps,dis_metastability_quirk");
>
> +       dwc->host_vbus_glitches = device_property_read_bool(dev,
> +                               "snps,host-vbus-glitches");
> +
>         dwc->lpm_nyet_threshold = lpm_nyet_threshold;
>         dwc->tx_de_emphasis = tx_de_emphasis;
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index df87641..9b3a7ed 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -606,6 +606,14 @@
>  #define DWC3_OSTS_VBUSVLD              BIT(1)
>  #define DWC3_OSTS_CONIDSTS             BIT(0)
>
> +/* Partial XHCI Register and Bit fields for quirk */
> +#define XHCI_HCSPARAMS1                0x4
> +#define XHCI_PORTSC_BASE       0x400
> +#define PORT_POWER                     (1 << 9)
> +#define HCS_MAX_PORTS(p)       (((p) >> 24) & 0x7f)
> +#define XHCI_HC_LENGTH(p)      (((p)>>00)&0x00ff)
> +#define HC_LENGTH(p)           XHCI_HC_LENGTH(p)
> +
>  /* Structures */
>
>  struct dwc3_trb;
> @@ -1024,6 +1032,8 @@ struct dwc3_scratchpad_array {
>   *     2       - No de-emphasis
>   *     3       - Reserved
>   * @dis_metastability_quirk: set to disable metastability quirk.
> + * @host-vbus-glitches: set to avoid vbus glitch during
> + *                      xhci reset.
>   * @imod_interval: set the interrupt moderation interval in 250ns
>   *                 increments or 0 to disable.
>   */
> @@ -1209,6 +1219,7 @@ struct dwc3 {
>         unsigned                tx_de_emphasis:2;
>
>         unsigned                dis_metastability_quirk:1;
> +       unsigned                host_vbus_glitches:1;
>
>         u16                     imod_interval;
>  };
> @@ -1217,7 +1228,6 @@ struct dwc3 {
>  #define INCRX_UNDEF_LENGTH_BURST_MODE 1
>
>  #define work_to_dwc(w)         (container_of((w), struct dwc3, drd_work))
> -

No need to remove the new line here.

>  /* -------------------------------------------------------------------------- */
>
>  struct dwc3_event_type {
> --
> 1.7.1
>


-- 
- Leo
