From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH 3/4] drivers: reset: Add STM32 reset driver
Date: Wed, 6 Jul 2016 17:39:54 +0200
Message-ID: <577D264A.4050709@st.com>
References: <1467640052-6770-1-git-send-email-gabriel.fernandez@st.com>
 <1467640052-6770-3-git-send-email-gabriel.fernandez@st.com>
 <1467653810.2224.77.camel@pengutronix.de> <577B61EA.5080703@st.com>
 <1467725370.2978.64.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467725370.2978.64.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, alexandre.torgue@st.com, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, patrice.chotard@st.com, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Philipp

On 07/05/2016 03:29 PM, Philipp Zabel wrote:
> Am Dienstag, den 05.07.2016, 09:29 +0200 schrieb Gabriel Fernandez:
> [...]
>>>> +static const struct reset_control_ops stm32_reset_ops = {
>>>> +	.assert		= stm32_reset_assert,
>>>> +	.deassert	= stm32_reset_deassert,
>>> Are the registers not readable, or did you choose not to
>>> implement .status on purpose?
>> We choose to not implement.
> Ok. Because of size issues or just because you don't need them in any of
> your drivers?
Because i don't need them.

BR

Gabriel

>
> regards
> Philipp
>
