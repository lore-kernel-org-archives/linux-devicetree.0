From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: regulator: add support for MT6392
Date: Tue, 14 May 2019 15:27:48 -0500
Message-ID: <20190514202748.GA20452@bogus>
References: <20190513161026.31308-1-fparent@baylibre.com>
 <20190513161026.31308-2-fparent@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190513161026.31308-2-fparent@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Mon, 13 May 2019 18:10:22 +0200, Fabien Parent wrote:
> Add binding documentation of the regulator for MT6392 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> v2:
> 	* Use 'pmic' as node name for the pmic.
> 	* Use 'regulators' as node name for the regulators
> 	* use dash instead of underscore for regulator's node names.
> 
> ---
>  .../bindings/regulator/mt6392-regulator.txt   | 220 ++++++++++++++++++
>  1 file changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6392-regulator.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
