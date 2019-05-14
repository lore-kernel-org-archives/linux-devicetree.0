From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert stm32 pinctrl bindings
 to json-schema
Date: Tue, 14 May 2019 15:14:46 -0500
Message-ID: <20190514201446.GA29557@bogus>
References: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557503126-3025-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Alexandre Torgue <alexandre.torgue@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 10 May 2019 17:45:26 +0200, Alexandre Torgue wrote:
> Convert the STM32 pinctrl binding to DT schema format using json-schema.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> ---
> 
> Hi,
> 
> First pacth to convert DT bindings file (here pinctrl STM32) to json-schema
> in order to take advantage of devicetree validation tool for STM32.
> 
> Changes since v1:
>  - Fix errors reported by Rob.
> 
> 
> regards
> Alex
> 

Reviewed-by: Rob Herring <robh@kernel.org>
