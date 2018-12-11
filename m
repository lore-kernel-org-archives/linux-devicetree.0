From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: syscon: Add optional clock support
Date: Tue, 11 Dec 2018 16:16:53 -0600
Message-ID: <20181211221653.GA18104@bogus>
References: <1543337297-21873-1-git-send-email-fabrice.gasnier@st.com>
 <1543337297-21873-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1543337297-21873-2-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: lee.jones@linaro.org, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, arnd@arndb.de, mark.rutland@arm.com, gabriel.fernandez@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 05:48:15PM +0100, Fabrice Gasnier wrote:
> Some system control registers need to be clocked, so the registers can
> be accessed. Add an optional clock.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
> index 25d9e9c..a9aaa51 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.txt
> +++ b/Documentation/devicetree/bindings/mfd/syscon.txt
> @@ -17,6 +17,7 @@ Optional property:
>  - reg-io-width: the size (in bytes) of the IO accesses that should be
>    performed on the device.
>  - hwlocks: reference to a phandle of a hardware spinlock provider node.
> +- clocks: phandle to the syscon clock

No. Add clocks to specific bindings using syscon. If you have a node 
with only 'syscon', then that should be fixed.

Rob
