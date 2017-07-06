From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq4019: add remaining pin definitions
Date: Wed, 5 Jul 2017 23:02:43 -0700
Message-ID: <20170706060243.GP18666@tuxbook>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com>
 <1975629.nrP45RYYW5@debian64>
 <20170520050824.GS12920@tuxbook>
 <2018547.lycQhaDrJg@debian64>
 <20170523192857.GW12920@tuxbook>
 <001b01d2d48e$3f366660$bda33320$@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <001b01d2d48e$3f366660$bda33320$@codeaurora.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ram Chandra Jangir <rjangir-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: 'Christian Lamparter' <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Linus Walleij' <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'John Crispin' <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed 24 May 06:04 PDT 2017, Ram Chandra Jangir wrote:

> 
> 
> On Wednesday, May 24, 2017 12:59 AM CEST Bjorn Andersson wrote:
[..]
> >This makes me wonder what wifi1_uart (and uart1) actually is...
> 
> >The wifi\d_uart seems to have 5 pins in its group and wifi\d_uart\d seems
> to be two sets of two pins. So perhaps this is some alternative routing and
> wifi0_uart0 and wifi0_uart1 is actually the same function?
> 
> >@Ram, can you help us out here?
> 

Ram, thanks for your answer. Unfortunately I missed this mail until
Christian posted the new version of the patch.

Unfortunately I don't understand the functions provided here, so I hope
you can help me better understand what's going on.

> wifi0_uart0 and wifi0_uart1 are different functions,  and they are mapped as
> below:
> wifi0_uart    -->  wifi0   uart   RTS
> wifi0_uart0  -->  wifi0  uart   RxD
> wifi0_uart1  -->  wifi0  uart   CTS

Christian has the following groups of pins for each function:

wifi0_uart: pin 8, 9, 11, 19 and 62
wifi0_uart0: pin 9 and 10
wifi0_uart1: pin 18 and 63

It's common to see alternative muxing of functions, so I'm guessing that
wifi0_uart1 is one of these. Is this correct?

But why is there 5 pins for RTS?

Why is receive (wifi0_uart0) two adjacent pins? Are they perhaps Rx and
Tx?

Why do we have a CTS line if we only have RxD, no TxD?

> 
> wifi1_uart    -->  wifi1   uart   TxD
> wifi1_uart0  -->  wifi1   uart   RxD  
> wifi1_uart1  -->  wifi1   uart   CTS
> 

Why is there no RTS for this when it seems bidirectional?

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
