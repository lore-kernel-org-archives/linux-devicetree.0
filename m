From: "Herrero, Gregory" <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: add support of hi6220
Date: Fri, 20 Nov 2015 17:15:33 +0100
Message-ID: <20151120161533.GA2987@herrerog>
References: <1447832387-27549-1-git-send-email-zhangfei.gao@linaro.org>
 <87ziy9erpi.fsf@saruman.tx.rr.com>
 <2B3535C5ECE8B5419E3ECBE30077290901DC3D9462@US01WEMBX2.internal.synopsys.com>
 <871tbkelca.fsf@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <871tbkelca.fsf-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

I just realized this patch miss "dma_desc_fs_enable" property in
params_hi6220. (drivers/usb/dwc2/platform.c:57)

You need to apply this patch:

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index d5102c4..2dfdae3 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -59,6 +59,7 @@ static const struct dwc2_core_params params_hi6220 = {
        .otg_ver                        = 0,    /* 1.3 */
        .dma_enable                     = 1,
        .dma_desc_enable                = 0,
+       .dma_desc_fs_enable             = 0,
        .speed                          = 0,    /* High Speed */
        .enable_dynamic_fifo            = 1,
        .en_multiple_tx_fifo            = 1,


Note that it is needed due to below patch.
"usb: dwc2: host: enable descriptor dma for fs devices"

Regards,
Gregory

On Fri, Nov 20, 2015 at 04:34:13PM +0100, Felipe Balbi wrote:
> 
> Hi,
> 
> John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> > On 11/19/2015 11:04 AM, Felipe Balbi wrote:
> >> 
> >> Hi,
> >> 
> >> Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:
> >>> Support hisilicon,hi6220-usb for HiKey board
> >>>
> >>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >> 
> >> doesn't apply:
> >> 
> >> Applying: usb: dwc2: add support of hi6220
> >> error: drivers/usb/dwc2/platform.c: does not match index
> >> Patch failed at 0001 usb: dwc2: add support of hi6220
> >> The copy of the patch that failed is found in: workspace/linux/.git/rebase-apply/patch
> >> When you have resolved this problem, run "git am --continue".
> >> If you prefer to skip this patch, run "git am --skip" instead.
> >> To restore the original branch and stop patching, run "git am --abort".
> >> 
> >> Care to rebase on my testing/next and also collect John's and Rob's ack ?
> >> 
> >
> >
> > That's weird. I just sync'd to your testing/next and it seems to
> > apply fine.
> >
> > Same with the series from Gregory Herrero.
> >
> > Any chance it's something to do with your local repo?
> 
> odd. Seems like it works if I apply manually with git am, but fails if I
> pipe message from emacs to git am. Oh well, let me try again.
> 
> -- 
> balbi


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
