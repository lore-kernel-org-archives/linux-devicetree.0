From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v4 0/8] stm32 m4 remoteproc on STM32MP157c
Date: Fri, 26 Jul 2019 18:18:37 +0200
Message-ID: <334f2829-fa5e-3f81-5872-730b2aa8b757@st.com>
References: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1557822423-22658-1-git-send-email-fabien.dessenne@st.com>
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
To: Fabien Dessenne <fabien.dessenne@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Ludovic Barre <ludovic.barre@st.com>, Loic Pallardy <loic.pallardy@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

Hi Fabien

On 5/14/19 10:26 AM, Fabien Dessenne wrote:
> STMicrolectronics STM32MP157 MPU are based on a Dual Arm Cortex-A7 core and a
> Cortex-M4.
> This patchset adds the support of the stm32_rproc driver allowing to control
> the M4 remote processor.
> 

...

>      driver
>    remoteproc: stm32: add an ST stm32_rproc driver
>    ARM: dts: stm32: add m4 remoteproc support on STM32MP157c
>    ARM: dts: stm32: declare copro reserved memories on STM32MP157c-ed1
>    ARM: dts: stm32: enable m4 coprocessor support on STM32MP157c-ed1
>    ARM: dts: stm32: declare copro reserved memories on STM32MP157a-dk1
>    ARM: dts: stm32: enable m4 coprocessor support on STM32MP157a-dk1
> 

DT patches applied on stm32-next.

Regards
Alexandre
