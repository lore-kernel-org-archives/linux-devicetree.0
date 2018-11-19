From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: stm32: protect configuration registers with
 a hwspinlock
Date: Mon, 19 Nov 2018 13:20:46 +0100
Message-ID: <CACRpkdZD5EurbTRyUg7AWRZqVQ-6rmUQDUmVVCFU3r0Y1bwnVg@mail.gmail.com>
References: <20181113095142.32015-1-benjamin.gaignard@st.com> <20181113095142.32015-3-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113095142.32015-3-benjamin.gaignard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 13, 2018 at 10:51 AM Benjamin Gaignard
<benjamin.gaignard@linaro.org> wrote:

> If a hwspinlock if defined in device tree use it to protect
> configuration registers.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Patch applied with Alex' ACK.

Out of curiosity: what is it protecting against?
I would guess simultaneous access from another CPU
but the commit doesn't say.

Simultaneous access from two CPUs makes it extra important
that all register access is read-modify-write, so I'd have a second
check over the code to make sure this is the case.

Yours,
Linus Walleij
