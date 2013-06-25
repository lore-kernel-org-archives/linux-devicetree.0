From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/2] Make non-linear GPIO ranges accesible from gpiolib
Date: Tue, 25 Jun 2013 09:31:00 -0600
Message-ID: <51C9B7B4.6030109@wwwdotorg.org>
References: <CACRpkdY9F0cUaRfGJnHJW=2dYf_yKkr3M8Kh+_e6XQhh1WBoUA@mail.gmail.com> <1371128132-18266-2-git-send-email-christian.ruppert@abilis.com> <51BA3BC1.3090109@wwwdotorg.org> <20130614091241.GA23745@ab42.lan> <51C1F42E.5090107@wwwdotorg.org> <51C1F82C.4020502@wwwdotorg.org> <20130620115710.GB942@ab42.lan> <51C4C2ED.5090505@wwwdotorg.org> <CACRpkdb5uVMBg96T5_CLYDMzs5KGB7a+njWd-OKewTm5D2mz1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb5uVMBg96T5_CLYDMzs5KGB7a+njWd-OKewTm5D2mz1g@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 06/25/2013 08:56 AM, Linus Walleij wrote:
> On Fri, Jun 21, 2013 at 11:17 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>> On 06/20/2013 05:57 AM, Christian Ruppert wrote:
> 
>>> Your remark seems to reflect one of the following two hardware
>>> architectures:
>>>
>>>                                                      +- SPI
>>>                  Physical pins --- GPIO --- pinctrl -+- I2C
>>>                                                      +- mmc
>>
>> (that's diagram 1)
>>
>>>
>>>                                 +- GPIO
>>>                  Physical pins -+           +- SPI
>>>                                 +- pinctrl -+- I2C
>>>                                             +- mmc
>>
>> (that's diagram 2)
>>
>>> TB10x hardware architecture:
>>>
>>>                                             +- SPI
>>>                  Physical pins --- pinctrl -+- I2C
>>>                                             +- mmc
>>>                                             +- GPIO
>>
>> (that's diagram 3)
>>
>> No, I was thinking of diagram 3 above. I'm not sure if diagrams (1) or
>> (2) are common or exist?
> 
> The U300 pin controller is obviously of type (1) as it can spy on
> the signals.

U300 HW might be diagram (1) - I can't say since I'm not familiar with
the HW. However, the fact that GPIO can spy on signals in no way at all
implies that the HW must conform to diagram (1).

In diagram (2), the pins are routed to both the GPIO and pinctrl module,
so there's no reason why GPIO couldn't spy on any input signals there too.

Even in diagram 3, GPIO may be able to spy. The issue is how the
"inbound" muxes work.

For output signals from HW modules through the pinctrl HW to the pins,
there's likely a plain n:1 mux that selects a single signal and drives
it out.

For input signals, there are still some choices; you might have a 1:n
mux that only drives 1 single HW module's input signals from the pins,
or you may simply wire the input pin through to all the possible HW
modules in parallel on the input side, or you may always wire the input
pin to the GPIO HW module, but have a 1:n mux for the dedicated HW
modules so that (at most) one of those is driven by the pin, etc.

For reference, the Tegra HW is diagram (3), although actually the GPIO
module has the register bits that select between GPIO and mux-function
for each pin! The signals that control this are fed from the GPIO
register bits into input signals on the pinmux HW, which does all the
actual muxing. The input path muxing is set up so that without affecting
the pinmux programming, the GPIO module can spy on any input signal,
although while doing so, it disconnects the input pin from the dedicated
mux function, thus potentially causing some disruption.

> The Nomadik pin controller is basically type (2).
> 
> Maybe this is part of the explanation to why we sometimes tend
> to talk past each other :-D
> 
> (I would replace the string "pinctrl" with "pinmux" above,
> as I just did in my documentation patch adding these
> diagrams.)

