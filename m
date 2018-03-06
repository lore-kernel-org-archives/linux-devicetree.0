Return-Path: <SRS0=OxJR=F4=chromium.org=swboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <4ac213a6-081f-72c1-c9c8-6994786285c9@codeaurora.org>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-3-git-send-email-kramasub@codeaurora.org>
 <152002326567.108663.16836885081217739460@swboyd.mtv.corp.google.com>
 <4ac213a6-081f-72c1-c9c8-6994786285c9@codeaurora.org>
Message-ID: <152037339742.218381.11498404122038956963@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 2/4] soc: qcom: Add GENI based QUP Wrapper driver
Date: Tue, 06 Mar 2018 13:56:37 -0800
To: Karthik Ramasubramanian <kramasub@codeaurora.org>, Stephen Boyd <sboyd@chromium.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org, Sagar Dharia <sdharia@codeaurora.org>, Girish Mahadevan <girishm@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Karthik Ramasubramanian (2018-03-02 16:58:23)
> =

> =

> On 3/2/2018 1:41 PM, Stephen Boyd wrote:
> > Quoting Karthikeyan Ramasubramanian (2018-02-27 17:38:07)
> >> +
> >> +/**
> >> + * geni_se_get_qup_hw_version() - Read the QUP wrapper Hardware versi=
on
> >> + * @se:                        Pointer to the corresponding Serial En=
gine.
> >> + * @major:             Buffer for Major Version field.
> >> + * @minor:             Buffer for Minor Version field.
> >> + * @step:              Buffer for Step Version field.
> >> + */
> >> +void geni_se_get_qup_hw_version(struct geni_se *se, unsigned int *maj=
or,
> >> +                               unsigned int *minor, unsigned int *ste=
p)
> >> +{
> >> +       unsigned int version;
> >> +       struct geni_wrapper *wrapper =3D se->wrapper;
> >> +
> >> +       version =3D readl_relaxed(wrapper->base + QUP_HW_VER_REG);
> >> +       *major =3D (version & HW_VER_MAJOR_MASK) >> HW_VER_MAJOR_SHFT;
> >> +       *minor =3D (version & HW_VER_MINOR_MASK) >> HW_VER_MINOR_SHFT;
> >> +       *step =3D version & HW_VER_STEP_MASK;
> >> +}
> >> +EXPORT_SYMBOL(geni_se_get_qup_hw_version);
> > =

> > Is this used?
> SPI controller driver uses this API and it will be uploaded sooner.

Ok. Maybe it can also be a macro to get the u32 and then some more
macros on top of that to pick out the major/minor/step out of the u32
that you read.

> > =

> >> +
> >> +/**
> >> + * geni_se_read_proto() - Read the protocol configured for a Serial E=
ngine
> >> + * @se:        Pointer to the concerned Serial Engine.
> >> + *
> >> + * Return: Protocol value as configured in the serial engine.
> >> + */
> >> +u32 geni_se_read_proto(struct geni_se *se)
> >> +{
> >> +       u32 val;
> >> +
> >> +       val =3D readl_relaxed(se->base + GENI_FW_REVISION_RO);
> >> +
> >> +       return (val & FW_REV_PROTOCOL_MSK) >> FW_REV_PROTOCOL_SHFT;
> >> +}
> >> +EXPORT_SYMBOL(geni_se_read_proto);
> > =

> > Is this API really needed outside of this file? It would seem like the
> > drivers that implement the protocol, which are child devices, would only
> > use this API to confirm that the protocol chosen is for their particular
> > protocol.
> No, this API is meant for the protocol drivers to confirm that the =

> serial engine is programmed with the firmware for the concerned protocol =

> before using the serial engine. If the check fails, the protocol drivers =

> stop using the serial engine.

Ok maybe we don't really need it then?

> >> + * RX fifo of the serial engine.
> >> + *
> >> + * Return: RX fifo depth in units of FIFO words
> >> + */
> >> +u32 geni_se_get_rx_fifo_depth(struct geni_se *se)
> >> +{
> >> +       u32 val;
> >> +
> >> +       val =3D readl_relaxed(se->base + SE_HW_PARAM_1);
> >> +
> >> +       return (val & RX_FIFO_DEPTH_MSK) >> RX_FIFO_DEPTH_SHFT;
> >> +}
> >> +EXPORT_SYMBOL(geni_se_get_rx_fifo_depth);
> > =

> > These ones too, can probably just be static inline.
> Ok. Just for my knowledge - is there any reference guideline regarding =

> when to use static inline myself and when to let the compiler do the =

> clever thing?

Not that I'm aware of. It's really up to you to decide.

> > =

> >> +
> >> +       ret =3D geni_se_clks_on(se);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       ret =3D pinctrl_pm_select_default_state(se->dev);
> >> +       if (ret)
> >> +               geni_se_clks_off(se);
> >> +
> >> +       return ret;
> >> +}
> >> +EXPORT_SYMBOL(geni_se_resources_on);
> > =

> > IS there a reason why we can't use runtime PM or normal linux PM
> > infrastructure to power on the wrapper and keep it powered while the
> > protocol driver is active?
> Besides turning on the clocks & pinctrl settings, wrapper also has to do =

> the bus scaling votes. The bus scaling votes depend on the individual =

> serial interface bandwidth requirements. The bus scaling votes is not =

> present currently. But once the support comes in, this function enables =

> adding it.

Ok, but that would basically be some code consolidation around picking a
bandwidth and enabling/disabling? It sounds like it could go into either
the serial interface drivers or into the runtime PM path of the wrapper.

> > =

> >> +
> >> +/**
> >> + * geni_se_clk_tbl_get() - Get the clock table to program DFS
> >> + * @se:                Pointer to the concerned Serial Engine.
> >> + * @tbl:       Table in which the output is returned.
> >> + *
> >> + * This function is called by the protocol drivers to determine the d=
ifferent
> >> + * clock frequencies supported by Serial Engine Core Clock. The proto=
col
> >> + * drivers use the output to determine the clock frequency index to be
> >> + * programmed into DFS.
> >> + *
> >> + * Return: number of valid performance levels in the table on success,
> >> + *        standard Linux error codes on failure.
> >> + */
> >> +int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl)
> >> +{
> >> +       struct geni_wrapper *wrapper =3D se->wrapper;
> >> +       unsigned long freq =3D 0;
> >> +       int i;
> >> +       int ret =3D 0;
> >> +
> >> +       mutex_lock(&wrapper->lock);
> >> +       if (wrapper->clk_perf_tbl) {
> >> +               *tbl =3D wrapper->clk_perf_tbl;
> >> +               ret =3D wrapper->num_clk_levels;
> >> +               goto out_unlock;
> >> +       }
> >> +
> >> +       wrapper->clk_perf_tbl =3D kcalloc(MAX_CLK_PERF_LEVEL,
> >> +                                       sizeof(*wrapper->clk_perf_tbl),
> >> +                                       GFP_KERNEL);
> >> +       if (!wrapper->clk_perf_tbl) {
> >> +               ret =3D -ENOMEM;
> >> +               goto out_unlock;
> >> +       }
> >> +
> >> +       for (i =3D 0; i < MAX_CLK_PERF_LEVEL; i++) {
> >> +               freq =3D clk_round_rate(se->clk, freq + 1);
> >> +               if (!freq || freq =3D=3D wrapper->clk_perf_tbl[i - 1])
> >> +                       break;
> >> +               wrapper->clk_perf_tbl[i] =3D freq;
> >> +       }
> >> +       wrapper->num_clk_levels =3D i;
> >> +       *tbl =3D wrapper->clk_perf_tbl;
> >> +       ret =3D wrapper->num_clk_levels;
> >> +out_unlock:
> >> +       mutex_unlock(&wrapper->lock);
> > =

> > Is this lock actually protecting anything? I mean to say, is any more
> > than one geni protocol driver calling this function at a time? Or is
> > the same geni protocol driver calling this from multiple threads at the
> > same time? The lock looks almost useless.
> Yes, there is a possibility of multiple I2C instances within the same =

> wrapper trying to get this table simultaneously.
> =

> As Evan mentioned in the other thread, Bjorn had the comment to move it =

> to the probe and remove the lock. I looked into the possibility of it. =

>  From the hardware perspective, this table belongs to the wrapper and is =

> shared by all the serial engines within the wrapper. But due to software =

> implementation reasons, clk_round_rate can be be performed only on the =

> clocks that are tagged as DFS compatible and only the serial engine =

> clocks are tagged so. At least this was the understanding based on our =

> earlier discussion with the concerned folks. We will revisit it and =

> check if anything has changed recently.

Hmm sounds like the round rate should happen on the parent of the
se_clk, and this wrapper DT binding should get the clk for the parent of
the se->clk to run round_rate() on. Then it could all be done in probe,
which sounds good.

> >> +       return iova;
> >> +}
> >> +EXPORT_SYMBOL(geni_se_tx_dma_prep);
> >> +
> >> +/**
> >> + * geni_se_rx_dma_prep() - Prepare the Serial Engine for RX DMA trans=
fer
> >> + * @se:                        Pointer to the concerned Serial Engine.
> >> + * @buf:               Pointer to the RX buffer.
> >> + * @len:               Length of the RX buffer.
> >> + *
> >> + * This function is used to prepare the buffers for DMA RX.
> >> + *
> >> + * Return: Mapped DMA Address of the buffer on success, NULL on failu=
re.
> >> + */
> >> +dma_addr_t geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t =
len)
> >> +{
> >> +       dma_addr_t iova;
> >> +       struct geni_wrapper *wrapper =3D se->wrapper;
> >> +       u32 val;
> >> +
> >> +       iova =3D dma_map_single(wrapper->dev, buf, len, DMA_FROM_DEVIC=
E);
> >> +       if (dma_mapping_error(wrapper->dev, iova))
> >> +               return (dma_addr_t)NULL;
> > =

> > Can't return a dma_mapping_error address to the caller and have them
> > figure it out?
> Earlier we used to return the DMA_ERROR_CODE which has been removed =

> recently in arm64 architecture. If we return the dma_mapping_error, then =

> the caller also needs the device which encountered the mapping error. =

> The serial interface drivers can use their parent currently to resolve =

> the mapping error. Once the wrapper starts mapping using IOMMU context =

> bank, then the serial interface drivers do not know which device to use =

> to know if there is an error.
> =

> Having said that, the dma_ops suggestion might help with handling this =

> situation. I will look into it further.

Ok, thanks.

> >> +{
> >> +       struct geni_wrapper *wrapper =3D se->wrapper;
> >> +
> >> +       if (iova)
> >> +               dma_unmap_single(wrapper->dev, iova, len, DMA_FROM_DEV=
ICE);
> >> +}
> >> +EXPORT_SYMBOL(geni_se_rx_dma_unprep);
> > =

> > Instead of having the functions exported, could we set the dma_ops on
> > all child devices of the wrapper that this driver populates and then
> > implement the DMA ops for those devices here? I assume that there's
> > never another DMA master between the wrapper and the serial engine, so I
> > think it would work.
> This suggestion looks like it will work.

It would be a good idea to check with some other people on the dma_ops
suggestion. Maybe add the DMA mapping subsystem folks to help out here

DMA MAPPING HELPERS
M:      Christoph Hellwig <hch@lst.de>
M:      Marek Szyprowski <m.szyprowski@samsung.com>
R:      Robin Murphy <robin.murphy@arm.com>
L:      iommu@lists.linux-foundation.org

> > =

> >> +
> >> +/* Transfer mode supported by GENI Serial Engines */
> >> +enum geni_se_xfer_mode {
> >> +       GENI_SE_INVALID,
> >> +       GENI_SE_FIFO,
> >> +       GENI_SE_DMA,
> >> +};
> >> +
> >> +/* Protocols supported by GENI Serial Engines */
> >> +enum geni_se_protocol_types {
> >> +       GENI_SE_NONE,
> >> +       GENI_SE_SPI,
> >> +       GENI_SE_UART,
> >> +       GENI_SE_I2C,
> >> +       GENI_SE_I3C,
> >> +};
> >> +
> >> +/**
> >> + * struct geni_se - GENI Serial Engine
> >> + * @base:              Base Address of the Serial Engine's register b=
lock.
> >> + * @dev:               Pointer to the Serial Engine device.
> >> + * @wrapper:           Pointer to the parent QUP Wrapper core.
> >> + * @clk:               Handle to the core serial engine clock.
> >> + */
> >> +struct geni_se {
> >> +       void __iomem *base;
> >> +       struct device *dev;
> >> +       void *wrapper;
> > =

> > Can this get the geni_wrapper type? It could be opaque if you like.
> I am not sure if it is ok to have the children know the details of the =

> parent. That is why it is kept as opaque.

That's fine, but I mean to have struct geni_wrapper *wrapper, and then
struct geni_wrapper; in this file. Children won't know details and we
get slightly more type safety.
