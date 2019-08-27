Return-Path: <robherring2@gmail.com>
Date: Tue, 27 Aug 2019 10:32:04 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4 v4] dt-bindings: mips: Add missing mt7688a-soc
 compatible
Message-ID: <20190827153204.GA2489@bogus>
References: <20190812103655.11070-1-sr@denx.de>
 <20190812103655.11070-2-sr@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812103655.11070-2-sr@denx.de>
To: Stefan Roese <sr@denx.de>
Cc: linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 12 Aug 2019 12:36:53 +0200, Stefan Roese wrote:
> This patch adds the "ralink,mt7688a-soc" compatible to the ralink DT
> bindings documentation. This compatible is already used by some MIPS
> boards (e.g. omega2p.dts) but not yet documented. It will also be used
> by the upcoming "GARDENA smart Gateway" support.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> v4:
> - New patch
> 
>  Documentation/devicetree/bindings/mips/ralink.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
