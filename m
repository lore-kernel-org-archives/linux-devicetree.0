From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [Linux-stm32][PATCH 0/4] ARM: dts: stm32: add i2s and sai support
 on stm32mp157c
Date: Tue, 21 May 2019 10:53:40 +0200
Message-ID: <79b6d8c7-5756-26eb-1e26-534890e712e1@st.com>
References: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556201440-5540-1-git-send-email-olivier.moysan@st.com>
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

On 4/25/19 4:10 PM, Olivier Moysan wrote:
> This patchset adds support of STM32 SAI and I2S on stm32mp157c
> 
> Olivier Moysan (4):
>    ARM: dts: stm32: add sai support on stm32mp157c
>    ARM: dts: stm32: add sai pins muxing on stm32mp157
>    ARM: dts: stm32: add i2s support on stm32mp157c
>    ARM: dts: stm32: add i2s pins muxing on stm32mp157
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi |  92 +++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 158 ++++++++++++++++++++++++++++++
>   2 files changed, 250 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex
