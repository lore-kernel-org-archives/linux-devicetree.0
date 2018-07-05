From: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 1/5] clocksource/drivers/timer-mediatek: Add system
 timer bindings
Date: Fri, 6 Jul 2018 06:52:50 +0800
Message-ID: <1530831170.17448.82.camel@mtkswgap22>
References: <1530752972-833-1-git-send-email-stanley.chu@mediatek.com>
 <1530752972-833-2-git-send-email-stanley.chu@mediatek.com>
 <20180705211552.GA3699@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180705211552.GA3699@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2018-07-05 at 15:15 -0600, Rob Herring wrote:
> On Thu, Jul 05, 2018 at 09:09:28AM +0800, Stanley Chu wrote:

Hi Rob,

> > +- reg: Should contain location and length for timer register.
> > +- clocks: Both timers are driven by system clock.
> 
> The binding just needs to say how many clocks, what they are and the 
> order.
> 
> You need to explain in the commit message why you remove the RTC clock.

OK! Will fix binding description and commit message in v8.

RTC clock is not used in both "GPT" and "SYST" driver now so we just
remove it.

> 
> >  
> >  Examples:
> >  
> > @@ -21,5 +27,5 @@ Examples:
> >  		compatible = "mediatek,mt6577-timer";
> >  		reg = <0x10008000 0x80>;
> >  		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>;
> > -		clocks = <&system_clk>, <&rtc_clk>;
> > -	};
> > +		clocks = <&system_clk>;
> > +	};
> > \ No newline at end of file
> 
> Fix this.

Will fix it in v8.

Thanks.
Stanley Chu

> 
> > -- 
> > 1.7.9.5
> > 
