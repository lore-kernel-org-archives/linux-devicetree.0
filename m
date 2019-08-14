From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: stm32: Fix 'st,syscfg' schema
Date: Wed, 14 Aug 2019 10:14:00 +0200
Message-ID: <CACRpkdZztpUBWnUtJiZY030qVJMEB7gNstyXQeTYWUZ6LMwx+A@mail.gmail.com>
References: <20190813205528.16651-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190813205528.16651-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 10:55 PM Rob Herring <robh@kernel.org> wrote:

> The proper way to add additional contraints to an existing json-schema
> is using 'allOf' to reference the base schema. Using just '$ref' doesn't
> work. Fix this for the 'st,syscfg' property.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I've got some other fixes queued up and can take this via the DT tree.

OK!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
