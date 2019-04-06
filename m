From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 1/2] dt-bindings: Document MIPID02 bindings
Date: Sat, 6 Apr 2019 13:35:25 +0300
Message-ID: <20190406103525.amfsljsz4twi3xq2@valkosipuli.retiisi.org.uk>
References: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
 <1553680545-73278-1-git-send-email-mickael.guene@st.com>
 <1553680545-73278-2-git-send-email-mickael.guene@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553680545-73278-2-git-send-email-mickael.guene@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mickael Guene <mickael.guene@st.com>
Cc: linux-media@vger.kernel.org, hugues.fruchet@st.com, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Mickael,

On Wed, Mar 27, 2019 at 10:55:43AM +0100, Mickael Guene wrote:
> This adds documentation of device tree for MIPID02 CSI-2 to PARALLEL
> bridge.
> 
> Signed-off-by: Mickael Guene <mickael.guene@st.com>
> ---
> 
> Changes in v4:
> - Fix and clarify endpoints properties documentation
> 
> Changes in v3: None
> Changes in v2:
> - Add precision about first CSI-2 port data rate
> - Document endpoints supported properties
> - Rename 'mipid02@14' into generic 'csi2rx@14' in example
> 
>  .../bindings/media/i2c/st,st-mipid02.txt           | 82 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++
>  2 files changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
> new file mode 100644
> index 0000000..754a175
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
> @@ -0,0 +1,82 @@
> +STMicroelectronics MIPID02 CSI-2 to PARALLEL bridge
> +
> +MIPID02 has two CSI-2 input ports, only one of those ports can be active at a
> +time. Active port input stream will be de-serialized and its content outputted
> +through PARALLEL output port.
> +CSI-2 first input port is a dual lane 800Mbps per lane whereas CSI-2 second
> +input port is a single lane 800Mbps. Both ports support clock and data lane
> +polarity swap. First port also supports data lane swap.
> +PARALLEL output port has a maximum width of 12 bits.
> +Supported formats are RAW6, RAW7, RAW8, RAW10, RAW12, RGB565, RGB888, RGB444,
> +YUV420 8-bit, YUV422 8-bit and YUV420 10-bit.
> +
> +Required Properties:
> +- compatible: should be "st,st-mipid02"

s/should/shall/ overall; other values aren't really valid in any of the
cases.

-- 
Sakari Ailus
