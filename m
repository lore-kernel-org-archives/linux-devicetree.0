From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 2/2] ARM64: dts: hi6220-hikey: Add clock binding for
 the pmic mfd
Date: Mon, 24 Apr 2017 14:01:25 +0100
Message-ID: <20170424130125.bzpljoomnfyemqpz@dell>
References: <1492449567-31399-1-git-send-email-daniel.lezcano@linaro.org>
 <1492449567-31399-2-git-send-email-daniel.lezcano@linaro.org>
 <20170422020233.GA7065@codeaurora.org>
 <370c36f9-e6fc-416c-776b-edc1e42d7ddc@linaro.org>
 <20170424085944.aa5dsc4g6bwm5rgi@dell>
 <20170424091609.GA2137@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170424091609.GA2137@mai>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Apr 2017, Daniel Lezcano wrote:

> On Mon, Apr 24, 2017 at 09:59:44AM +0100, Lee Jones wrote:
> > On Sat, 22 Apr 2017, Daniel Lezcano wrote:
> > 
> > > On 22/04/2017 04:02, Stephen Boyd wrote:
> > > > On 04/17, Daniel Lezcano wrote:
> > > >> Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > >> ---
> > > >>  Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt | 6 ++++++
> > > >>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts             | 1 +
> > > >>  2 files changed, 7 insertions(+)
> > > >>
> > > > 
> > > > I take it this goes through arm-soc? Not sure why I'm on To:
> > > > line.
> > > 
> > > Probably it should go through Lee's tree.
> > 
> > Unlikely.
> > 
> > The document and the DTS change should really have gone separately,
> > but to save you from having to mess around so close to the merge window:
> > 
> > Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Thanks Lee.
> 
> Usually, I take the DT changes (including doc) with the timers changes with the
> maintainer and Rob's blessing. So the DT and the driver changes are aligned in
> my tree and make the submission changes easier.

The binding docs go with the bindings, not the DTS changes.

> I agree mixing the patches for different destinations into a single patchset is
> fuzzy, I will take care next time to separate the patches.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
