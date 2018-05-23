From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 8/8] dt-bindings: stm32: add compatible for syscon
Date: Wed, 23 May 2018 14:03:32 -0500
Message-ID: <20180523190332.GA20768@rob-hp-laptop>
References: <1527090479-5263-1-git-send-email-christophe.roullier@st.com>
 <1527090479-5263-9-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1527090479-5263-9-git-send-email-christophe.roullier@st.com>
Sender: netdev-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>
Cc: mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, peppe.cavallaro@st.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On Wed, May 23, 2018 at 05:47:59PM +0200, Christophe Roullier wrote:
> This patch describes syscon DT bindings.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32.txt            | 10 ----------
>  .../devicetree/bindings/arm/stm32/stm32-syscon.txt         | 14 ++++++++++++++
>  Documentation/devicetree/bindings/arm/stm32/stm32.txt      | 10 ++++++++++
>  3 files changed, 24 insertions(+), 10 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/stm32.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32-syscon.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.txt

In the future, use the -M option so file moves don't show any diff.

Reviewed-by: Rob Herring <robh@kernel.org>
