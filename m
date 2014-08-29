From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: use IORESOURCE_REG resource type for non-translatable addresses
 in DT
Date: Thu, 28 Aug 2014 21:09:24 -0700
Message-ID: <CAJAp7Oj+3bUAciLcbfZpfDE0MFem8G_P1gTjV=-UK_U3o4UEZw@mail.gmail.com>
References: <53D788A7.4020303@mm-sol.com>
	<3794875.CZFbAag5Sv@wuerfel>
	<53D7AA72.6010309@mm-sol.com>
	<20140729234522.E9FF1C40738@trevor.secretlab.ca>
	<53D84558.7060406@codeaurora.org>
	<CAL_JsqJjH0OH+X=fzwqAPeWarjoLev7v6Nv_QhAa+nZyztMnFA@mail.gmail.com>
	<20140730060619.GC19933@codeaurora.org>
	<CAJAp7OhoRQ1eWack1e=OL0cS4Fxmgxc7OWeNxcj1qt7Q-x-sQA@mail.gmail.com>
	<53FE53E1.9030605@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53FE53E1.9030605@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@linaro.org>, Lee Jones <lee.jones@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mark Brown <broonie@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 27, 2014 at 2:55 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> What's Josh's original proposal? We've already punted on this for SSBI
> PMICs and just required them to put registers in DT for use some day and
> I don't see anyone blocking individual SPMI pmic drivers from merging
> over this. So I guess I agree with you that we can move forward with the
> other drivers. I'd still like to see us make this better though, so it
> seems worthwhile to have the discussion and get to some conclusion.
>

That sounds totally reasonable, I agree that we should try to sort
this out and if we do this should be applicable on pm8xxx as well(?).

My concern was that further discussions would hinder the ability of
actually committing the pm8x41 container driver and that is in my eyes
blocking integration of drivers for the pmic blocks.

Regards,
Bjorn
