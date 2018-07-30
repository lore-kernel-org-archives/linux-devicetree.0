From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 2/2] pinctrl: stm32: check node status before new gpio
 bank registering
Date: Mon, 30 Jul 2018 17:31:22 +0200
Message-ID: <2f76dbc9-16f1-ddb6-be11-bf0c383b83c6@st.com>
References: <1531745857-5561-1-git-send-email-alexandre.torgue@st.com>
 <1531745857-5561-3-git-send-email-alexandre.torgue@st.com>
 <CACRpkdaDy5MGPMxh3GYFHL9VqTv44=t6J=xu_0sdXc4OHFo84g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdaDy5MGPMxh3GYFHL9VqTv44=t6J=xu_0sdXc4OHFo84g@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Amelie Delaunay <amelie.delaunay@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linus

On 07/29/2018 10:11 PM, Linus Walleij wrote:
> On Mon, Jul 16, 2018 at 2:57 PM Alexandre Torgue
> <alexandre.torgue@st.com> wrote:
> 
>> Register a new GPIO bank only if GPIO bank node is enabled. This patch also
>> adds checks on ranges which are defined only if a bank is registered.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> Patch applied.
> 
Thanks

> Alexandre can you check the discussion we've had about using
> GPIOLIB_IRQCHIP for multi-bank GPIOs with several IRQ
> lines as per drivers/gpio/gpio-tegra186.c?
> 
> Is this approach applicable for STM32 so we can pull
> more stuff in under GPIOLIB_IRQCHIP?
> 
Ok. I'm going to check what's possible to do. I let you know soon.

regards
Alex

> Yours,
> Linus Walleij
> 
