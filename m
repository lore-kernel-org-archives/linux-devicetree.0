From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/7] Documentation: dt: Add new compatible to STM32
 pinctrl driver bindings
Date: Mon, 10 Apr 2017 15:30:37 -0500
Message-ID: <20170410203037.tpaejzcrjtb5lkay@rob-hp-laptop>
References: <1491568984-20169-1-git-send-email-alexandre.torgue@st.com>
 <1491568984-20169-6-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1491568984-20169-6-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, lee.jones@linaro.org, Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 07, 2017 at 02:43:02PM +0200, Alexandre TORGUE wrote:
> Add new compatible for stm32f469 MCU.

Again, the subject is a bit generic. Something like:

dt-bindings: pinctrl: Add st,stm32f469-pinctrl compatible to stm32-pinctrl

And this should come before the driver changes. 

With that,

Acked-by: Rob Herring <robh@kernel.org> 
