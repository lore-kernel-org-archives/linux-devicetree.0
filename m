From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC 3/4] dt-bindings: iio: add support for GPIO triggers
Date: Thu, 23 Feb 2017 16:03:28 +0100
Message-ID: <CACRpkdaFLMDhYZJrO=-MuSG31aO5vOZ2KX3_c95jzze46pymmQ@mail.gmail.com>
References: <1487347429-31761-1-git-send-email-fabrice.gasnier@st.com>
 <1487347429-31761-4-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487347429-31761-4-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 17, 2017 at 5:03 PM, Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Document Industrial I/O GPIO trigger support.
>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
(...)
> +- gpio-trigger-rising-edge: A rising edge on GPIO will trigger.
> +- gpio-trigger-falling-edge: A falling edge on GPIO will trigger.
> +  Note: Both rising and falling edge may be used. In case none of
> +  rising or falling edge is selected, rising edge is selected by
> +  default.

We have GPIO_ACTIVE*_HIGH and GPIO_ACTIVE_LOW in the
gpios second cell already.

Can't we simply use that and specify that for this usecase, reading
that cell as GPIO_ACTIVE_HIGH == trigger on rising edge and
GPIO_ACTIVE_LOW == trigger on falling edge?

Yours,
Linus Walleij
