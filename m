From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: Add DT bindings
 documentation for amlogic-crypto
Date: Mon, 14 Oct 2019 13:17:03 -0500
Message-ID: <20191014181703.GA14399@bogus>
References: <1571031104-6880-1-git-send-email-clabbe@baylibre.com>
 <1571031104-6880-2-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1571031104-6880-2-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Mon, 14 Oct 2019 05:31:41 +0000, Corentin Labbe wrote:
> This patch adds documentation for Device-Tree bindings for the
> Amlogic GXL cryptographic offloader driver.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml   | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
