From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH V3 2/6] of/slimbus: OF helper for SLIMbus
Date: Mon, 3 Aug 2015 11:13:55 -0500
Message-ID: <CAL_JsqLDzLXR5aC__YhCUzGzVcVYcv_H7QS6zG0vezQPST_Y2Q@mail.gmail.com>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org> <1438585190-11894-3-git-send-email-sdharia@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1438585190-11894-3-git-send-email-sdharia@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sagar Dharia <sdharia@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, bp@suse.de, poeschel@lemonage.de, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, gong.chen@linux.intel.com, andreas.noever@gmail.com, Alan Cox <alan@linux.intel.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, Joe Perches <joe@perches.com>, David Miller <davem@davemloft.net>, James Hogan <james.hogan@imgtec.com>, michael.opdenacker@free-electrons.com, Daniel Thompson <daniel.thompson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kheitke@aud
List-Id: devicetree@vger.kernel.org

On Mon, Aug 3, 2015 at 1:59 AM, Sagar Dharia <sdharia@codeaurora.org> wrote:
> OF helper routine scans the SLIMbus DeviceTree, allocates resources,
> and creates slim_devices according to the hierarchy.
>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/slimbus/bus.txt | 46 ++++++++++++++
>  drivers/slimbus/slim-core.c                       | 75 +++++++++++++++++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
>
> diff --git a/Documentation/devicetree/bindings/slimbus/bus.txt b/Documentation/devicetree/bindings/slimbus/bus.txt
> new file mode 100644
> index 0000000..a79ed7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/slimbus/bus.txt
> @@ -0,0 +1,46 @@
> +SLIM(Serial Low Power Interchip Media Bus) bus
> +
> +SLIMbus is a 2-wire bus, and is used to communicate with peripheral
> +components like audio-codec.
> +
> +Controller is a normal device using binding for whatever bus it is
> +on (e.g. platform bus).
> +Required property for SLIMbus controller node:
> +- compatible   - name of SLIMbus controller following generic names
> +               recommended practice.
> +- #address-cells - should be 6 (number of cells required to define
> +               enumeration address of the device on SLIMbus)
> +- #size-cells  - should be 0
> +
> +No other properties are required in the SLIMbus controller bus node.
> +
> +Child nodes:
> +Every SLIMbus controller node can contain zero or more child nodes
> +representing slave devices on the bus. Every SLIMbus slave device is
> +uniquely determined by the 6 byte enumeration address.
> +
> +Required property for SLIMbus child node:
> +- reg          - 6 byte enumeration address of the slave

6 cell... I don't think it is a big deal to use 6 words to store 6
bytes, but is there some reason not to pack the address into 2 cells?

> +
> +Optional:
> +- compatible   - Slave devices can use compatible field to have a name.
> +               If this field is missing, name of the device will be
> +               determined using slave's enumeration address.
> +               (e.g. in the example below, slave's name will be:
> +               0x217:0x60:0x1:0x0)

Are devices discoverable and uniquely identifiable? This would be
something like a VID/PID which can be read in a generic way. It looks
like the address contains this info, but can you discover the
addresses of devices on the bus? If not compatible should not be
optional.

> +
> +SLIMbus example for Qualcomm's slimbus manager compoent:

typo.

> +
> +       slim@28080000 {
> +               compatible = "qcom,slim-msm";
> +               reg = <0x28080000 0x2000>,
> +               reg-names = "slimbus_physical";

Pretty pointless to have names with a single element.

> +               interrupts = <0 33 0>;
> +               interrupt-names = "slimbus_irq";
> +               clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
> +               clock-names = "iface_clk", "core_clk";
> +
> +               slim_codec_slave {

You should have unit address here. Probably with "." in between fields
of the address that have defined meaning. So that may be something
like "0217.0060.01.00" based on what you do with the address bytes
below.

> +                       reg = <00 01 60 00 17 02>;
> +               };
> +       };
> diff --git a/drivers/slimbus/slim-core.c b/drivers/slimbus/slim-core.c
> index ee80c1b..d3fa28b 100644
> --- a/drivers/slimbus/slim-core.c
> +++ b/drivers/slimbus/slim-core.c
> @@ -18,6 +18,7 @@
>  #include <linux/idr.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slimbus.h>
> +#include <linux/of.h>
>
>  static DEFINE_MUTEX(slim_lock);
>  static DEFINE_IDR(ctrl_idr);
> @@ -289,6 +290,79 @@ static LIST_HEAD(board_list);
>  static LIST_HEAD(slim_ctrl_list);
>  static DEFINE_MUTEX(board_lock);
>
> +#if IS_ENABLED(CONFIG_OF)
> +/* OF helpers for SLIMbus */
> +static void of_register_slim_devices(struct slim_controller *ctrl)
> +{
> +       struct device_node *node;
> +       struct slim_boardinfo *temp, *binfo = NULL;
> +       int n = 0;
> +
> +       if (!ctrl->dev.of_node)
> +               return;
> +
> +       for_each_child_of_node(ctrl->dev.of_node, node) {
> +               int ret;
> +               u32 ea[6];
> +               struct slim_device *slim;
> +               char *name;
> +
> +               ret = of_property_read_u32_array(node, "reg", ea, 6);
> +               if (ret) {
> +                       dev_err(&ctrl->dev, "of_slim: E-addr err:%d\n", ret);
> +                       continue;
> +               }
> +               name = kcalloc(SLIMBUS_NAME_SIZE, sizeof(char), GFP_KERNEL);
> +               if (!name)
> +                       goto of_slim_err;
> +
> +               slim = kzalloc(sizeof(struct slim_device), GFP_KERNEL);
> +               if (!slim) {
> +                       kfree(name);
> +                       goto of_slim_err;
> +               }
> +               slim->e_addr.manf_id = (u16)((ea[5] << 8) | ea[4]);
> +               slim->e_addr.prod_code = (u16)((ea[3] << 8) | ea[2]);
> +               slim->e_addr.dev_index = (u8)ea[1];
> +               slim->e_addr.instance = (u8)ea[0];
> +
> +               ret = of_modalias_node(node, name, SLIMBUS_NAME_SIZE);
> +               if (ret < 0) {
> +                       /* use device address for name, if not specified */
> +                       snprintf(name, SLIMBUS_NAME_SIZE, "0x%x:0x%x:0x%x:0x%x",
> +                                slim->e_addr.manf_id, slim->e_addr.prod_code,
> +                                slim->e_addr.dev_index, slim->e_addr.instance);
> +               }
> +
> +               temp = krealloc(binfo, (n + 1) * sizeof(struct slim_boardinfo),
> +                                       GFP_KERNEL);
> +               if (!temp) {
> +                       kfree(name);
> +                       kfree(slim);
> +                       goto of_slim_err;
> +               }
> +               binfo = temp;
> +               slim->dev.of_node = of_node_get(node);
> +               slim->name = name;
> +               binfo[n].bus_num = ctrl->nr;
> +               binfo[n].slim_slave = slim;
> +               n++;
> +       }
> +       slim_register_board_info(binfo, n);
> +       return;
> +
> +of_slim_err:
> +       n--;
> +       while (n >= 0) {
> +               kfree(binfo[n].slim_slave->name);
> +               kfree(binfo[n].slim_slave);
> +       }
> +       kfree(binfo);
> +}
> +#else
> +static void of_register_slim_devices(struct slim_controller *ctrl) { }
> +#endif
> +
>  /* If controller is not present, only add to boards list */
>  static void slim_match_ctrl_to_boardinfo(struct slim_controller *ctrl,
>                                          struct slim_boardinfo *bi)
> @@ -338,6 +412,7 @@ static void slim_ctrl_add_boarddevs(struct slim_controller *ctrl)
>  {
>         struct sbi_boardinfo *bi;
>
> +       of_register_slim_devices(ctrl);
>         mutex_lock(&board_lock);
>         list_add_tail(&ctrl->list, &slim_ctrl_list);
>         list_for_each_entry(bi, &board_list, list)
> --
> 1.8.2.1
>
