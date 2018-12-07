From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [ v3 3/3] mtd: rawnand: stm32_fmc2: add manual mode
Date: Fri, 7 Dec 2018 10:16:44 +0100
Message-ID: <CACRpkdZuR-Qud1E6sm-qWx1knWx+1_J1rxT+COh76z7BxYjz-Q@mail.gmail.com>
References: <1543509663-26128-1-git-send-email-christophe.kerello@st.com> <1543509663-26128-4-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543509663-26128-4-git-send-email-christophe.kerello@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: christophe.kerello@st.com
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Mark Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 29, 2018 at 5:42 PM Christophe Kerello
<christophe.kerello@st.com> wrote:

> This patch adds the manual mode, a basic mode that do not need
> any DMA channels. This mode is also useful for debug purpose.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>

This is a bit of drive-by comment, but "manual mode" usually
means there is a person "a man" pulling levers and pushing
buttons. There is nothing manual inside a computer system.

I think the more appropriate term is "polling mode" which is
what we call code that read registers directly waiting for status
flags rather than relying on IRQs or DMA flows.

Yours,
Linus Walleij
