From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/4] usb: dwc2: add compatible data for rockchip soc
Date: Tue, 29 Jul 2014 21:21:37 -0700
Message-ID: <CAD=FV=Wqr0C7gj89DVof=gBo4mxvqqz0or7_vkdad==CkzzrPg@mail.gmail.com>
References: <1406683873-18194-1-git-send-email-kever.yang@rock-chips.com>
 <1406684102-18313-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1406684102-18313-1-git-send-email-kever.yang@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jianqun Xu <xjq@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Kishon Vijay Abraham I <kishon@ti.com>, lyz@rock-chips.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Addy Ke <addy.ke@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Porter <mporter@linaro.org>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, wulf@rock-chips.com, Sonny Rao <sonnyrao@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-kernel@v
List-Id: devicetree@vger.kernel.org

Kever,

On Tue, Jul 29, 2014 at 6:35 PM, Kever Yang <kever.yang@rock-chips.com> wrote:
> This patch add compatible data for dwc2 controller found on
> rk3066, rk3188 and rk3288 processors from rockchip.
>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>  drivers/usb/dwc2/platform.c |   29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

I'm nowhere an expert here, but...


> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index a10e7a3..cc5983c 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -75,6 +75,34 @@ static const struct dwc2_core_params params_bcm2835 = {
>         .uframe_sched                   = 0,
>  };
>
> +static const struct dwc2_core_params params_rk3066 = {
> +       .otg_cap                        = 2,    /* no HNP/SRP capable */

Are you sure HNP/SRP is not available?  Do things break if you leave this at 0?


> +       .otg_ver                        = 0,    /* 1.3 */
> +       .dma_enable                     = 1,
> +       .dma_desc_enable                = 0,
> +       .speed                          = 0,    /* High Speed */
> +       .enable_dynamic_fifo            = 1,
> +       .en_multiple_tx_fifo            = 1,
> +       .host_rx_fifo_size              = 520,  /* 520 DWORDs */
> +       .host_nperio_tx_fifo_size       = 128,  /* 128 DWORDs */
> +       .host_perio_tx_fifo_size        = 256,  /* 256 DWORDs */
> +       .max_transfer_size              = 65536,
> +       .max_packet_count               = 512,

Header file says max_packet_count should be max of 511.


> +       .host_channels                  = 9,
> +       .phy_type                       = 1,    /* UTMI */
> +       .phy_utmi_width                 = 16,   /* 8 bits */

Either comment or value is wrong since 16 != 8 bits.


> +       .phy_ulpi_ddr                   = 0,    /* Single */
> +       .phy_ulpi_ext_vbus              = 0,
> +       .i2c_enable                     = 0,
> +       .ulpi_fs_ls                     = 0,
> +       .host_support_fs_ls_low_power   = 0,
> +       .host_ls_low_power_phy_clk      = 0,    /* 48 MHz */
> +       .ts_dline                       = 0,
> +       .reload_ctl                     = 1,
> +       .ahbcfg                         = 0x17, /* dma enable &  INCR16 */
> +       .uframe_sched                   = 1,
> +};

Many of these values could just be -1 to autodetect / use default.
Should we consider doing that?

-Doug
