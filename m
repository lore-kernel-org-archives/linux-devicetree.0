From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH -next v2] dmaengine: ste_dma40: fix error return code
 in d40_probe()
Date: Wed, 12 Jun 2013 15:24:43 +0530
Message-ID: <20130612095443.GU4107@intel.com>
References: <CAPgLHd-gjJ6ju3HyhiQi98YFGojvU3aYSTn7SOe4NhQPY1r++w@mail.gmail.com>
 <CACRpkdYBfvr0kA7bd-6Ns78UH7JtBCFDzFxyHLgtReB32O4D+w@mail.gmail.com>
 <20130530173326.GD3767@intel.com>
 <CACRpkdZhK6TUAC132vzcaLKqdMTwPma+ZhKG5Y+AUvekNpz6EQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZhK6TUAC132vzcaLKqdMTwPma+ZhKG5Y+AUvekNpz6EQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, Srinidhi KASAGAR <srinidhi.kasagar@stericsson.com>, Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 04, 2013 at 11:14:16AM +0200, Linus Walleij wrote:
> On Thu, May 30, 2013 at 7:33 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> > On Thu, May 30, 2013 at 09:41:38AM +0200, Linus Walleij wrote:
> >> On Thu, May 30, 2013 at 6:32 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> >>
> >> > From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >> >
> >> > In many of the error handling case, the return value 'ret' not set
> >> > and 0 will be return from d40_probe() even if error, but we should
> >> > return a negative error code instead in those error handling case.
> >> > This patch fixed them, and also removed useless variable 'err'.
> >> >
> >> > Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> >> > ---
> >> > v1 -> v2: rebased on linux-next.git
> >>
> >> I've tentatively applied this to my dma40 branch, waiting for Vinod
> >> to ACK it.
> > I though you wanted me to apply this :)
> >
> > Nevertheless, Acked-by: Vinod Koul <vinod.koul@intel.com>
> >
> > Can you CC stable too, pls.
> 
> Hm I'm not sending any DMA40 stuff for stable, sorry ...
> if you want it to go into stable you'd better pick this
> (the v3 version) into the DMA tree.
okay
> 
> Let me know how you want it, I've removed it from my
> dma40 branch for the time being.
Have you removed, Also I see a v3 of this, do you want to ack that before I
apply

--
~Vinod
