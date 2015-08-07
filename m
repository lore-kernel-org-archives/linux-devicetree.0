From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 7/9] clk: mediatek: Add subsystem clocks of MT8173
Date: Fri, 7 Aug 2015 16:06:51 +0800
Message-ID: <CAGS+omAizzehDjUx+r0JZRNo75W56zKiDq8kz6PUT9f2fdE7=w@mail.gmail.com>
References: <1438676218-11310-1-git-send-email-jamesjj.liao@mediatek.com>
 <1438676218-11310-8-git-send-email-jamesjj.liao@mediatek.com>
 <20150805064605.GZ18700@pengutronix.de> <1438849431.27884.9.camel@mtksdaap41>
 <20150806085354.GN18700@pengutronix.de> <1438851644.27884.21.camel@mtksdaap41>
 <CAGS+omAAYZyZJ4+eSdu2jmwThvHg1YpVoehui_cqNp4A5fURWg@mail.gmail.com>
 <20150806102059.GQ18700@pengutronix.de> <1438914018.29334.6.camel@mtksdaap41>
 <CAGS+omBDaP1b-zNJ7SaX89Mt5jhZEp_kDh7Pytsax0d=V++MEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAGS+omBDaP1b-zNJ7SaX89Mt5jhZEp_kDh7Pytsax0d=V++MEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 7, 2015 at 4:05 PM, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> On Fri, Aug 7, 2015 at 10:20 AM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Sascha,
>>
>> On Thu, 2015-08-06 at 12:20 +0200, Sascha Hauer wrote:
>>> On Thu, Aug 06, 2015 at 05:13:21PM +0800, Daniel Kurtz wrote:
>>> > On Thu, Aug 6, 2015 at 5:00 PM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>> > > Hi Sascha,
>>> > >
>>> > > On Thu, 2015-08-06 at 10:53 +0200, Sascha Hauer wrote:
>>> > >> On Thu, Aug 06, 2015 at 04:23:51PM +0800, James Liao wrote:
>>> > >> > On Wed, 2015-08-05 at 08:46 +0200, Sascha Hauer wrote:
>>> > >> > > On Tue, Aug 04, 2015 at 04:16:56PM +0800, James Liao wrote:
>>> > >> > > >  static const struct mtk_fixed_clk fixed_clks[] __initconst = {
>>> > >> > > >         FIXED_CLK(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk26m", 400 * MHZ),
>>> > >> > > >         FIXED_CLK(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk26m", 125 * MHZ),
>>> > >> > > > +       FIXED_CLK(CLK_TOP_DSI0_DIG, "dsi0_dig", "clk26m", 130 * MHZ),
>>> > >> > > > +       FIXED_CLK(CLK_TOP_DSI1_DIG, "dsi1_dig", "clk26m", 130 * MHZ),
>>> > >> > > > +       FIXED_CLK(CLK_TOP_LVDS_PXL, "lvds_pxl", "lvdspll", 148.5 * MHZ),
>>> > >> > > > +       FIXED_CLK(CLK_TOP_LVDS_CTS, "lvds_cts", "lvdspll", 51.975 * MHZ),
>>> > >> > >
>>> > >> > > I would expect 51975 * KHZ here to avoid fractional numbers. Probably
>>> > >> > > gcc calculates that during compile time so this will work as expected,
>>> > >> > > still I'm not sure this is good style to use fractional numbers here.
>>> > >> >
>>> > >> > As I know all constants will be calculated in compile time, so there
>>> > >> > should be no difference between 51.975 * MHZ and 51975 * KHz.
>>> > >> >
>>> > >> > > Anyway, on my system lvdspll is running at 150MHz. Are you sure there is
>>> > >> > > a clock derived from this running at 148.5MHz? Is it really correct to
>>> > >> > > use a fixed clock here or should it rather be lvdspll directly?
>>> > >> >
>>> > >> > Here is the clock hierarchy between lvdspll and lvds_pxl:
>>> > >> >
>>> > >> >             --------       AD_VPLL_DPIX_CK  --------   lvds_pxl  -----
>>> > >> >            |        |--------------------->|        |---------->|
>>> > >> >            |        |                      | cksys  |           |
>>> > >> > LVDSPLL -->| LVDSTX |                      | buffer |           | MMSYS
>>> > >> >            |        | AD_LVDSTX_CLKDIG_CTS | test   |  lvds_cts |
>>> > >> >            |        |--------------------->|        |---------->|
>>> > >> >             --------                        --------             -----
>>> > >> >
>>> > >> > Some clocks and blocks are not modeled into CCF. But we prefer to enable
>>> > >> > lvdspll before enabling lvds_pxl. So I modeled lvds_pxl (and lvds_cts)
>>> > >> > as a fixed-rate clock with a source from lvdspll.
>>> > >> >
>>> > >> > The frequency of these fixed-rate clocks (such as 148.5 MHz) are typical
>>> > >> > rate. In fact, we don't care about the actual rate of these clocks. We
>>> > >> > just care about the enable / disable sequence of them.
>>> > >>
>>> > >> Please either use the real rate or 0 (along with a explaining why). Using
>>> > >> a frequency with four to five significant digits makes me think that the
>>> > >> actual rate is very important.
>>> > >
>>> > > Oops, your suggestion is much different from Daniel's.
>>> > >
>>> > > Daniel, could you help to comment about how we model these clocks?
>>> >
>>> > First of all, for clocks where the rate doesn't matter, it doesn't
>>> > matters to what rate we set the clock.
>>> >
>>> > As for the color of our shed, "the designer says these are the typical
>>> > rates" sounds good enough to me for a "real rate", so I prefer using
>>> > the rates in James' patch.
>>> >
>>> > If not sure what Sascha's concern is, but if he insists on 0, I'm fine
>>> > with that too.
>>>
>>> I only find it confusing. I'd expect either the correct rate or an
>>> obviously dummy rate. Whatever we choose a comment explaining the
>>> background would really help here. Otherwise we won't know later
>>> whether this 148.5 MHz rate was introduced because a) The consumers
>>> depend on this rate being reported, b) It really is the correct rate or
>>> c) we don't care about the rate.
>>
>> So the proper setting should be:
>>
>> clk_name,          parent,    rate
>> -------------------------------------
>> "clkph_mck_o",     "clk26m",  0
>> "usb_syspll_125m", "clk26m",  125 * MHZ
>> "dsi0_dig",        "clk26m",  0
>> "dsi1_dig",        "clk26m",  0
>> "lvds_pxl",        "lvdspll", 0
>> "lvds_cts",        "lvdspll", 0
>>
>> usb_syspll_125m will keep in 125 MHz event in different products.Others
>> may be changed by DRAM or display settings.
>>
>> Daniel, do you think it's OK to model these clocks like above?
>
> Yes, I am fine with this.

Oh, but Sascha's main point is that, whatever we choose to do, please
document it to make it clear why we are setting these clocks to the
value we choose.

-Dan

>
>>
>>
>> Best regards,
>>
>> James
>>
>>
