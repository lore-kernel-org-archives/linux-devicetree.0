From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: mfd: Add ST Multi-Function eXpander
 (STMFX) core bindings
Date: Wed, 19 Sep 2018 12:37:58 -0700
Message-ID: <CACRpkdZBeHC3EVzGU_GNSeW_y7FBbsEibOO5JPi+LD-jhzSooA@mail.gmail.com>
References: <1537363669-25991-1-git-send-email-amelie.delaunay@st.com> <1537363669-25991-2-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537363669-25991-2-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 19, 2018 at 6:28 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:

> This patch adds documentation of device tree bindings for the
> STMicroelectronics Multi-Function eXpander (STMFX) MFD core.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

These bindings look good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If you want you can shorten the interrupt description by just referring
to interrupt-controller/interrupts.txt

Yours,
Linus Walleij
