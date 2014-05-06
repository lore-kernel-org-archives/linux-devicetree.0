From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/4] Enable ST Keyscan driver
Date: Tue, 06 May 2014 13:39:34 +0100
Message-ID: <5368D806.8050609@linaro.org>
References: <1399304320-18197-1-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1399304320-18197-1-git-send-email-gabriel.fernandez@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

All the DT patches look good for me.
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

I think It will be better to send a pull request to Arnd/Olof including 
other reviewed DT patches.

thanks,
srini


On 05/05/14 16:38, Gabriel FERNANDEZ wrote:
> The goal of this series is to enable ST Keyscan support to ST SoCs.
> The DT definition is added for STiH415 and STiH416 SoCs on
> B2000 board.
> Tested on B2000 sti board.
>
> Gabriel Fernandez (4):
>    ARM: STi: DT: add keyscan for stih415
>    ARM: STi: DT: add keyscan for stih416
>    ARM: STi: DT: add keyscan for stih41x-b2000
>    ARM: multi_v7_defconfig: add ST Keyscan driver
>
>   arch/arm/boot/dts/stih415-pinctrl.dtsi | 16 ++++++++++++++++
>   arch/arm/boot/dts/stih415.dtsi         | 12 ++++++++++++
>   arch/arm/boot/dts/stih416-pinctrl.dtsi | 16 ++++++++++++++++
>   arch/arm/boot/dts/stih416.dtsi         | 12 ++++++++++++
>   arch/arm/boot/dts/stih41x-b2000.dtsi   | 23 +++++++++++++++++++++++
>   arch/arm/configs/multi_v7_defconfig    |  1 +
>   6 files changed, 80 insertions(+)
>
