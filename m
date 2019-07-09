From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: new binding for Amlogic VRTC
Date: Mon, 8 Jul 2019 20:07:09 -0600
Message-ID: <20190709020709.GA20395@bogus>
References: <20190607194343.18359-1-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190607194343.18359-1-khilman@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Fri,  7 Jun 2019 12:43:42 -0700, Kevin Hilman wrote:
> From: Kevin Hilman <khilman@baylibre.com>
> 
> Add binding fo the new VRTC driver for Amlogic SoCs.  The 64-bit
> family of SoCs only has an RTC managed by firmware, and this VRTC
> driver provides the simple, one-register firmware interface.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../devicetree/bindings/rtc/rtc-meson-vrtc.txt   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
