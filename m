From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: stm32: add optional
 st,min-sample-time-nsecs
Date: Thu, 3 Aug 2017 12:01:54 -0500
Message-ID: <20170803170154.bizlx2dvdbwtgmoy@rob-hp-laptop>
References: <1500912640-23927-1-git-send-email-fabrice.gasnier@st.com>
 <1500912640-23927-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1500912640-23927-3-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 24, 2017 at 06:10:39PM +0200, Fabrice Gasnier wrote:
> STM32 ADC allows each channel to be sampled with a different sampling
> time. There's an application note that deals with this: 'How to get
> the best ADC accuracy in STM32...' It basically depends on analog input
> signal electrical properties (depends on board).
> 
> Add optional 'st,min-sample-time-nsecs' property so this can be tuned
> in dt.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
> Changes in v2:
> - Use 'st,min-sample-time-nsecs' instead of 'min-sample-time'.
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
