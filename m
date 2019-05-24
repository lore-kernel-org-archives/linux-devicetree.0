From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Date: Fri, 24 May 2019 16:55:58 -0500
Message-ID: <20190524215558.GA14313@bogus>
References: <20190523151050.27302-1-peron.clem@gmail.com>
 <20190523151050.27302-2-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190523151050.27302-2-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, 23 May 2019 17:10:47 +0200, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= wrote:
> Allwinner H6 has a similar watchdog as the A64 which is already
> a compatible of the A31.
> 
> This commit add the H6 compatible.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
