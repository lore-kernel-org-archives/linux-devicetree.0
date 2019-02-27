From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: Add ST Multi-Function eXpander
 (STMFX) core bindings
Date: Wed, 27 Feb 2019 17:55:35 -0600
Message-ID: <20190227235535.GA24395@bogus>
References: <1551260094-32570-1-git-send-email-amelie.delaunay@st.com>
 <1551260094-32570-2-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551260094-32570-2-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Feb 2019 10:34:46 +0100, Amelie Delaunay wrote:
> This patch adds documentation of device tree bindings for the
> STMicroelectronics Multi-Function eXpander (STMFX) MFD core.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  Documentation/devicetree/bindings/mfd/stmfx.txt | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
