Return-Path: <robherring2@gmail.com>
Date: Wed, 27 Mar 2019 14:44:25 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] Input: ili210x - Add DT binding for the Ilitek
 ILI2117 touch controller
Message-ID: <20190327194425.GA641@bogus>
References: <20190302141704.32547-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190302141704.32547-1-marex@denx.de>
To: Marek Vasut <marex@denx.de>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>, Olivier Sobrie <olivier@sobrie.be>, Philipp Puschmann <pp@emlix.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat,  2 Mar 2019 15:17:03 +0100, Marek Vasut wrote:
> Add DT binding for the Ilitek ILI2117 touch controller, which is yet
> again a slightly different device in the ILI21xx family.
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
>  Documentation/devicetree/bindings/input/ilitek,ili2xxx.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
