From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 07/10] dt-bindings: counter: Document stm32 quadrature
 encoder
Date: Thu, 5 Jul 2018 15:13:00 -0600
Message-ID: <20180705211300.GA18202@rob-hp-laptop>
References: <cover.1529607879.git.vilhelm.gray@gmail.com>
 <c1cc3d567d0a5799c3afe6e24ca9ec3b1547224e.1529607879.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c1cc3d567d0a5799c3afe6e24ca9ec3b1547224e.1529607879.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, fabrice.gasnier@st.com, benjamin.gaignard@st.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com
List-Id: devicetree@vger.kernel.org

On Thu, Jun 21, 2018 at 05:08:34PM -0400, William Breathitt Gray wrote:
> From: Benjamin Gaignard <benjamin.gaignard@st.com>
> 
> Add bindings for STM32 Timer quadrature encoder.
> It is a sub-node of STM32 Timer which implement the
> quadratic encoder part of the hardware.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
>  .../bindings/counter/stm32-timer-cnt.txt      | 31 +++++++++++++++++++
>  .../devicetree/bindings/mfd/stm32-timers.txt  |  7 +++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/counter/stm32-timer-cnt.txt

Acked-by: Rob Herring <robh@kernel.org> 
