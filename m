From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 6/7] ARM: Kconfig: Introduce MACH_STM32F469 flag
Date: Mon, 24 Apr 2017 18:06:10 +0200
Message-ID: <a45e5791-cca1-79b8-a368-6d113c933ec3@st.com>
References: <1491568984-20169-1-git-send-email-alexandre.torgue@st.com>
 <1491568984-20169-7-git-send-email-alexandre.torgue@st.com>
 <CACRpkdZmWFKaZWB8qZaH=jB61xdwvJ=TC8idYH9kJdi=HEZRAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZmWFKaZWB8qZaH=jB61xdwvJ=TC8idYH9kJdi=HEZRAA@mail.gmail.com>
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

Hi

On 04/24/2017 02:30 PM, Linus Walleij wrote:
> On Fri, Apr 7, 2017 at 2:43 PM, Alexandre TORGUE
> <alexandre.torgue@st.com> wrote:
>
>> This patch introduces the MACH_STM32F469 to make possible to only select
>> STM32F469 pinctrl driver
>>
>> By default, all the MACH_STM32Fxxx flags will be set with STM32 defconfig.
>>
>> Signed-off-by: Alexandre TORGUE <alexandre.torgue@st.com>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please funnel this through the ARM SoC tree.

Yes, I'll merge it in future pull request.
Thanks for the series.

Regards
Alex

>
> Yours,
> Linus Walleij
>
