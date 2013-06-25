From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] Make non-linear GPIO ranges accesible from gpiolib
Date: Tue, 25 Jun 2013 16:56:29 +0200
Message-ID: <CACRpkdb5uVMBg96T5_CLYDMzs5KGB7a+njWd-OKewTm5D2mz1g@mail.gmail.com>
References: <CACRpkdY9F0cUaRfGJnHJW=2dYf_yKkr3M8Kh+_e6XQhh1WBoUA@mail.gmail.com>
	<1371128132-18266-2-git-send-email-christian.ruppert@abilis.com>
	<51BA3BC1.3090109@wwwdotorg.org>
	<20130614091241.GA23745@ab42.lan>
	<51C1F42E.5090107@wwwdotorg.org>
	<51C1F82C.4020502@wwwdotorg.org>
	<20130620115710.GB942@ab42.lan>
	<51C4C2ED.5090505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51C4C2ED.5090505@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Christian Ruppert <christian.ruppert@abilis.com>, Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2013 at 11:17 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 06/20/2013 05:57 AM, Christian Ruppert wrote:

>> Your remark seems to reflect one of the following two hardware
>> architectures:
>>
>>                                                      +- SPI
>>                  Physical pins --- GPIO --- pinctrl -+- I2C
>>                                                      +- mmc
>
> (that's diagram 1)
>
>>
>>                                 +- GPIO
>>                  Physical pins -+           +- SPI
>>                                 +- pinctrl -+- I2C
>>                                             +- mmc
>
> (that's diagram 2)
>
>> TB10x hardware architecture:
>>
>>                                             +- SPI
>>                  Physical pins --- pinctrl -+- I2C
>>                                             +- mmc
>>                                             +- GPIO
>
> (that's diagram 3)
>
> No, I was thinking of diagram 3 above. I'm not sure if diagrams (1) or
> (2) are common or exist?

The U300 pin controller is obviously of type (1) as it can spy on
the signals.

The Nomadik pin controller is basically type (2).

Maybe this is part of the explanation to why we sometimes tend
to talk past each other :-D

(I would replace the string "pinctrl" with "pinmux" above,
as I just did in my documentation patch adding these
diagrams.)

Yours,
Linus Walleij
