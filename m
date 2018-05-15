From: Christophe ROULLIER <christophe.roullier@st.com>
Subject: RE: [PATCH V2 8/8] dt-bindings: stm32: add compatible for syscon
Date: Tue, 15 May 2018 16:19:53 +0000
Message-ID: <d2b4cd1845b949a7bf9c42a17a5358a2@SFHDAG5NODE3.st.com>
References: <1525270723-18241-1-git-send-email-christophe.roullier@st.com>
 <1525270723-18241-9-git-send-email-christophe.roullier@st.com>
 <20180507163537.GA15212@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180507163537.GA15212@rob-hp-laptop>
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
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "andrew@lunn.ch" <andrew@lunn.ch>, Alexandre TORGUE <alexandre.torgue@st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Peppe CAVALLARO <peppe.cavallaro@st.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

I do not understand, so let me explain our status:

We have syscfg IP Harware in our SOC. 
But we do not have SoC specific driver to manage syscfg, we are using a generic driver "syscon".
So can you tell me what you wish to describe this part in our SOC bindings ?

Thanks for your help.

Christophe.

-----Original Message-----
From: Rob Herring [mailto:robh@kernel.org] 
Sent: lundi 7 mai 2018 18:36
To: Christophe ROULLIER <christophe.roullier@st.com>
Cc: mark.rutland@arm.com; mcoquelin.stm32@gmail.com; Alexandre TORGUE <alexandre.torgue@st.com>; Peppe CAVALLARO <peppe.cavallaro@st.com>; devicetree@vger.kernel.org; andrew@lunn.ch; linux-arm-kernel@lists.infradead.org; netdev@vger.kernel.org
Subject: Re: [PATCH V2 8/8] dt-bindings: stm32: add compatible for syscon

On Wed, May 02, 2018 at 04:18:43PM +0200, Christophe Roullier wrote:
> This patch describes syscon DT bindings.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32.txt 
> b/Documentation/devicetree/bindings/arm/stm32.txt
> index 6808ed9..06e3834 100644
> --- a/Documentation/devicetree/bindings/arm/stm32.txt
> +++ b/Documentation/devicetree/bindings/arm/stm32.txt
> @@ -8,3 +8,7 @@ using one of the following compatible strings:
>    st,stm32f746
>    st,stm32h743
>    st,stm32mp157
> +
> +Required nodes:
> +- syscon: the soc bus node must have a system controller node 
> +pointing to the
> +  global control registers, with the compatible string "syscon";

You misunderstood my prior comment. 'syscon' alone is not valid. You need SoC specific compatible string for it and 'stm32' is not SoC specific. IOW, the compatible property for a syscon should imply every single register field in the block.

Rob
