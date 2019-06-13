From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: property-units: Sanitize unit naming
Date: Thu, 13 Jun 2019 14:29:55 -0600
Message-ID: <20190613202955.GA22441@bogus>
References: <20190514085024.17587-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190514085024.17587-1-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

On Tue, 14 May 2019 10:50:24 +0200, Geert Uytterhoeven wrote:
> Make the naming of units consistent with common practices:
>   - Do not capitalize the first character of units ("Celsius" is
>     special, as it is not the unit name, but a reference to its
>     proposer),
>   - Do not use plural for units,
>   - Do not abbreviate "ampere",
>   - Concatenate prefixes and units (no spaces or hyphens),
>   - Separate units by spaces not hyphens,
>   - "milli" applies to "degree", not to "Celsius".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/property-units.txt    | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 

Applied, thanks.

Rob
