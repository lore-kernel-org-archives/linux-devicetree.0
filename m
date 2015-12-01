From: andrew-ct chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND RFC/PATCH 3/8] media: platform: mtk-vpu: Support
 Mediatek VPU
Date: Tue, 1 Dec 2015 22:31:12 +0800
Message-ID: <1448980272.25447.6.camel@mtksdaap41>
References: <1447764885-23100-1-git-send-email-tiffany.lin@mediatek.com>
	 <1447764885-23100-4-git-send-email-tiffany.lin@mediatek.com>
	 <5655DDB4.2080002@linaro.org> <1448626209.7734.26.camel@mtksdaap41>
	 <56584AC5.7020704@linaro.org> <1448883819.15961.7.camel@mtksdaap41>
	 <CAMTL27G8WRTTGCtU9pXpp1-inyzZE9Jat1SkOiX5HMG5E-eFzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMTL27G8WRTTGCtU9pXpp1-inyzZE9Jat1SkOiX5HMG5E-eFzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Ro
List-Id: devicetree@vger.kernel.org

On Mon, 2015-11-30 at 15:36 +0000, Daniel Thompson wrote:
> On 30 November 2015 at 11:43, andrew-ct chen
> <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > On Fri, 2015-11-27 at 12:21 +0000, Daniel Thompson wrote:
> >> On 27/11/15 12:10, andrew-ct chen wrote:
> >> >>> +
> >> >>> > >+      memcpy((void *)send_obj->share_buf, buf, len);
> >> >>> > >+      send_obj->len = len;
> >> >>> > >+      send_obj->id = id;
> >> >>> > >+      vpu_cfg_writel(vpu, 0x1, HOST_TO_VPU);
> >> >>> > >+
> >> >>> > >+      /* Wait until VPU receives the command */
> >> >>> > >+      timeout = jiffies + msecs_to_jiffies(IPI_TIMEOUT_MS);
> >> >>> > >+      do {
> >> >>> > >+              if (time_after(jiffies, timeout)) {
> >> >>> > >+                      dev_err(vpu->dev, "vpu_ipi_send: IPI timeout!\n");
> >> >>> > >+                      return -EIO;
> >> >>> > >+              }
> >> >>> > >+      } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
> >> >> >
> >> >> >Do we need to busy wait every time we communicate with the co-processor?
> >> >> >Couldn't we put this wait*before*  we write to HOST_TO_VPU above.
> >> >> >
> >> >> >That way we only spin when there is a need to.
> >> >> >
> >> > Since the hardware VPU only allows that one client sends the command to
> >> > it each time.
> >> > We need the wait to make sure VPU accepted the command and cleared the
> >> > interrupt and then the next command would be served.
> >>
> >> I understand that the VPU  can only have on message outstanding at once.
> >>
> >> I just wonder why we busy wait *after* sending the first command rather
> >> than *before* sending the second one.
> >
> > No other special reasons. Just send one command and wait until VPU gets
> > the command. Then, I think this wait also can be put before we write to
> > HOST_TO_VPU.Is this better than former? May I know the reason?
> 
> Busy waiting is bad; it is a waste of host CPU processor time and/or power.
> 
> When the busy wait occurs after queuing then we will busy wait for
> every command we send.
> 
> If busy wait occurs before next queuing then we will wait for a
> shorter time in total because we have the chance to do something
> useful on the host before we have to wait.
> 

Got it. Thanks a lot for the explanation.
I'll put the busy wait before next queuing in next version. 

> 
> >> Streamed decode/encode typically ends up being rate controlled by
> >> capture or display meaning that in these cases we don't need to busy
> >> wait at all (because by the time we send the next frame the VPU has
> >> already accepted the previous message).
> >
> > For now, only one device "encoder" exists, it is true.
> > But, we'll have encoder and decoder devices, the decode and encode
> > requested to VPU are simultaneous.
> 
> Sure, I accept that lock and busy-wait is an appropriate way to ensure
> safety (assuming the VPU is fairly quick clearing the HOST_TO_VPU
> flag).
> 

The busy wait time is less than 1ms in average.

> 
> > Is this supposed to be removed for this patches and we can add it back
> > if the another device(decoder) is ready for review?
> 
> No I'm not suggesting that.
> 
> I only recommend moving the busy wait *before* end sending of command
> (for efficiency reasons mentioned above).

Ok. Thanks.

> 
> 
> Daniel.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
