From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq4019: add remaining pin definitions
Date: Fri, 14 Jul 2017 15:18:56 +0200
Message-ID: <6378379.o12yG5fNYn@debian64>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com> <001b01d2d48e$3f366660$bda33320$@codeaurora.org> <20170706060243.GP18666@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170706060243.GP18666@tuxbook>
Sender: linux-gpio-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ram Chandra Jangir <rjangir@codeaurora.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 'Linus Walleij' <linus.walleij@linaro.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>, 'John Crispin' <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, July 5, 2017 11:02:43 PM CEST Bjorn Andersson wrote:
> On Wed 24 May 06:04 PDT 2017, Ram Chandra Jangir wrote:
> > On Wednesday, May 24, 2017 12:59 AM CEST Bjorn Andersson wrote:
> [..]
> > >This makes me wonder what wifi1_uart (and uart1) actually is...
> > 
> > >The wifi\d_uart seems to have 5 pins in its group and wifi\d_uart\d seems
> > to be two sets of two pins. So perhaps this is some alternative routing and
> > wifi0_uart0 and wifi0_uart1 is actually the same function?
> > 
> > >@Ram, can you help us out here?
> > 
> 
> Ram, thanks for your answer. Unfortunately I missed this mail until
> Christian posted the new version of the patch.
> 
> Unfortunately I don't understand the functions provided here, so I hope
> you can help me better understand what's going on.
> 
> > wifi0_uart0 and wifi0_uart1 are different functions,  and they are mapped as
> > below:
> > wifi0_uart    -->  wifi0   uart   RTS
> > wifi0_uart0  -->  wifi0  uart   RxD
> > wifi0_uart1  -->  wifi0  uart   CTS
> 
> Christian has the following groups of pins for each function:
> 
> wifi0_uart: pin 8, 9, 11, 19 and 62
> wifi0_uart0: pin 9 and 10
> wifi0_uart1: pin 18 and 63
> 
> It's common to see alternative muxing of functions, so I'm guessing that
> wifi0_uart1 is one of these. Is this correct?
> 
> But why is there 5 pins for RTS?
> 
> Why is receive (wifi0_uart0) two adjacent pins? Are they perhaps Rx and
> Tx?
> 
> Why do we have a CTS line if we only have RxD, no TxD?
> 
> > 
> > wifi1_uart    -->  wifi1   uart   TxD
> > wifi1_uart0  -->  wifi1   uart   RxD  
> > wifi1_uart1  -->  wifi1   uart   CTS
> > 
> 
> Why is there no RTS for this when it seems bidirectional?

no response in over a week. :-/

I removed the wifi*_uart* definitions in V3. I think we can life without 
them. If QCA ever releases the firmware code to the public, they would 
be of some use but until them, we can do without.

Regards,
Christian
