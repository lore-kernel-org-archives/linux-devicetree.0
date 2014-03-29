From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] dmaengine: sirf: enable generic dt binding for dma
 channels
Date: Sat, 29 Mar 2014 19:21:08 +0530
Message-ID: <20140329135108.GR1976@intel.com>
References: <1389190369-2012-1-git-send-email-21cnbao@gmail.com>
 <20140319144359.GI1976@intel.com>
 <CAGsJ_4yVXN2pT-QCjWLx7bCM7rau=UAnkCY8k9QqEPOkMAcrXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGsJ_4yVXN2pT-QCjWLx7bCM7rau=UAnkCY8k9QqEPOkMAcrXA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 27, 2014 at 04:03:31PM +0800, Barry Song wrote:
> 2014-03-19 22:43 GMT+08:00 Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>:
> > On Sun, Jan 26, 2014 at 10:08:45AM +0800, Barry Song wrote:
> >> From: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
> >>
> >> move to support of_dma_request_slave_channel() and dma_request_slave_channel.
> >> we add a xlate() to let dma clients be able to find right dma_chan by generic
> >> "dmas" properties in dts.
> >>
> >> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> >> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> >> Signed-off-by: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
> >
> > I tried applying this but it failed to apply.
> >
> > Can you pls rebase quickly and resend. While at it pls add the Acks recived!
> 
> Hi Vinod,
> attached see the rebased version for master.
Applied, thanks

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
