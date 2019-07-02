From: Vishal Sagar <vsagar@xilinx.com>
Subject: RE: [PATCH v9 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Date: Tue, 2 Jul 2019 12:25:10 +0000
Message-ID: <CH2PR02MB6088AF87A011C148BA07C7AFA7F80@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1560247809-117978-1-git-send-email-vishal.sagar@xilinx.com>
 <1560247809-117978-3-git-send-email-vishal.sagar@xilinx.com>
 <b51bdf5d-4002-5ec6-d687-b97b4f8bbd78@lucaceresoli.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <b51bdf5d-4002-5ec6-d687-b97b4f8bbd78@lucaceresoli.net>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Luca Ceresoli <luca@lucaceresoli.net>, Vishal Sagar <vishal.sagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>, Jacopo Mondi <jacopo@jmondi.org>
List-Id: devicetree@vger.kernel.org

Hi Luca,

Thanks for the review.

> -----Original Message-----
> From: Luca Ceresoli [mailto:luca@lucaceresoli.net]
> Sent: Monday, July 01, 2019 3:15 AM
> To: Vishal Sagar <vishal.sagar@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>;
> laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
> robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Jacopo Mondi
> <jacopo@jmondi.org>
> Subject: Re: [PATCH v9 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
> Subsystem driver
> 
> EXTERNAL EMAIL
> 
> Hi Vishal,
> 
> a few questions below about the SLBF error management.
> 
> On 11/06/19 12:10, Vishal Sagar wrote:
> > The Xilinx MIPI CSI-2 Rx Subsystem soft IP is used to capture images
> > from MIPI CSI-2 camera sensors and output AXI4-Stream video data ready
> > for image processing. Please refer to PG232 for details.
> >
> > The driver is used to set the number of active lanes, if enabled
> > in hardware. The CSI2 Rx controller filters out all packets except for
> > the packets with data type fixed in hardware. RAW8 packets are always
> > allowed to pass through.
> >
> > It is also used to setup and handle interrupts and enable the core. It
> > logs all the events in respective counters between streaming on and off.
> >
> > The driver supports only the video format bridge enabled configuration.
> > Some data types like YUV 422 10bpc, RAW16, RAW20 are supported when
> the
> > CSI v2.0 feature is enabled in design. When the VCX feature is enabled,
> > the maximum number of virtual channels becomes 16 from 4.
> >
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> 
> ...
> 
> > --- /dev/null
> > +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> 
> ...
> > +/**
> > + * xcsi2rxss_irq_handler - Interrupt handler for CSI-2
> > + * @irq: IRQ number
> > + * @dev_id: Pointer to device state
> > + *
> > + * In the interrupt handler, a list of event counters are updated for
> > + * corresponding interrupts. This is useful to get status / debug.
> > + *
> > + * In case of stream line buffer full condition, the IP is reset, stopped and
> > + * an event is raised.
> > + *
> > + * Return: IRQ_HANDLED after handling interrupts
> > + *         IRQ_NONE is no interrupts
> > + */
> > +static irqreturn_t xcsi2rxss_irq_handler(int irq, void *dev_id)
> > +{
> > +     struct xcsi2rxss_state *state = (struct xcsi2rxss_state *)dev_id;
> > +     struct xcsi2rxss_core *core = &state->core;
> > +     u32 status;
> > +
> > +     status = xcsi2rxss_read(core, XCSI_ISR_OFFSET) &
> XCSI_ISR_ALLINTR_MASK;
> > +     dev_dbg_ratelimited(core->dev, "interrupt status = 0x%08x\n", status);
> > +
> > +     if (!status)
> > +             return IRQ_NONE;
> > +
> > +     /* Received a short packet */
> > +     if (status & XCSI_ISR_SPFIFONE) {
> > +             dev_dbg_ratelimited(core->dev, "Short packet = 0x%08x\n",
> > +                                 xcsi2rxss_read(core, XCSI_SPKTR_OFFSET));
> > +     }
> > +
> > +     /* Short packet FIFO overflow */
> > +     if (status & XCSI_ISR_SPFIFOF)
> > +             dev_alert_ratelimited(core->dev, "Short packet FIFO overflowed\n");
> > +
> > +     /*
> > +      * Stream line buffer full
> > +      * This means there is a backpressure from downstream IP
> > +      */
> > +     if (status & XCSI_ISR_SLBF) {
> > +             dev_alert_ratelimited(core->dev, "Stream Line Buffer Full!\n");
> > +             if (core->rst_gpio) {
> > +                     gpiod_set_value(core->rst_gpio, 1);
> > +                     /* minimum 40 dphy_clk_200M cycles */
> > +                     ndelay(250);
> > +                     gpiod_set_value(core->rst_gpio, 0);
> > +             }
> > +             xcsi2rxss_stop_stream(state);
> 
> I've been hit by the dreadful "Stream Line Buffer Full" error, getting
> the CSI-2 RX completely stuck in SLBF and not transmitting any frames
> sporadically after glitches in the incoming MIPI stream. And I found
> that adding xcsi2rxss_start_stream() here just after
> xcsi2rxss_stop_stream() allows to continue the stream with almost no
> interruption and without userspace intervention.
> 
> Do you think this is a reliable solution, or does it have side-effects I
> didn't encounter? Note I'm not using pm nor the ctrls, so register
> writes are limited to the enable/disable code paths.
> 

When a stream line buffer full condition occurs it means that there is a rate mismatch.
It is best to recheck the design. Hence the intention of the code is to notify about this error and stop streaming.

If you want to restart streaming then the correct sequence would be to 
1 - stop stream 
2 - apply video_aresetn
3 - start stream

I will correct my sequence to to stop the stream first and then apply video_aresetn.
But restarting the stream will only mask the design / system issue.
So I think it is better to stop the stream.

> Does video_aresetn also reset registers?
> 

Applying the video_aresetn only resets the IP logic and not the registers.

> BTW in my code I also moved xcsi2rxss_stop_stream() before the if
> (core->rst_gpio) {}. There is no strong reason for this, I didn't
> observe any functional difference, it just looks
> more logical to me to stop the IP before resetting it.
> 

That is right.

> ...
> 
> > +static int xcsi2rxss_probe(struct platform_device *pdev)
> > +{
> > +     struct v4l2_subdev *subdev;
> > +     struct xcsi2rxss_state *xcsi2rxss;
> > +     struct xcsi2rxss_core *core;
> > +     struct resource *res;
> > +     int ret, num_ctrls, i;
> > +
> > +     xcsi2rxss = devm_kzalloc(&pdev->dev, sizeof(*xcsi2rxss), GFP_KERNEL);
> > +     if (!xcsi2rxss)
> > +             return -ENOMEM;
> > +
> > +     core = &xcsi2rxss->core;
> > +     core->dev = &pdev->dev;
> > +
> > +     core->clks = devm_kmemdup(core->dev, xcsi2rxss_clks,
> > +                               sizeof(xcsi2rxss_clks), GFP_KERNEL);
> > +     if (!core->clks)
> > +             return -ENOMEM;
> > +
> > +     /* Reset GPIO */
> > +     core->rst_gpio = devm_gpiod_get_optional(core->dev, "reset",
> > +                                              GPIOD_OUT_HIGH);
> 
> Is GPIOD_OUT_HIGH correct? video_aresetn is active low.

This is correct. In the device tree, we mark this as reset-gpio with GPIO_ACTIVE_LOW.
Please refer to https://www.kernel.org/doc/Documentation/gpio/board.txt power-gpios example.

> 
> > +     if (IS_ERR(core->rst_gpio)) {
> > +             if (PTR_ERR(core->rst_gpio) != -EPROBE_DEFER)
> > +                     dev_err(core->dev, "Video Reset GPIO not setup in DT");
> > +             return PTR_ERR(core->rst_gpio);
> > +     }
> > +
> > +     mutex_init(&xcsi2rxss->lock);
> > +
> > +     ret = xcsi2rxss_parse_of(xcsi2rxss);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     core->iomem = devm_ioremap_resource(core->dev, res);
> > +     if (IS_ERR(core->iomem))
> > +             return PTR_ERR(core->iomem);
> > +
> > +     core->num_clks = ARRAY_SIZE(xcsi2rxss_clks);
> > +
> > +     ret = clk_bulk_get(core->dev, core->num_clks, core->clks);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = clk_bulk_prepare_enable(core->num_clks, core->clks);
> > +     if (ret)
> > +             goto err_clk_put;
> > +
> > +     if (xcsi2rxss->core.rst_gpio) {
> > +             gpiod_set_value_cansleep(xcsi2rxss->core.rst_gpio, 1);
> > +             /* minimum of 40 dphy_clk_200M cycles */
> > +             usleep_range(1, 2);
> > +             gpiod_set_value_cansleep(xcsi2rxss->core.rst_gpio, 0);
> > +     }
> 
> "xcsi2rxss->core" -> "core" in these lines.
> 

Agree. I will fix this in next version. 

Regards

Vishal Sagar

> Thanks,
> --
> Luca
