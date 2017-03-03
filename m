From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v3 6/6] iio: adc: stm32: add support for EXTI trigger
Date: Fri, 3 Mar 2017 12:45:54 +0100
Message-ID: <5be44ed9-2c86-ac51-d964-d231d5ca62fa@metafoo.de>
References: <1488300679-3259-1-git-send-email-fabrice.gasnier@st.com>
 <1488300679-3259-7-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488300679-3259-7-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>, jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, benjamin.gaignard@linaro.org, alexandre.torgue@st.com, linux-iio@vger.kernel.org, linus.walleij@linaro.org, pmeerw@pmeerw.net, knaack.h@gmx.de, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

On 02/28/2017 05:51 PM, Fabrice Gasnier wrote:
> EXTi (external interrupt) signal can be routed internally as trigger
> source for ADC conversions: STM32F4 ADC can use EXTI11.
> 
> Retrieve interrupt trigger from DT, so it can be muxed into ADC IP,
> via extsel.

Hi,

Sorry, I have some trouble understanding the specifics of this. Is EXTI a
hardware input signal into the ADC that automatically triggers a conversion
when asserted? If yes how is it configured which external signal is used
here. Your bindings suggest that any GPIO can be used, but the driver only
differentiates between EXTI on or EXTI off.

Or is this just a software triggered conversion? The GPIO triggers a
software interrupt routine and the interrupt routine than triggers conversion?
