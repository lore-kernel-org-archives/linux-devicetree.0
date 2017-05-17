From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/5] pinctrl: qcom: Add ipq8074 pinctrl driver
Date: Wed, 17 May 2017 12:33:15 -0700
Message-ID: <20170517193315.GF12920@tuxbook>
References: <1493898841-20583-1-git-send-email-varada@codeaurora.org>
 <1493898841-20583-2-git-send-email-varada@codeaurora.org>
 <20170510224355.GE45273@Bjorns-MacBook-Pro-2.local>
 <1f4c9974-f6a4-bee7-4f37-ad8795e442a3@codeaurora.org>
 <20170514042307.GE69278@Bjorns-MacBook-Pro-2.local>
 <7afc7191-bcb1-a566-eac5-a4fe1293c773@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7afc7191-bcb1-a566-eac5-a4fe1293c773@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linus.walleij@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, absahu@codeaurora.org, sjaganat@codeaurora.org, sricharan@codeaurora.org, Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Mon 15 May 02:05 PDT 2017, Varadarajan Narayanan wrote:

> On 5/14/2017 9:53 AM, Bjorn Andersson wrote:
> > On Thu 11 May 03:33 PDT 2017, Varadarajan Narayanan wrote:
> > 
> > > On 5/11/2017 4:13 AM, Bjorn Andersson wrote:
> > > > On Thu 04 May 04:53 PDT 2017, Varadarajan Narayanan wrote:
[..]
> > > > > +	msm_mux_qpic_pad4,
> > > > 
> > > > What are qpic_pad and qpic_pad0 through qpic_pad8? Different functions,
> > > > alternative muxings...?
> > > 
> > > This is for the NAND and LCD display. The pins listed are the 9 data pins.
> > > 
> > 
> > Then you can describe them all as "qpic_pad" (or simply "qpic"?). (It's
> > possible to reference a partial group in the DTS, if that's necessary)
> 
> There are two sets of 9 pins, either of which can go to NAND or LCD.
> Will rename qpic_pad as qpic_a and qpic_pad[0-8] as qpic_b.
> Is that ok?
> 

So you have NAND and LCD hardware muxed to either "a" or "b" and then
you mux either "a" or "b" out onto actual pins?

How is this first mux configured?


I think the a/b scheme sounds reasonable, if above is how it works.

Regards,
Bjorn
