From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: Add STM32 factory-programmed romem
Date: Tue, 26 Feb 2019 11:58:09 -0600
Message-ID: <CAL_JsqLKcJiZCUp1FW4E7-5uC8v1Af0TZsiPympX9HsYE1N_dQ@mail.gmail.com>
References: <1548866336-14765-1-git-send-email-fabrice.gasnier@st.com>
 <1548866336-14765-2-git-send-email-fabrice.gasnier@st.com>
 <20190225165307.GA26260@bogus> <d2473029-76a7-de2c-8ff5-9d065577f0b1@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d2473029-76a7-de2c-8ff5-9d065577f0b1@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lionel Debieve <lionel.debieve@st.com>, devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 26, 2019 at 3:14 AM Fabrice Gasnier <fabrice.gasnier@st.com> wrote:
>
> On 2/25/19 5:53 PM, Rob Herring wrote:
> > On Wed, Jan 30, 2019 at 05:38:53PM +0100, Fabrice Gasnier wrote:
> >> Add documentation for STMicroelectronics STM32 Factory-programmed
> >> read only memory area.
> >>
> >> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> >> ---
> >>  .../devicetree/bindings/nvmem/st,stm32-romem.txt   | 31 ++++++++++++++++++++++
> >>  1 file changed, 31 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
> >> new file mode 100644
> >> index 0000000..fbff52e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.txt
> >> @@ -0,0 +1,31 @@
> >> +STMicroelectronics STM32 Factory-programmed data device tree bindings
> >> +
> >> +This represents STM32 Factory-programmed read only non-volatile area: locked
> >> +flash, OTP, read-only HW regs... This contains various information such as:
> >
> > Several distinct types here. Does s/w need to know the difference
> > rather than just one generic-ish compatible? Access size restrictions
> > maybe? Ability to unlock and program?
>
> Hi Rob,
>
> The reading part is represented here as "st,stm32-romem" compatible, to
> simply handle read only access. I agree this could be a generic-ish.
>
> BUT the specifics are regarding the ability to unlock/lock and program.
> Access size can vary from one part to another (e.g. on stm32f4,
> reference manual sates: OTP area is divided into 16 OTP data blocks of
> 32 bytes. on stm32f7, OTP area is divided into 16 OTP data blocks of 64
> bytes.)
>
> In STM32MP15, both the read & write access through the BSEC are
> specific, represented by dedicated compatible.
>
> Do you wish I update the compatible to something like:
> "st,stm32f4-otp"
> "st,stm32mp15-bsec"
> ?

Yes, I think given the above that makes sense. We can always map
specific bindings to generic drivers, but not the reverse.

Rob
