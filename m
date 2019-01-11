Return-Path: <robherring2@gmail.com>
Date: Fri, 11 Jan 2019 10:11:57 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 01/10] input: touchscreen: ili210x: Add DT binding
 document
Message-ID: <20190111161157.GA7722@bogus>
References: <20190103012938.7442-1-marex@denx.de>
 <20190103012938.7442-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190103012938.7442-2-marex@denx.de>
To: Marek Vasut <marex@denx.de>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>, Olivier Sobrie <olivier@sobrie.be>, Philipp Puschmann <pp@emlix.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu,  3 Jan 2019 02:29:29 +0100, Marek Vasut wrote:
> Add DT binding document for the Ilitek ILI210x and ILI251x
> touchscreen controllers.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Olivier Sobrie <olivier@sobrie.be>
> Cc: Philipp Puschmann <pp@emlix.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-input@vger.kernel.org
> ---
> V2: New patch
> V3: Replace touch@ with touchscreen@
> ---
>  .../bindings/input/ilitek,ili2xxx.txt         | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
