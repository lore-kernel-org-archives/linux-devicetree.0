From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/9] dmaengine: st_fdma: Add STMicroelectronics FDMA
 DT binding documentation
Date: Tue, 29 Sep 2015 13:11:55 +0100
Message-ID: <20150929121155.GA17986@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <20150914081937.GF27591@x1>
 <20150929100440.GC16955@griffinp-ThinkPad-X1-Carbon-2nd>
 <35211759.Jca4RWVLIS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <35211759.Jca4RWVLIS@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Tue, 29 Sep 2015, Arnd Bergmann wrote:

> On Tuesday 29 September 2015 11:04:40 Peter Griffin wrote:
> > 
> > "The hardware is identical, and different firmware is used to apply
> >    it in different ways."
> > 
> > Which is the case with fdma. By encoding the "way you wish to apply it" into the
> > compatible string, it causes problems if you want to change for example fdma0
> > to do some other function other than audio.
> > 
> > You then require a DT update, (when the hardware hasn't changed, just the
> > firmware) which is the same problem as using the filename directly in DT.
> > 
> > Therefore I believe it is important that the DT binding does *not* encode the
> > way the hardware is to be applied into the binding in *any* way, and defers this
> >  decision to the driver.
> > That is the rationale / reasoning behind choosing the fdma instance number.
> > 
> > Assuming you agree with my arguments above, then the choice becomes between 
> > having a fdma instance DT property, or having lots of compatibles where the only
> > difference is the appending of the instance number. I think out of the two I prefer
> > my original approach.
> > 
> > Any thoughts from the DT folks?
> 
> To me both approaches sound wrong: basing the firmware name on the instance
> number requires that each instance is always used in the same way, which
> is not guaranteed to be the case,

Does it? I didn't think it did.

Using the instance number as a DT property defers the decision over what firmware to
load to the driver, which can choose whatever firmware name it wishes.

e.g. in v4.3 it could load xyz.elf, in v4.4 it could choose abc.elf. The DT will remain
unchanged, but the use of that fdma instance has changed.

We currently only have one firmware for each instance with the "use" compiled into it.
If in the future we had two firmwares with different "uses" for the same instance some extra
logic would be required in the driver to make a decision on which firmware to load.

> and you correctly describe the problem with
> using the compatible string for the firmware name if the driver for the FDMA
> does not actually care what firmware is being used here.
> 
> Whatever code makes the decision as to how the FDMA is used should also
> decide on the name of the firmware file.

The code which makes this decision currently is the st_fdma.c driver. However it does
need to know which fdma controller it is operating on to make this decision correctly.

Apart from passing the fdma instance number in DT, how else can we determine which
controller we are?

I guess we could infer it by having a table in the driver containing the base addresses
of the controllers for a given SoC, and match that against what DT passes us in the
reg property. But that seems ugly, and is encoding the same information in two
different places.

I'm open to suggestions if there is a better way to do this.

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
