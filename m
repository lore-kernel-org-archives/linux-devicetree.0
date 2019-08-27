Return-Path: <robherring2@gmail.com>
Date: Tue, 27 Aug 2019 10:32:46 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4 v4] dt-bindings: mips: Add gardena vendor prefix and
 board description
Message-ID: <20190827153246.GA3678@bogus>
References: <20190812103655.11070-1-sr@denx.de>
 <20190812103655.11070-3-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812103655.11070-3-sr@denx.de>
To: Stefan Roese <sr@denx.de>
Cc: linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 12 Aug 2019 12:36:54 +0200, Stefan Roese wrote:
> This patch adds the vendor prefix for gardena and a short description
> including the compatible string for the "GARDENA smart Gateway" based
> on the MT7688 SoC.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> v4:
> - Move board description into ralink.txt instead of creating a gardena
>   board file (Rob)
> - Slightly changed board compatible
> 
> v3:
> - New patch
> 
>  Documentation/devicetree/bindings/mips/ralink.txt   | 13 +++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml        |  2 ++
>  2 files changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
