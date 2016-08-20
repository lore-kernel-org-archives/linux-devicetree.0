From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/4] usb: dwc2: assert phy reset when waking up in rk3288
 platform
Date: Sun, 21 Aug 2016 00:30:27 +0300
Message-ID: <4c931176-a09a-546c-d2b6-ea74028c78a2@cogentembedded.com>
References: <7ca3b54d-e9d8-a137-79b6-d24f0b7065c7@synopsys.com>
 <1471725140-3833-1-git-send-email-ayaka@soulik.info>
 <1471725140-3833-4-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1471725140-3833-4-git-send-email-ayaka@soulik.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Li <ayaka@soulik.info>, linux-usb@vger.kernel.org
Cc: johnyoun@synopsys.com, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, eddie.cai@rock-chips.com, randy.li@rock-chips.com, kishon@ti.com, linux-kernel@vger.kernel.org, heiko@sntech.de
List-Id: devicetree@vger.kernel.org

Hello.

On 08/20/2016 11:32 PM, Randy Li wrote:

> On the rk3288 USB host-only port (the one that's not the OTG-enabled
> port) the PHY can get into a bad state when a wakeup is asserted (not
> just a wakeup from full system suspend but also a wakeup from
> autosuspend).
>
> We can get the PHY out of its bad state by asserting its "port reset",
> but unfortunately that seems to assert a reset onto the USB bus so it
> could confuse things if we don't actually deenumerate / reenumerate the
> device.
>
> We can also get the PHY out of its bad state by fully resetting it using
> the reset from the CRU (clock reset unit) in chip, which does a more full
> reset.  The CRU-based reset appears to actually cause devices on the bus
> to be removed and reinserted, which fixes the problem (albeit in a hacky
> way).
>
> It's unfortunate that we need to do a full re-enumeration of devices at
> wakeup time, but this is better than alternative of letting the bus get
> wedged.
>
> The original patches came from Doug Anderson <dianders@chromium.org>.
>
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  drivers/usb/dwc2/core_intr.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
> index d85c5c9..c31c3fe 100644
> --- a/drivers/usb/dwc2/core_intr.c
> +++ b/drivers/usb/dwc2/core_intr.c
[...]
> @@ -379,6 +380,14 @@ static void dwc2_handle_wakeup_detected_intr(struct dwc2_hsotg *hsotg)
>  			/* Restart the Phy Clock */
>  			pcgcctl &= ~PCGCTL_STOPPCLK;
>  			dwc2_writel(pcgcctl, hsotg->regs + PCGCTL);
> +
> +			/* It is a quirk in Rockchip RK3288, causing by
> +			 * a hardware bug. This will propagate out and
> +			 * eventually we'll re-enumerate the device.
> +			 * Not great but the best we can do */

   The preferred multi-line comment style is this:

/*
  * bla
  * bla
  */

    Yours is close. :-)

[...]

MBR, Sergei
