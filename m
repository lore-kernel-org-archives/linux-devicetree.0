From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-mtp: pm8998 and pmi8998 regulators
Date: Thu, 6 Sep 2018 13:20:48 -0700
Message-ID: <CAD=FV=Whf=Y3xrrOO46gA5EwxssJFxt1dZ9B=5=np=fo8R3dSQ@mail.gmail.com>
References: <20180901221953.21666-1-bjorn.andersson@linaro.org>
 <CAD=FV=VE5gYyivgy=OrZV6g0UrtYfZZ+CGv7DV+v5be3teVSdw@mail.gmail.com> <20180906201206.GX2523@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906201206.GX2523@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Sep 6, 2018 at 1:12 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>> * Seems to have a few rails named differently LDO22 is named
>> "vreg_l22a_2p95" in your DTS but "vreg_l22a_2p85" in mine as one
>> example.  The schematics I have (from Dec 5, 2017) show it as 2p85.
>>
>
> Looks like a typo on my part, yours matches the schematics I have as
> well.

OK.  That was just one example.  Maybe do a diff of the two and see if
you find any where you believe your patch was right and mine was
wrong.


>> * Is lacking many alternate names for rails.  We can debate this also
>> if you want.
>>
>
> Afaict names such as "vdda_pcie_1p2" is the name of the pin on the
> SDM845, while the thing that comes out of the regulator is named
> vreg_l26a_1p2.
>
> So I believe this name should be used in the pcie node as:
>
>   vdda_pcie_1p2-supply = <&vreg_l26a_1p2>;

Adding labels for things like "vdda_pcie_1p2" is based on a suggestion
Stephen Boyd made to me that he felt it would be nice to be able to
refer to things by the name of the supply pin on the SoC.  This could
possibly enable better sharing of device tree snippets between
different boards using the same SoC and the idea seemed sane to me, so
I implemented it.  I described it in my commit message like this:

- Regulators that are hooked up to supply pins on the SoC are given
  an alias matching the name of that pin (pin name comes from the
  Qualcomm SoC "device specification" doc).

If folks don't like it, though, it's easy to remove.

>> * Have a few voltage values different.  If you have better info than
>> me we should update to yours.  Diffing against yours does make me
>> believe that perhaps LDO14 should be listed as 1.88 V in my patch.
>>
>
> Downstream it's listed as min: 1.8V max: 1.88V init: 1.8V.

I can change mine to that.  It's a very strange specification though.
Is it really 1.80 - 1.88 V?  Does something out there actually need
the voltage to be variable in this small range?


>> * Is lacking pm8005.
>>
>
> I didn't need this, yet...

OK.  I can certainly remove it as needed--the downstream patch I
started with had it so I figured I'd keep it in.


-Doug
