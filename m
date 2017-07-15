From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: regulator: Add STM32 Voltage Reference
 Buffer
Date: Fri, 14 Jul 2017 20:29:29 -0500
Message-ID: <20170715012929.ofmd3yxi6iv2bkbs@rob-hp-laptop>
References: <1499776233-29116-1-git-send-email-fabrice.gasnier@st.com>
 <1499776233-29116-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1499776233-29116-2-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 11, 2017 at 02:30:31PM +0200, Fabrice Gasnier wrote:
> Document STM32 VREFBUF (voltage reference buffer) which can be used as
> voltage reference for ADCs, DACs and external components.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  .../bindings/regulator/st,stm32-vrefbuf.txt          | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32-vrefbuf.txt

Acked-by: Rob Herring <robh@kernel.org>
