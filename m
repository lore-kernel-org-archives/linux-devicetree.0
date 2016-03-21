From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v13 06/14] drm/mediatek: Add HDMI support
Date: Mon, 21 Mar 2016 18:45:29 +0100
Message-ID: <1458582329.3364.133.camel@pengutronix.de>
References: <1457443649-12133-1-git-send-email-p.zabel@pengutronix.de>
	 <1457443649-12133-7-git-send-email-p.zabel@pengutronix.de>
	 <CAGS+omD6_hNMVYCnmsHheyxpGZXDf7H+XVHT5C4wVCKDvgpQ7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omD6_hNMVYCnmsHheyxpGZXDf7H+XVHT5C4wVCKDvgpQ7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cawa Cheng <cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWMMKQXVYFwzLw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel, Jie,

Am Mittwoch, den 09.03.2016, 21:52 +0800 schrieb Daniel Kurtz:
> Hi Philipp & Jie,
> 
> Sorry I only now had a chance to dig deeper and review the HDMI driver.

I wish you had had a chance to do this earlier, But better now than
after the merge. I'll split the HDMI patches from the others in the next
round.

> Lots of comments inline below...
>
> On Tue, Mar 8, 2016 at 9:27 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
[...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> > new file mode 100644
> > index 0000000..cba3647
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> > +void mtk_cec_set_hpd_event(struct device *dev,
> > +                          void (*hpd_event)(bool hpd, struct device *dev),
> > +                          struct device *hdmi_dev)
> > +{
> > +       struct mtk_cec *cec = dev_get_drvdata(dev);
> > +
> > +       cec->hdmi_dev = hdmi_dev;
> > +       cec->hpd_event = hpd_event;
> 
> Lock this so to prevent race with the irq?

Yes.

[...]
> > +int mtk_cec_irq(struct device *dev)
> 
> AFAICT, this function is never used.

Correct, since the IRQ number is not exported to the sound drivers
anymore, I can drop it now.

[...]
> > +static void mtk_cec_htplg_irq_enable(struct mtk_cec *cec)
> > +{
> > +       mtk_cec_mask(cec, CEC_CKGEN, 0, PDN);
> > +       mtk_cec_mask(cec, CEC_CKGEN, CEC_32K_PDN, CEC_32K_PDN);
> > +       mtk_cec_mask(cec, RX_GEN_WD, HDMI_PORD_INT_32K_CLR,
> > +                    HDMI_PORD_INT_32K_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, RX_INT_32K_CLR, RX_INT_32K_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, HDMI_HTPLG_INT_32K_CLR,
> > +                    HDMI_HTPLG_INT_32K_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, 0, HDMI_PORD_INT_32K_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, 0, RX_INT_32K_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, 0, HDMI_HTPLG_INT_32K_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, 0, HDMI_PORD_INT_32K_EN);
> > +       mtk_cec_mask(cec, RX_GEN_WD, 0, RX_INT_32K_EN);
> > +       mtk_cec_mask(cec, RX_GEN_WD, 0, HDMI_HTPLG_INT_32K_EN);
> 
> This is a bit wasteful.  Can you just clear all of these bits in a single write?
> (this applies to this entire file).

I think so. If there are no problems, I'll combine them into a single
update per register.

> > +
> > +       mtk_cec_mask(cec, RX_EVENT, HDMI_PORD_INT_EN, HDMI_PORD_INT_EN);
> > +       mtk_cec_mask(cec, RX_EVENT, HDMI_HTPLG_INT_EN, HDMI_HTPLG_INT_EN);
> > +}
> > +
> > +static void mtk_cec_htplg_irq_disable(struct mtk_cec *cec)
> > +{
> 
> Why does irq_enable do so much more work than irq_disable?

It also clears the interrupt status and sets the clock. I'll move the
initialization out of this function.

> > +       mtk_cec_mask(cec, RX_EVENT, 0, HDMI_PORD_INT_EN);
> > +       mtk_cec_mask(cec, RX_EVENT, 0, HDMI_HTPLG_INT_EN);
> > +}
> > +
> > +static void mtk_cec_clear_htplg_irq(struct mtk_cec *cec)
> > +{
> > +       mtk_cec_mask(cec, TR_CONFIG, CLEAR_CEC_IRQ, CLEAR_CEC_IRQ);
> > +       mtk_cec_mask(cec, NORMAL_INT_CTRL, HDMI_HTPLG_INT_CLR,
> > +                    HDMI_HTPLG_INT_CLR);
> > +       mtk_cec_mask(cec, NORMAL_INT_CTRL, HDMI_PORD_INT_CLR,
> > +                    HDMI_PORD_INT_CLR);
> > +       mtk_cec_mask(cec, NORMAL_INT_CTRL, HDMI_FULL_INT_CLR,
> > +                    HDMI_FULL_INT_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, HDMI_PORD_INT_32K_CLR,
> > +                    HDMI_PORD_INT_32K_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, RX_INT_32K_CLR, RX_INT_32K_CLR);
> > +       mtk_cec_mask(cec, RX_GEN_WD, HDMI_HTPLG_INT_32K_CLR,
> > +                    HDMI_HTPLG_INT_32K_CLR);
> > +       udelay(5);
> 
> Do you really need this delay in the middle of the isr handler?

I can turn it into an usleep_range(5, 10). Whether the delay is needed
at all or how long it really has to be, I don't know.

[...]
> > +static irqreturn_t mtk_cec_htplg_isr_thread(int irq, void *arg)
> > +{
> > +       struct device *dev = arg;
> > +       struct mtk_cec *cec = dev_get_drvdata(dev);
> > +       bool hpd;
> > +
> > +       mtk_cec_clear_htplg_irq(cec);
> > +       hpd = mtk_cec_hpd_high(dev);
> > +
> > +       if (cec->hpd != hpd) {
> > +               dev_info(dev, "hotplug event!,cur hpd = %d, hpd = %d\n",
> > +                        cec->hpd, hpd);
> 
> dev_dbg if anything

Ok.

[...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_hdmi_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_hdmi_drv.c
> > new file mode 100644
> > index 0000000..ff661e0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_hdmi_drv.c
[...]
> > +static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
> > +{
> > +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
> > +
> > +       phy_power_off(hdmi->phy);
> > +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
> > +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
> 
> As far as I can tell, __drm_helper_disable_unused_functions() doesn't
> check if crtc/encoder/bridge are disabled before calling the
> ->*en/disable*() callbacks.
>
> So, these clk_disable_unprepare() may be called with the HDMI already disabled,
> trigerring their WARN_ON().
> 
> So, perhaps we also need to track enabled/disabled state separately here in
> the driver.

I'll add that.

[...]
> > +       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       hdmi->regs = devm_ioremap_resource(dev, mem);
> > +       if (IS_ERR(hdmi->regs)) {
> > +               dev_err(dev, "Failed to ioremap hdmi_shell: %ld\n",
> > +                       PTR_ERR(hdmi->regs));
> 
> What is hdmi_shell?

I don't know, I assumed it's just the name of the HDMI control register
space.

> In any case, I don't think you need to print anything here.

I'll drop the printk.

[...]
> > +static int mtk_drm_hdmi_remove(struct platform_device *pdev)
> > +{
> > +       struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
> > +
> > +       drm_bridge_remove(&hdmi->bridge);
> > +       platform_device_unregister(hdmi->audio_pdev);
> 
> audio_pdev is not set in this patch.
> Is there more audio stuff that should be removed from this patch?

I suppose I could also remove the hdmi_audio_param struct and simplify
mtk_hdmi_aud_set_input() a bit.

> > +       platform_set_drvdata(pdev, NULL);
> 
> I don't think this is necessary.

Right.

[...]
> > +static int mtk_hdmi_resume(struct device *dev)
> > +{
> > +       struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> > +       int ret = 0;
> > +
> > +       ret = mtk_hdmi_clk_enable_audio(hdmi);
> > +       if (ret) {
> > +               dev_err(dev, "hdmi resume failed!\n");
> > +               return ret;
> > +       }
> > +
> > +       mtk_hdmi_power_on(hdmi);
> > +       mtk_hdmi_output_set_display_mode(hdmi, &hdmi->mode);
> > +       phy_power_on(hdmi->phy);
> > +       dev_dbg(dev, "hdmi resume success!\n");
> > +       return 0;
> > +}
> > +#endif
> > +static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
> > +                        mtk_hdmi_suspend, mtk_hdmi_resume);
> 
> I do not think these suspend/resume ops are needed.
> The MTK DRM driver turn off connectors at suspend, and re-enables them
> at resume.

I have to move the audio clock enabling into the bridge enable/disable
to drop these completely, not sure yet if that will have any side
effects.

[...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > new file mode 100644
> > index 0000000..30ec7b5
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> 
> Hmm... what is the value in splitting this out into its own separate mtk_hdmi.c?

If nobody minds, I'll happily merge mtk_drm_hdmi_drv.c, mtk_hdmi.c and
mtk_hdmi_hw.c. The downside is that the file is now >1.8k lines, but I
think the amount of newly static functions is worth it.

[...]
> > +static int mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
> > +{
[...]
> > +       mtk_hdmi_hw_aud_set_high_bitrate(hdmi, false);
> > +       mtk_hdmi_phy_aud_dst_normal_double_enable(hdmi, false);
> > +       mtk_hdmi_hw_aud_dst_enable(hdmi, false);
> 
> These three all change the same register.  Combine them into a single helper
> function that just writes GRL_AUDIO_CFG once.

Ok.

[...]
> > +static int mtk_hdmi_aud_set_src(struct mtk_hdmi *hdmi,
> > +                               struct drm_display_mode *display_mode)
> > +{
> > +       mtk_hdmi_aud_on_off_hw_ncts(hdmi, false);
> > +
> > +       if (hdmi->aud_param.aud_input_type == HDMI_AUD_INPUT_I2S) {
> > +               switch (hdmi->aud_param.aud_hdmi_fs) {
> > +               case HDMI_AUDIO_SAMPLE_FREQUENCY_32000:
> > +               case HDMI_AUDIO_SAMPLE_FREQUENCY_44100:
> > +               case HDMI_AUDIO_SAMPLE_FREQUENCY_48000:
> > +               case HDMI_AUDIO_SAMPLE_FREQUENCY_88200:
> > +               case HDMI_AUDIO_SAMPLE_FREQUENCY_96000:
> > +                       mtk_hdmi_hw_aud_src_off(hdmi);
> > +                       /* mtk_hdmi_hw_aud_src_enable(hdmi, false); */
> 
> why is this commented out?

Not yet implemented at this point. I'll remove it.

> > +                       mtk_hdmi_hw_aud_set_mclk(
> > +                       hdmi,
> > +                       hdmi->aud_param.aud_mclk);
> 
> indentation is funny here

Will fix, and the following similar issues, too.

> > +                       mtk_hdmi_hw_aud_src_off(hdmi);
> > +                       mtk_hdmi_hw_aud_set_mclk(hdmi,
> > +                                                HDMI_AUD_MCLK_128FS);
> > +                       mtk_hdmi_hw_aud_aclk_inv_enable(hdmi, false);
> 
> These clauses all seem to do the same thing; only the mclk parameter is
> different.  Can you refactor them into a helper function?

Yes, I'll have to integrate a few changes from the
"drm/mediatek: hdmi: Add audio interface to the hdmi-codec driver"
patch here.

[...]
> > +int mtk_hdmi_hpd_high(struct mtk_hdmi *hdmi)
> > +{
> > +       return hdmi->cec_dev ? mtk_cec_hpd_high(hdmi->cec_dev) : false;
> 
> I don't think we would get this far if cec_dev was NULL.

You are right, the HDMI device defers probing until it can find the CEC
device. I'll drop mtk_hdmi_hpd_high and call mtk_cec_hpd_high directly.

> > +int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
> > +{
> > +       struct hdmi_audio_param *aud_param = &hdmi->aud_param;
> > +
> > +       if (hdmi->init)
> > +               return -EINVAL;
> 
> This check is not needed; this function is only called once, during probe.
> In fact, I don't think the "->init" field is needed at all.

I agree. mtk_hdmi_output_init is called in probe before drm_bridge_add.
mtk_hdmi_output_set_display_mode, which this is supposed to protect, is
only called from the bridge_enable callback. Another indication that the
code is split over too many files.

[...]
> > +int mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
> > +                                    struct drm_display_mode *mode)
> > +{
> > +       int ret;
> > +
> > +       if (!hdmi->init) {
> 
> Is this possible?

No. I'll remove it.

> > +               dev_err(hdmi->dev, "doesn't init hdmi control context!\n");
> > +               return -EINVAL;
> > +       }
> > +
> > +       mtk_hdmi_hw_vid_black(hdmi, true);
> > +       mtk_hdmi_hw_aud_mute(hdmi, true);
> > +       mtk_hdmi_setup_av_mute_packet(hdmi);
> > +       phy_power_off(hdmi->phy);
> > +
> > +       ret = mtk_hdmi_video_change_vpll(hdmi,
> > +                                        mode->clock * 1000);
> > +       if (ret) {
> > +               dev_err(hdmi->dev, "Failed to set vpll: %d\n", ret);
> 
> cleanup on error?

The only things that happen before are vid_black/aud_mute and PHY power
off. I assume neither can reasonably be reverted if we can't even set
the PLL correctly?

> > +               return ret;
> > +       }
> > +       mtk_hdmi_video_set_display_mode(hdmi, mode);
> > +
> > +       phy_power_on(hdmi->phy);
> > +       mtk_hdmi_aud_output_config(hdmi, mode);
> > +
> > +       mtk_hdmi_setup_audio_infoframe(hdmi);
> > +       mtk_hdmi_setup_avi_infoframe(hdmi, mode);
> > +       mtk_hdmi_setup_spd_infoframe(hdmi, "mediatek", "chromebook");
> 
> what?  No.  The "product" should refer to the MTK HDMI block.

I need a little help here. "mediatek", "On-chip HDMI"?
The Intel driver sets "intel", "Integrated gfx", for example.

> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
> > new file mode 100644
> > index 0000000..9403915
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.h
[...]
> > +struct mtk_hdmi {
> > +       struct drm_bridge bridge;
> > +       struct drm_connector conn;
> > +       struct device *dev;
> > +       struct phy *phy;
> > +       struct device *cec_dev;
> > +       struct i2c_adapter *ddc_adpt;
> > +       struct clk *clk[MTK_HDMI_CLK_COUNT];
> > +#if defined(CONFIG_DEBUG_FS)
> > +       struct dentry *debugfs;
> > +#endif
> 
> Remove all of the debugfs stuff from this patch, since it isn't implemented.

Ok.

[...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_drv.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_drv.c
> > new file mode 100644
> > index 0000000..22e5487
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_drv.c
[...]
> > +struct mtk_hdmi_i2c {
> 
> Throughout this driver, I think we should:
> 
> s/mtk_hdmi_i2c/mtk_hdmi_ddc

I'm fine with that.

[...]
> > +static void ddcm_trigger_mode(struct mtk_hdmi_i2c *i2c, int mode)
> > +{
[...]
> > +       while (sif_bit_is_set(i2c, DDC_DDCMCTL1, DDCM_TRI)) {
> > +               timeout -= 2;
> > +               udelay(2);
> > +               if (timeout <= 0)
> > +                       break;
> > +       }
> 
> Use iopoll?

I'll replace the loop with readl_poll_timeout().

[...]
> > +static int mtk_hdmi_i2c_probe(struct platform_device *pdev)
> > +{
[...]
> > +       i2c->clk = devm_clk_get(dev, "ddc-i2c");
> > +       if (IS_ERR(i2c->clk)) {
> > +               dev_err(dev, "get ddc_clk failed : %p ,\n", i2c->clk);
> 
> nit, no space before ':'

Ok.

[...]
> > +       mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
> > +       if (IS_ERR(i2c->regs)) {
> > +               dev_err(dev, "get memory source fail!\n");
> 
> nit: don't really need to print anything here.

Ok.

[...]
> > +       strlcpy(i2c->adap.name, "mediatek-hdmi-i2c", sizeof(i2c->adap.name));
> > +       i2c->adap.owner = THIS_MODULE;
> 
> i2c->adap.class = I2C_CLASS_DDC;

Ok.

> > +       i2c->adap.algo = &mtk_hdmi_i2c_algorithm;
> > +       i2c->adap.retries = 3;
> 
> why set this?

Jie, is there a known issue that made it necessary to enable the
automatic retries?

[...]
> > +       dev_dbg(dev, "i2c->adap: %p\n", &i2c->adap);
> > +       dev_dbg(dev, "i2c->clk: %p\n", i2c->clk);
> > +       dev_dbg(dev, "physical adr: 0x%llx, end: 0x%llx\n", mem->start,
> > +               mem->end);
> 
> remove these debugging lines.

Ok.

[...]
> > +static int mtk_hdmi_i2c_remove(struct platform_device *pdev)
> > +{
> > +       struct mtk_hdmi_i2c *i2c = platform_get_drvdata(pdev);
> > +
> > +       clk_disable_unprepare(i2c->clk);
> > +       i2c_del_adapter(&i2c->adap);
> 
> To match probe order, call i2c_del_adapter() first.

Ok.

[...]
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_hw.c b/drivers/gpu/drm/mediatek/mtk_hdmi_hw.c
> > new file mode 100644
> > index 0000000..99c7ffc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_hw.c
> 
> What is the value in having this as a separate mtk_hdmi_hw.c file?
> If these functions were in mtk_hdmi.c, they could all be static, and
> the compiler
> could inline them away.

Yes, I'd prefer to merge all three into mtk_hdmi.c.

[...]
> > +#include "mtk_hdmi_hw.h"
> > +#include "mtk_hdmi_regs.h"
> > +#include "mtk_hdmi.h"
> 
> I think these usually go after system includes.

Ok.

[...]
> > +#define NCTS_BYTES          0x07
> 
> move above the functions

Ok.

[...]
> > +       switch (frame_type) {
> > +       case HDMI_INFOFRAME_TYPE_AVI:
> > +               ctrl_frame_en = CTRL_AVI_EN;
> > +               ctrl_reg = GRL_CTRL;
> > +               break;
> > +       case HDMI_INFOFRAME_TYPE_SPD:
> > +               ctrl_frame_en = CTRL_SPD_EN;
> > +               ctrl_reg = GRL_CTRL;
> > +               break;
> > +       case HDMI_INFOFRAME_TYPE_AUDIO:
> > +               ctrl_frame_en = CTRL_AUDIO_EN;
> > +               ctrl_reg = GRL_CTRL;
> > +               break;
> > +       case HDMI_INFOFRAME_TYPE_VENDOR:
> > +               ctrl_frame_en = VS_EN;
> > +               ctrl_reg = GRL_ACP_ISRC_CTRL;
> > +               break;
> > +       default:
> 
> Just fall through if none of the above?

These are the only four currently defined. I'll change frame_type to
enum hdmi_infoframe_type and drop the default label.

[...]
> > +void mtk_hdmi_hw_config_sys(struct mtk_hdmi *hdmi)
> > +{
> > +       regmap_update_bits(hdmi->sys_regmap, hdmi->sys_offset + HDMI_SYS_CFG20,
> > +                          HDMI_OUT_FIFO_EN | MHL_MODE_ON, 0);
> > +       mdelay(2);
> 
> Can this be msleep instead of mdelay?
> It is a bit rude to hog the CPU for 2 msec.

Yes this is ultimately called by .bridge_enable.
Same for the others two mdelay()s.

[...]
> > +void mtk_hdmi_hw_aud_set_bit_num(struct mtk_hdmi *hdmi,
> > +                                enum hdmi_audio_sample_size bit_num)
> > +{
> > +       u32 val = 0;
> 
> no 0 init

I'll use a switch statement below instead.

> > +
> > +       if (bit_num == HDMI_AUDIO_SAMPLE_SIZE_16)
> > +               val = AOUT_16BIT;
> > +       else if (bit_num == HDMI_AUDIO_SAMPLE_SIZE_20)
> > +               val = AOUT_20BIT;
> > +       else if (bit_num == HDMI_AUDIO_SAMPLE_SIZE_24)
> > +               val = AOUT_24BIT;
> > +
> > +       mtk_hdmi_mask(hdmi, GRL_AOUT_BNUM_SEL, val, 0x03);
> > +}
> > +
> > +void mtk_hdmi_hw_aud_set_i2s_fmt(struct mtk_hdmi *hdmi,
> > +                                enum hdmi_aud_i2s_fmt i2s_fmt)
> > +{
> > +       u32 val = 0;
> 
> no 0 init

Ok.

> > +
> > +       val = mtk_hdmi_read(hdmi, GRL_CFG0);
> > +       val &= ~0x33;
> 
> #define this mask

Ok.

[...]
> > +void mtk_hdmi_hw_aud_set_i2s_chan_num(struct mtk_hdmi *hdmi,
> > +                                     enum hdmi_aud_channel_type channel_type,
> > +                                     u8 channel_count)
> > +{
> > +       u8 val_1, val_2, val_3, val_4;
> 
> better:
>   u8 sw[3], uv;

Yes, I'll try to make this function a bit more readable.

> > +
> > +       if (channel_count == 2) {
> > +               val_1 = 0x04;
> > +               val_2 = 0x50;
> 
> Some #defines with meaningful names would be nice here.

I'll add a few defines. Also I notice that the ch_switch matrix
configuration is always the same.

[...]
> > +void mtk_hdmi_hw_aud_set_input_type(struct mtk_hdmi *hdmi,
> > +                                   enum hdmi_aud_input_type input_type)
> > +{
> > +       u32 val = 0;
> 
> no need to 0 init

Ok.

[...]
> > +void mtk_hdmi_hw_aud_set_channel_status(struct mtk_hdmi *hdmi,
> > +                                       u8 *l_chan_status, u8 *r_chan_status,
> > +                                       enum hdmi_audio_sample_frequency
> > +                                       aud_hdmi_fs)
> > +{
> > +       u8 l_status[5];
> > +       u8 r_status[5];
> > +       u8 val = 0;
> 
> no need to 0 init

Ok.

[...]
> > +       val = l_chan_status[4];
> > +       val |= ((~(l_status[3] & 0x0f)) << 4);
> > +       l_status[4] = val;
> > +       r_status[4] = val;
> > +
> > +       val = l_status[0];
> 
> nit: You don't need to bounce through val here.
> You can just write the *_status[n] value directly.

You are right, I have already fixed this in the later audio patches.
I'll reorganize this a bit.

[...]
> > +void mtk_hdmi_hw_aud_src_reenable(struct mtk_hdmi *hdmi)
> > +{
> > +       u32 val;
> > +
> > +       val = mtk_hdmi_read(hdmi, GRL_MIX_CTRL);
> > +       if (val & MIX_CTRL_SRC_EN) {
> > +               val &= ~MIX_CTRL_SRC_EN;
> > +               mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
> > +               usleep_range(255, 512);
> 
> Those are some very precise values for a range...

Peculiar. If there are no objections, I'll change them to 250-500.

> > +               val |= MIX_CTRL_SRC_EN;
> > +               mtk_hdmi_write(hdmi, GRL_MIX_CTRL, val);
> > +       }
> > +}
> > +
> > +void mtk_hdmi_hw_aud_src_off(struct mtk_hdmi *hdmi)
> 
> Perhaps *_disable() would be more consistent.

Ok. Although the use of disable/reenable here seems to be inverted
compared to the common enable/disable pattern.

[...]
> > +void mtk_hdmi_hw_aud_aclk_inv_enable(struct mtk_hdmi *hdmi, bool enable)
> 
> nit: I prefer explicit _enable() and _disable() functions w/out the
> 'enable' parameter.

This function doesn't enable/disable a clock, it justs sets the ACLK_INV
bit, which supposedly determines whether the inverse audio clock is used
to latch data when downsampling 192k to 48k in I2S. I'll rename this to
mtk_hdmi_hw_aud_set_aclk_inv(). Or I could drop this function when
merging hdmi_hw.c into hdmi.c and use something like
	mtk_hdmi_clear_bits(hdmi, GRL_CFG2, CFG2_ACLK_INV)
directly.

[...]
> > +static unsigned int hdmi_expected_cts(unsigned int audio_sample_rate,
> > +                                     unsigned int tmds_clock, unsigned int n)
> > +{
> > +       return DIV_ROUND_CLOSEST_ULL((u64)hdmi_mode_clock_to_hz(tmds_clock) * n,
> > +                                    128 * audio_sample_rate);
> > +}
> 
> Doug Anderson may have some opinions about how N & CTS are computed.

I intend to use Arnaud's N/CTS helpers instead, when they are merged.

[...]
> > +static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
> > +                                   unsigned int cts)
> > +{
> > +       unsigned char val[NCTS_BYTES];
> > +       int i;
> > +
> > +       mtk_hdmi_write(hdmi, GRL_NCTS, 0);
> > +       mtk_hdmi_write(hdmi, GRL_NCTS, 0);
> > +       mtk_hdmi_write(hdmi, GRL_NCTS, 0);
> > +       memset(val, 0, sizeof(val));
> 
> not necessary, since you fill in all 7 bytes anyway.

Ok.

> > +
> > +       val[0] = (cts >> 24) & 0xff;
> > +       val[1] = (cts >> 16) & 0xff;
> > +       val[2] = (cts >> 8) & 0xff;
> > +       val[3] = cts & 0xff;
> > +
> > +       val[4] = (n >> 16) & 0xff;
> > +       val[5] = (n >> 8) & 0xff;
> > +       val[6] = n & 0xff;
> 
> all of these "& 0xff" are not needed, since val is an unsigned char array.

Even so, this makes it clear what happens. I expect the compiler to
optimize them away if possible.

> > +
> > +       for (i = 0; i < NCTS_BYTES; i++)
> > +               mtk_hdmi_write(hdmi, GRL_NCTS, val[i]);
> 
> What an interesting design.  We write all 10 bytes to the same register address?

That is what I am told.

> In this case, why bother with val at all?
> Just directly call mtk_hdmi_write() for each of the bytes above.

Yes, that would be better.

> > diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> > new file mode 100644
> > index 0000000..5d9f07f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
[...]
> > +static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
> > +{
> > +       struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> > +
> > +       dev_dbg(hdmi_phy->dev, "prepare\n");
> 
> nit: "unprepare" (or just '"%s\n", __func__)', here and everywhere.

Ok.

> > +static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                                unsigned long parent_rate)
> > +{
> > +       struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
> > +       unsigned int pre_div;
> > +       unsigned int div;
> > +
> > +       dev_dbg(hdmi_phy->dev, "set rate : %lu, parent: %lu\n", rate,
> 
> nit, no space before the first ':'.

Ok.

> > +static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
> > +{
> > +       mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON3, RG_HDMITX_SER_EN,
> > +                         RG_HDMITX_SER_EN);
> 
> nit: lots of these calls might be more readable (and easier to maintain &
> review) if we used two helper functions:
> 
> mtk_hdmi_phy_set_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset, u32 mask);
> mtk_hdmi_phy_clr_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset, u32 mask);
> 
> and
> 
> mtk_hdmi_set_bits()
> mtk_hdmi_clr_bits()

It seems I'm too used to regmap_update_bits. I don't find separate
set/clear functions easier to read at all, and I stumble over the clr
abbreviation. I'll change to _set_bits and _clear_bits functions and
hope that I am in the minority.

[...]
> > +static struct phy_ops mtk_hdmi_phy_ops = {
> 
> static const

Ok. Thanks for the review!

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
