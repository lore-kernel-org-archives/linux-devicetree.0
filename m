From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: gnss: add mediatek binding
Date: Mon, 21 Jan 2019 11:10:19 -0600
Message-ID: <20190121171019.GA2903@bogus>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547744074-28308-3-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Loys Ollivier <lollivier@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 17 Jan 2019 17:54:32 +0100, Loys Ollivier wrote:
> Add binding for Mediatek-based GNSS receivers.
> 
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
> 
> v2:
> Renamed bindings from Globaltop/gtop to Mediatek/mtk.
> Moved current-speed as an optional propertie.
> Removed the status line in the example.
> Added "mediatek,mt3339" compatible.
> 
>  .../devicetree/bindings/gnss/mediatek.txt          | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
