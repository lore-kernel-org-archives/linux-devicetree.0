From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 1/4] mfd: devicetree: bindings: Add Qualcomm RPM
 regulator subnodes
Date: Tue, 3 Mar 2015 13:54:25 -0800
Message-ID: <20150303215424.GH26334@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-2-git-send-email-bjorn.andersson@sonymobile.com>
 <54F60339.6000803@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54F60339.6000803@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 03 Mar 10:53 PST 2015, Stephen Boyd wrote:

> On 03/02/15 20:25, Bjorn Andersson wrote:
[..]
> > +
> > +- vin_l1_l2_l12_l18-supply:
> > +- vin_l24-supply:
> > +- vin_l25-supply:
> > +- vin_l27-supply:
> > +- vin_l28-supply:
> > +- vin_lvs_1_3_6-supply:
> > +- vin_lvs2-supply:
> > +- vin_lvs_4_5_7-supply:
> > +- vin_ncp-supply:
> 
> Can you also include vin_s1,vin_s2, etc. for the rest of the supplies I
> left out? It looks like you've covered all the inputs for the other pmics.
> 

Sorry, I had problems finding the information in the rather sparse
documentation I have for the 8921, so I just assumed that I could steal
your list.

I finally managed to find the pinout diagram, so the correct list for
pm8921 seems to be:

- vdd_l1_2_12_18-supply
- vdd_l3_15_17-supply
- vdd_l5_8_16-supply
- vdd_l6_7-supply
- vdd_l9_11-supply
- vdd_l10_22-supply
- vdd_l21_23_29-supply
- vdd_l24-supply
- vdd_l25-supply
- vdd_l26-supply
- vdd_l27-supply
- vdd_l28-supply
- vdd_ncp-supply
- vdd_s1-supply
- vdd_s2-supply
- vdd_s4-supply
- vdd_s5-supply
- vdd_s6-supply
- vdd_s7-supply
- vdd_s8-supply
- vin_lvs1_3_6-supply
- vin_lvs2-supply
- vin_lvs4_5_7-supply

I will send out an updated patch with these.

Regards,
Bjorn
