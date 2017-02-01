From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/8] ADD STM32H743 MCU and STM32H743i-Eval board supports
Date: Wed, 1 Feb 2017 17:47:43 +0100
Message-ID: <83444163-8b25-b2e9-205a-188f29df0d24@st.com>
References: <1485868465-30446-1-git-send-email-alexandre.torgue@st.com>
 <CACRpkdb35JdbE5bPMU_NeVehnA-qs3aAxCgE0==L=Z9vmq1yWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdb35JdbE5bPMU_NeVehnA-qs3aAxCgE0==L=Z9vmq1yWQ@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Linus

On 02/01/2017 04:16 PM, Linus Walleij wrote:
> On Tue, Jan 31, 2017 at 2:14 PM, Alexandre TORGUE
> <alexandre.torgue@st.com> wrote:
>
>> This series adds basic support for STM32H743 MCU and stm32h743i-eval board.
>> With it, you can boot stm32h743i-eval board successfully.
>
> Patch 1 & 2 look fine to me.
>
> Shall I just apply them and offer them on an immutable branch based
> on v4.10 so you can pull that into ARM SoC if you want to get this in
> for v4.11?

Thanks, but I think it is a bit late for this cycle. Indeed I'm close to 
send a second round for STM32 DT, but I don't plan to add STM32H7 
support. I prefere to let machine & DT patches in review.
Anyway, I 'll be happy if you take pinctrl & bindings parts in this 
cycle :).

Regards
Alex

>
> Yours,
> Linus Walleij
>
