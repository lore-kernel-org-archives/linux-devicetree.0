From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/6] usb: dwc3: dwc3-st: Update the incorrect DT dwc3
 example.
Date: Fri, 8 May 2015 11:31:40 +0100
Message-ID: <20150508103140.GA15502@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1430400652-3366-1-git-send-email-peter.griffin@linaro.org>
 <1430400652-3366-4-git-send-email-peter.griffin@linaro.org>
 <20150507151358.GA14123@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150507161555.GA29183@saruman.tx.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150507161555.GA29183-HgARHv6XitJaoMGHk7MhZQC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Thu, 07 May 2015, Felipe Balbi wrote:

> On Thu, May 07, 2015 at 04:13:58PM +0100, Peter Griffin wrote:
> > Hi Felipe,
> > 
> > On Thu, 30 Apr 2015, Peter Griffin wrote:
> > 
> > > There is a subtle typo phys-names should be phy-names. Using the
> > > current example means you don't have working usb (as you fail to
> > > obtain the phys). Also update the example to use the generic phy
> > > type constants which are now used for miphy28.
> > > 
> > > Additionally also remove the unnecessary new line in the example.
> > > 
> > > Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > > Acked-by: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
> > 
> > Can you take this dwc3 DT doc update patch via your tree?
> 
> only this patch ?

Yes, I think the test will go via Maximes STI tree

> Sure. Just post on linux-usb and I'll fetch it from
> there.

Brilliant, thanks. I've sent it see here https://lkml.org/lkml/2015/5/7/809
with linux-usb on CC (sorry for missing that off the first time round)

regards,

Peter.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
