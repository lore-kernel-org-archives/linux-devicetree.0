From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/7] Documentation: dt: Remove bindings for STM32
 pinctrl
Date: Mon, 10 Apr 2017 15:20:54 -0500
Message-ID: <20170410202054.urednfofxyb5iyou@rob-hp-laptop>
References: <1491568984-20169-1-git-send-email-alexandre.torgue@st.com>
 <1491568984-20169-3-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491568984-20169-3-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, lee.jones@linaro.org, Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 07, 2017 at 02:42:59PM +0200, Alexandre TORGUE wrote:
> Remove "ngpios" bindings definition as it is no more used in stm32 pinctrl
> driver.

I read the subject as "rm 
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.txt". You can 
be more specific:

dt-bindings: pinctrl: remove ngpios from stm32-pinctrl binding

With that,

Acked-by: Rob Herring <robh@kernel.org> 
