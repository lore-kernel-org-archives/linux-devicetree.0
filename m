From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/2] ARM: dts: stm32: add spdifrx support on stm32mp157c
Date: Wed, 10 Apr 2019 14:52:07 +0200
Message-ID: <c85bb824-2645-5916-1e9d-70c297d9dc12@st.com>
References: <1553854365-19866-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1553854365-19866-1-git-send-email-olivier.moysan@st.com>
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
To: Olivier Moysan <olivier.moysan@st.com>, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Olivier

On 3/29/19 11:12 AM, Olivier Moysan wrote:
> This patchset adds support of STM32 SPDFIRX on stm32mp157c
> 
> Olivier Moysan (2):
>    ARM: dts: stm32: add spdifrx support on stm32mp157c
>    ARM: dts: stm32: add spdfirx pins to stm32mp157c
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 13 +++++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 13 +++++++++++++
>   2 files changed, 26 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex
