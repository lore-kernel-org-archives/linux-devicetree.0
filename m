From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 2/7] Documentation: dt: Remove bindings for STM32
 pinctrl
Date: Wed, 12 Apr 2017 15:24:12 +0200
Message-ID: <dfcff424-6a41-a22e-817e-0ef68c26d9e4@st.com>
References: <1491568984-20169-1-git-send-email-alexandre.torgue@st.com>
 <1491568984-20169-3-git-send-email-alexandre.torgue@st.com>
 <20170410202054.urednfofxyb5iyou@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170410202054.urednfofxyb5iyou@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, lee.jones@linaro.org, Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob

On 04/10/2017 10:20 PM, Rob Herring wrote:
> On Fri, Apr 07, 2017 at 02:42:59PM +0200, Alexandre TORGUE wrote:
>> Remove "ngpios" bindings definition as it is no more used in stm32 pinctrl
>> driver.
>
> I read the subject as "rm
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt". You can
> be more specific:
>
> dt-bindings: pinctrl: remove ngpios from stm32-pinctrl binding
>
> With that,
>
> Acked-by: Rob Herring <robh@kernel.org>
>

Thanks for review. I think that documentations patches (patch 2 & 3) 
will be merged by Linus W.

Linus, do you want a V3 to fix commit header ?

Regards
Alex
