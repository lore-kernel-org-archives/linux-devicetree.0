From: "Ram Chandra Jangir" <rjangir@codeaurora.org>
Subject: RE: [PATCH 2/2] pinctrl: qcom: ipq4019: add remaining pin definitions
Date: Wed, 24 May 2017 18:34:10 +0530
Message-ID: <001b01d2d48e$3f366660$bda33320$@codeaurora.org>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com> <1975629.nrP45RYYW5@debian64> <20170520050824.GS12920@tuxbook> <2018547.lycQhaDrJg@debian64> <20170523192857.GW12920@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170523192857.GW12920@tuxbook>
Content-Language: en-us
Sender: linux-gpio-owner@vger.kernel.org
To: 'Bjorn Andersson' <bjorn.andersson@linaro.org>, 'Christian Lamparter' <chunkeey@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 'Linus Walleij' <linus.walleij@linaro.org>, 'Rob Herring' <robh+dt@kernel.org>, 'Mark Rutland' <mark.rutland@arm.com>, 'John Crispin' <john@phrozen.org>
List-Id: devicetree@vger.kernel.org



On Wednesday, May 24, 2017 12:59 AM CEST Bjorn Andersson wrote:
>On Tue 23 May 09:58 PDT 2017, Christian Lamparter wrote:
> On Friday, May 19, 2017 10:08:24 PM CEST Bjorn Andersson wrote:
> > On Thu 18 May 11:38 PDT 2017, Christian Lamparter wrote:
> > > On Wednesday, May 17, 2017 1:07:29 PM CEST Bjorn Andersson wrote:
> > > > On Wed 10 May 04:27 PDT 2017, Christian Lamparter wrote:
> > > > > diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c 
> > > > > b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> > > > > index 743d1f458205..7219d1e33c71 100644
> > > > > --- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> > > > > +++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> > > > > +	qca_mux_rmii0_refclk,
> > > > > +	qca_mux_wifi0_rfsilient0,
> > > > > +	qca_mux_wifi1_rfsilient0,
> > > > > +	qca_mux_smart2,
> > > > > +	qca_mux_led4,
> > > > 
> > > > What drives ledX? Is it 11 different LED controllers or is it a 
> > > > single LED controller with 11 outputs.
> > > 
> > > The latter. The IPQ40xx have one LED controller @ 0x1937000. 
> > > According to the driver (leds-ipq40xx.c in the SDK), it does 
> > > control up to 11 LEDs. A LED can either be muxed to one of the 
> > > hardware sources (wifi, lan or wan-ports activity/linkspeed), or 
> > > it can be operated by one of four software-programmable "blink"
> > > sources (each with a variable blink rate and duty cycle). 
> > > The driver labels each LED as "ipq40xx::led%d".
> > > 
> > 
> > As they all stem from the same hardware block I suggest we name the 
> > function "led".
> 
> This is going to be a problem for Pin 36:
> 
> PINGROUP(36, rmii0, *led2*, *led0*, NA, ...)
> 
> I checked the other pins too, but this seems to be the only time two 
> LED-lines share the same pin. What's the recommended/prefered option 
> in this case? Something like led_alt, or should I keep the led0-led11?
> 
> There are a few more collisions with other functions as well:
> smartX, i2s_*, wifi1_uart*:
> 

>Looks like we're stuck with individually named functions for these then...

> PINGROUP(58, qpic, led2, blsp_i2c0, *smart3*, *smart1*,
>          i2s_rx_mclk, NA, wcss0_dbg, tm4, wifi0, wifi1, NA, NA, NA),
> 
> PINGROUP(60, qpic, blsp_uart0, smart1, smart3, led0,
>          *i2s_tx_bclk*, *i2s_rx_bclk*, atest_char, NA, wcss0_dbg,
>          qdss_traceclk_a, NA, tm6, NA),
> 
> PINGROUP(61, qpic, blsp_uart0, *smart1*, *smart3*, led1, *i2s_tx_fsync*,
>          *i2s_rx_fsync*, NA, NA, wcss0_dbg, qdss_cti_trig_out_a0,
>          NA, tm7, NA),
> 
> PINGROUP(63, qpic, wifi0_uart1, *wifi1_uart1*, *wifi1_uart*, *i2s_td1*,
>          *i2s_rxd*, *i2s_spdif_out*, *i2s_spdif_in*, NA, wcss0_dbg,
>          wcss1_dbg, NA, tm, NA),
> ...

>This makes me wonder what wifi1_uart (and uart1) actually is...

>The wifi\d_uart seems to have 5 pins in its group and wifi\d_uart\d seems
to be two sets of two pins. So perhaps this is some alternative routing and
wifi0_uart0 and wifi0_uart1 is actually the same function?

>@Ram, can you help us out here?

wifi0_uart0 and wifi0_uart1 are different functions,  and they are mapped as
below:
wifi0_uart    -->  wifi0   uart   RTS
wifi0_uart0  -->  wifi0  uart   RxD
wifi0_uart1  -->  wifi0  uart   CTS

wifi1_uart    -->  wifi1   uart   TxD
wifi1_uart0  -->  wifi1   uart   RxD  
wifi1_uart1  -->  wifi1   uart   CTS

Thanks,
Ram

> > > > > +	qca_mux_qpic_pad4,
> > > > 
> > > > Please keep an eye on the ipq8074 patch from Varadarajan and 
> > > > make this follow the same scheme.
> > > Ok, I'll wait for how qca8074 plays out then.
> 
> <https://www.spinics.net/lists/arm-kernel/msg582958.html>:
> | On Sat, May 20, 2017 at 7:54 AM, Bjorn Andersson wrote:
> | [...]
> | > If you consider that you are defining the available functions for 
> | > this pinmuxer and then define the sets of pins exposing these 
> | > available functions it does make sense to just name it "qpic".
> | >
> | > I think that naming them _common, _lcd and _nand is just adding 
> | > confusion when it comes to writing the dts files.
> | >
> | > @Linus, do you have a different preference here?
> |
> |No I pretty much trust the driver maintainer to know this best.
> |
> |Yours,
> |Linus Walleij
> 
> Thanks for the answer, I'll go with "qpic" then.
> I'll also combine the various sdio_* to sdio and look at the other 
> candidates (rgmii*, rmii0/1*, pmuX, pcie_clk*, jtag*, tmX, 
> audio_pwmX). Unless someone comes up with a good reason not to.
> 

>Sounds good!

>Regards,
>Bjorn

