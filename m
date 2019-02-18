From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: add G12A AO Clock and Reset
 Bindings
Date: Mon, 18 Feb 2019 14:02:34 -0600
Message-ID: <20190218200234.GA31723@bogus>
References: <20190212162859.20743-1-narmstrong@baylibre.com>
 <20190212162859.20743-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190212162859.20743-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: jbrunet@baylibre.com, devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 12 Feb 2019 17:28:58 +0100, Neil Armstrong wrote:
> Add bindings for the Amlogic G12A AO Clock and Reset controllers.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/clock/amlogic,gxbb-aoclkc.txt    |  1 +
>  include/dt-bindings/clock/g12a-aoclkc.h       | 34 +++++++++++++++++++
>  include/dt-bindings/reset/g12a-aoclkc.h       | 18 ++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 include/dt-bindings/clock/g12a-aoclkc.h
>  create mode 100644 include/dt-bindings/reset/g12a-aoclkc.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
