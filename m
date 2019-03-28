From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: Document MIPID02 bindings
Date: Thu, 28 Mar 2019 12:43:31 -0500
Message-ID: <20190328174331.GA5863@bogus>
References: <1552373045-134493-1-git-send-email-mickael.guene@st.com>
 <1553680545-73278-1-git-send-email-mickael.guene@st.com>
 <1553680545-73278-2-git-send-email-mickael.guene@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1553680545-73278-2-git-send-email-mickael.guene@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-media@vger.kernel.org, hugues.fruchet@st.com, Mickael Guene <mickael.guene@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Mar 2019 10:55:43 +0100, Mickael Guene wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
