From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: ipq4019: add remaining pin definitions
Date: Thu, 18 May 2017 20:38:15 +0200
Message-ID: <1975629.nrP45RYYW5@debian64>
References: <d53b7a9b1bab818536680123136ac58481d959c8.1494415174.git.chunkeey@googlemail.com> <3dac044cd9a879cad145f9a04dcc3d225721aa3c.1494415174.git.chunkeey@googlemail.com> <20170517200729.GH12920@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170517200729.GH12920@tuxbook>
Sender: linux-gpio-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Ram Chandra Jangir <rjangir@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, May 17, 2017 1:07:29 PM CEST Bjorn Andersson wrote:
> On Wed 10 May 04:27 PDT 2017, Christian Lamparter wrote:
> > diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> > index 743d1f458205..7219d1e33c71 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
> > +	qca_mux_rmii0_refclk,
> > +	qca_mux_wifi0_rfsilient0,
> > +	qca_mux_wifi1_rfsilient0,
> > +	qca_mux_smart2,
> > +	qca_mux_led4,
> 
> What drives ledX? Is it 11 different LED controllers or is it a single
> LED controller with 11 outputs.

The latter. The IPQ40xx have one LED controller @ 0x1937000. 
According to the driver (leds-ipq40xx.c in the SDK), it 
does control up to 11 LEDs. A LED can either be muxed to
one of the hardware sources (wifi, lan or wan-ports activity/linkspeed),
or it can be operated by one of four software-programmable "blink"
sources (each with a variable blink rate and duty cycle). 
The driver labels each LED as "ipq40xx::led%d".

That said: ASUS, Cisco, Compex, Netgear, Zyxel... opted to either
1. export the individual GPIOs with sysfs
2. gpio-leds

> [..]
> > +	qca_mux_wifi01,
> 
> Please make these "wifi0" and include all "wifi0XY", rather than having
> a group per pin.
> 
> > +	qca_mux_wifi11,
> 
> "wifi1"

Ok. Can I leave wifi1_cal, _wci, uartX... the way they are?
 
> > +	qca_mux_atest_char3,
> > +	qca_mux_pmu0,
> > +	qca_mux_boot8,
> > +	qca_mux_tm1,
> > +	qca_mux_atest_char2,
> > +	qca_mux_pmu1,
> > +	qca_mux_boot9,
> > +	qca_mux_tm2,
> > +	qca_mux_atest_char1,
> > +	qca_mux_tm_ack,
> > +	qca_mux_wifi03,
> > +	qca_mux_wifi13,
> > +	qca_mux_qpic_pad4,
> 
> Please keep an eye on the ipq8074 patch from Varadarajan and make this
> follow the same scheme.
Ok, I'll wait for how qca8074 plays out then.
By the way, can you ask if the QCA8074 follows the IPQ40XX SoC's
GPIO Pull-up config?

I'm asking because Varadarajan was also involved in the
pinctrl-ipq4019 back in 2015: <https://patchwork.kernel.org/patch/7662241/>

Back then, this wasn't mentioned anywhere. In fact, the special pull-up
configuration was only discovered due to an issue with the NAND on the
Cisco Meraki MR33. So I think it is better ask them now, when the devs
are actually present/responding. 

> > +	qca_mux_atest_char0,
> > +	qca_mux_tm3,
> > +	qca_mux_wifi02,
> > +	qca_mux_wifi12,
> > +	qca_mux_qpic_pad5,
> > +	qca_mux_smart3,
> > +	qca_mux_wcss0_dbg14,
> 
> Please squash these into "wcss0_dbg"
Ok.

> > +	qca_mux_tm4,
> > +	qca_mux_wifi04,
> > +	qca_mux_wifi14,
> > +	qca_mux_qpic_pad6,
> > +	qca_mux_wcss0_dbg15,
> > +	qca_mux_qdss_tracectl_a,
> > +	qca_mux_boot18,
> 
> Do you know what the "boot" function is and what 2, 4, 5, 7, 8, 9 11,
> 14, 18, 19 and 20 means?
Sadly no. That said, neither the u-boot nor the linux kernel
sources set any pin to bootX. I think I'll remove it for now.

> [..]
> > +	qca_mux_sdio0,
> 
> There are 8 of these, so that's more likely the 8 data pins in a single
> function. Please squash them into "sdio_data".
Yes, this is very likely. We know that this is the case for the qpic_padX.

Regards,
Christian
