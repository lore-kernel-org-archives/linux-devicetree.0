From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/9] Add STM32 pinctrl/GPIO driver
Date: Fri, 5 Feb 2016 23:50:23 +0100
Message-ID: <CACRpkdY81TqbOpP35i=+-x5fHbui+iZ6-bWnwRCZUZfz2-J+rw@mail.gmail.com>
References: <1452773795-24216-1-git-send-email-mcoquelin.stm32@gmail.com>
	<CACRpkdYGQ1xObWfka2CN9au6YMGhpu4qcTZpu72bzuJjO38tog@mail.gmail.com>
	<56A92FB0.7080907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56A92FB0.7080907@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice CHOTARD <patrice.chotard@st.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 9:59 PM, Maxime Coquelin
<mcoquelin.stm32@gmail.com> wrote:

> How do you prefer to proceed?
> Should I send a fix on top of your devel branch, or you will fix it
> directly?

I fixed it now and also got rid of the surplus container_of
static inline. Sorry for the delay.

Yours,
Linus Walleij
