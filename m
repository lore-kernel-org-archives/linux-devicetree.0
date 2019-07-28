From: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 0/4] crypto: add amlogic crypto offloader driver
Date: Sun, 28 Jul 2019 11:48:03 -0700
Message-ID: <20190728184803.GA14920@sol.localdomain>
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Labbe <clabbe@baylibre.com>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, baylibre-upstreaming@groups.io
List-Id: devicetree@vger.kernel.org

Hi Corentin,

On Thu, Jul 25, 2019 at 07:42:52PM +0000, Corentin Labbe wrote:
> Hello
> 
> This serie adds support for the crypto offloader present on amlogic GXL
> SoCs.
> 
> Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc
> 
> Regards
> 

Does this new driver pass all the crypto self-tests?
Including with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y?

- Eric
