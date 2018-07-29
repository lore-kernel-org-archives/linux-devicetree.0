From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: stm32: fix bank io port number
Date: Sun, 29 Jul 2018 22:02:44 +0200
Message-ID: <CACRpkdaO4-7ODpTo02mJjx167NH42QnFGj+hBRq3p=2-4j0iew@mail.gmail.com>
References: <1531745857-5561-1-git-send-email-alexandre.torgue@st.com> <1531745857-5561-2-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531745857-5561-2-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 16, 2018 at 2:57 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> In case the exti line is not in line with the bank number (that is the case
> when there is an hole between two banks, for example GPIOK and then GPIOZ),
> use "st,bank-ioport" DT property to get the right exti line.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
