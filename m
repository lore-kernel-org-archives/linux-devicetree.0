From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4] dmaengine: sirf: enable generic dt binding for dma channels
Date: Tue, 18 Mar 2014 13:20:01 +0100
Message-ID: <201403181320.01858.arnd@arndb.de>
References: <1389190369-2012-1-git-send-email-21cnbao@gmail.com> <CAGsJ_4zMYGTS4CyCsTAH_5PMK3v4Pr+e88YjXL=d3A=EjPf9rQ@mail.gmail.com> <20140317045105.GB1976@intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140317045105.GB1976-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, DL-SHA-WorkGroupLinux <workgroup.linux-kQvG35nSl+M@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 17 March 2014, Vinod Koul wrote:
> On Sat, Mar 01, 2014 at 10:49:18AM +0800, Barry Song wrote:
> > 2014-01-20 17:35 GMT+08:00 Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > > 2014/1/20 Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>:
> > >> On Wed, Jan 08, 2014 at 10:12:49PM +0800, Barry Song wrote:
> > >>> From: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
> > >>>
> > >>> move to support of_dma_request_slave_channel() and dma_request_slave_channel.
> > >>> we add a xlate() to let dma clients be able to find right dma_chan by generic
> > >>> "dmas" properties in dts.
> > >>>
> > >>> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > >>> Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
> > >>> Signed-off-by: Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
> > >> Look okay, need an ACk from DT maintainers before I can apply...
> > 
> > Hi Vinod,
> > v5 is sent to devicetree list and there is no object.
> > http://www.spinics.net/lists/devicetree/msg19677.html
> > this patch is using general dt-binding for dma completely same with
> > other dma drivers, there is no special binding here.
> > so i think there is no reason to wait for merging since now updates
> > for its clients e.g. SPI, UART have been in 3.14-rc.
> I still need the ack for DT folks... Seems still missing :(

I thought I'd looked at it before.  The wording of the binding document
could be clarified a little, but the binding itself is absolutely
reasonable and the implementation looks correct. I would suggest you
merge it as is.

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
