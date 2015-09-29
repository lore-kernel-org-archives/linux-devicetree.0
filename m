From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/9] dmaengine: st_fdma: Add STMicroelectronics FDMA DT binding documentation
Date: Tue, 29 Sep 2015 13:17:20 +0200
Message-ID: <35211759.Jca4RWVLIS@wuerfel>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org> <20150914081937.GF27591@x1> <20150929100440.GC16955@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150929100440.GC16955@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 29 September 2015 11:04:40 Peter Griffin wrote:
> 
> "The hardware is identical, and different firmware is used to apply
>    it in different ways."
> 
> Which is the case with fdma. By encoding the "way you wish to apply it" into the
> compatible string, it causes problems if you want to change for example fdma0
> to do some other function other than audio.
> 
> You then require a DT update, (when the hardware hasn't changed, just the
> firmware) which is the same problem as using the filename directly in DT.
> 
> Therefore I believe it is important that the DT binding does *not* encode the
> way the hardware is to be applied into the binding in *any* way, and defers this
>  decision to the driver.
> That is the rationale / reasoning behind choosing the fdma instance number.
> 
> Assuming you agree with my arguments above, then the choice becomes between 
> having a fdma instance DT property, or having lots of compatibles where the only
> difference is the appending of the instance number. I think out of the two I prefer
> my original approach.
> 
> Any thoughts from the DT folks?

To me both approaches sound wrong: basing the firmware name on the instance
number requires that each instance is always used in the same way, which
is not guaranteed to be the case, and you correctly describe the problem with
using the compatible string for the firmware name if the driver for the FDMA
does not actually care what firmware is being used here.

Whatever code makes the decision as to how the FDMA is used should also
decide on the name of the firmware file. You can have a mapping in the
driver that contains the file names that are used by ST's distro, possibly
with a fallback mechanism that tries more meaningful names first.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
