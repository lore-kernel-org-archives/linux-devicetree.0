From: Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 00/12] Clean up "mediatek,larb" after adding device_link
Date: Sat, 27 Jul 2019 15:51:28 +0800
Message-ID: <1564213888.22908.4.camel@mhfsdcap03>
References: <1560171313-28299-1-git-send-email-yong.wu@mediatek.com>
	<1563849109.27558.14.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <1563849109.27558.14.camel@mtksdaap41>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: youlin.pei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Boichat <drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Evan Green <evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joey.pan-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, anan.sun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2019-07-23 at 10:31 +0800, CK Hu wrote:
> Hi, Yong:
> 
> I've added log  in mtk_smi_clk_enable() and mtk_smi_clk_disable(), and I
> boot MT8183 with display, the log is
> 
> [    4.020340] mtk-smi-common 14019000.smi: mtk_smi_clk_enable()
> [    4.331371] mtk-smi-common 14019000.smi: mtk_smi_clk_disable()
> [    4.429578] mtk-smi-common 14019000.smi: mtk_smi_clk_enable()
> [    4.719743] mtk-smi-common 14019000.smi: mtk_smi_clk_disable()
> [    5.084770] mtk-smi-common 14019000.smi: mtk_smi_clk_enable()
> [    5.904310] mtk-smi-common 14019000.smi: mtk_smi_clk_disable()
> 
> From the log, the clock is finally turned off, but the display works
> normally. This is because scpsys has turn the clock on,
> 
> 		scpsys: syscon@10006000 {
> 			compatible = "mediatek,mt8183-scpsys", "syscon";
> 			#power-domain-cells = <1>;
> 			reg = <0 0x10006000 0 0x1000>;
> 			clocks = <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
> 				 <&mmsys CLK_MM_SMI_COMMON>,
> 				 <&mmsys CLK_MM_GALS_COMM0>,
> 				 <&mmsys CLK_MM_GALS_COMM1>,
> 			clock-names = "audio","mm-0",
> 				      "mm-1", "mm-2";
> 		}
> 
> I'm worried that for MT8173, scpsys would not turn on subsys clock, this
> series would let display work abnormally, so I think smi common should
> not depend on scpsys to turn on the clock.
> 
> You could simply remove the clock parameter in scpsys device node, and
> you would see the display works abnormally.

Thanks for the report. I have reproduced this issue by removing the smi
clock in scpsys node.

Now the probe sequence is like this:
a) mtk scpsys (genpd) probe
b) smi probe
c) iommu probe
d) display and the other MM probe.

The log above are called from device_link_add and rpm_idle which is
called between iommu-probe and display-probe.

At the beginning, all the clocks are enabled. But after this
mtk_smi_clk_enable and mtk_smi_clk_disable, the display clock will be
turned off. If the fastlogo is displayed before kernel, then the display
HW will work abnormally.

I have no mt8173 evb board now, I remembered that the screen only is
showed in display driver of kernel in mt8173, It may be ok in that case.
But It really is a problem when the fastlogo is showed before kernel.

This clock issue happened before display driver, It looks display driver
can not help this. I will try to fix it in SMI(smi try to help
display(larb0) to pm_runtime_get_sync one time and put later).


> 
> Regards,
> CK
> 
> 
> On Mon, 2019-06-10 at 20:55 +0800, Yong Wu wrote:
> > MediaTek IOMMU block diagram always like below:
> > 
> >         M4U
> >          |
> >     smi-common
> >          |
> >   -------------
> >   |         |  ...
> >   |         |
> > larb1     larb2
> >   |         |
> > vdec       venc
> > 
> > All the consumer connect with smi-larb, then connect with smi-common.
> > 
> > MediaTek IOMMU don't have its power-domain. When the consumer works,
> > it should enable the smi-larb's power which also need enable the smi-common's
> > power firstly.
> > 
> > Thus, Firstly, use the device link connect the consumer and the
> > smi-larbs. then add device link between the smi-larb and smi-common.
> > 
> > After adding the device_link, then "mediatek,larb" property can be removed.
> > the iommu consumer don't need call the mtk_smi_larb_get/put to enable
> > the power and clock of smi-larb and smi-common.
> > 
> > This patchset depends on "MT8183 IOMMU SUPPORT"[1].
> > 
> > [1] https://lists.linuxfoundation.org/pipermail/iommu/2019-June/036552.html
> > 
> > Change notes:
> > v2:
> >    1) rebase on v5.2-rc1.
> >    2) Move adding device_link between the consumer and smi-larb into
> > iommu_add_device from Robin.
> >    3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
> >    4) Remove the shutdown callback in iommu.   
> > 
> > v1: https://lists.linuxfoundation.org/pipermail/iommu/2019-January/032387.html
> > 
> > Yong Wu (12):
> >   dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
> >   iommu/mediatek: Add probe_defer for smi-larb
> >   iommu/mediatek: Add device_link between the consumer and the larb
> >     devices
> >   memory: mtk-smi: Add device-link between smi-larb and smi-common
> >   media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
> >   media: mtk-mdp: Get rid of mtk_smi_larb_get/put
> >   media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
> >   drm/mediatek: Get rid of mtk_smi_larb_get/put
> >   memory: mtk-smi: Get rid of mtk_smi_larb_get/put
> >   iommu/mediatek: Use builtin_platform_driver
> >   arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
> >   arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes
> > 
> >  .../bindings/display/mediatek/mediatek,disp.txt    |  9 -----
> >  .../bindings/media/mediatek-jpeg-decoder.txt       |  4 --
> >  .../devicetree/bindings/media/mediatek-mdp.txt     |  8 ----
> >  .../devicetree/bindings/media/mediatek-vcodec.txt  |  4 --
> >  arch/arm/boot/dts/mt2701.dtsi                      |  1 -
> >  arch/arm/boot/dts/mt7623.dtsi                      |  1 -
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 15 -------
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 11 -----
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 26 ------------
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  1 -
> >  drivers/iommu/mtk_iommu.c                          | 45 +++++++--------------
> >  drivers/iommu/mtk_iommu_v1.c                       | 39 +++++++-----------
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 22 ----------
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  2 -
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c      | 38 -----------------
> >  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h      |  2 -
> >  drivers/media/platform/mtk-mdp/mtk_mdp_core.c      |  1 -
> >  .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  | 21 ----------
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  3 --
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |  1 -
> >  .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  | 47 ----------------------
> >  drivers/memory/mtk-smi.c                           | 31 ++++----------
> >  include/soc/mediatek/smi.h                         | 20 ---------
> >  23 files changed, 36 insertions(+), 316 deletions(-)
> > 
> 
> 
