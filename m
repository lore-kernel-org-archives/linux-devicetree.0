From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 12/18] dt-bindings: Add PLX Technology OXNAS pinctrl
 and gpio bindings
Date: Thu, 31 Mar 2016 10:58:20 +0200
Message-ID: <CACRpkdbem5a_aLTHErp0ZvanwvVPbGnDiWxM5e7iX_FdHtXprQ@mail.gmail.com>
References: <1458838215-23314-1-git-send-email-narmstrong@baylibre.com>
	<1458838215-23314-13-git-send-email-narmstrong@baylibre.com>
	<20160325144834.GA27177@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160325144834.GA27177@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 25, 2016 at 3:48 PM, Rob Herring <robh@kernel.org> wrote:
> On Thu, Mar 24, 2016 at 05:50:09PM +0100, Neil Armstrong wrote:
>> Add pinctrl and gpio DT bindings for PLX Technology OXNAS SoC Family.
>> This version supports the ARM926EJ-S based OX810SE SoC with 34 IO pins.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

>> + - plxtech,gpio-bank: Specifies which bank a controller owns.
>
> How is this used?

That is used to give a unique ID number to the bank.

Hardware often need this to cross-reference pin controllers
to GPIO banks.

I should add it as "gpio-bank" to the generic bindings
instead, several platforms already use this and there is
no point in having a vendor prefix in front of it.

Yours,
Linus Walleij
