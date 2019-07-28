From: LABBE Corentin <clabbe@baylibre.com>
Subject: Re: [PATCH 0/4] crypto: add amlogic crypto offloader driver
Date: Sun, 28 Jul 2019 21:42:11 +0200
Message-ID: <20190728194211.GA29444@Red>
References: <1564083776-20540-1-git-send-email-clabbe@baylibre.com>
 <20190728184803.GA14920@sol.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190728184803.GA14920@sol.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, baylibre-upstreaming@groups.io
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 11:48:03AM -0700, Eric Biggers wrote:
> Hi Corentin,
> 
> On Thu, Jul 25, 2019 at 07:42:52PM +0000, Corentin Labbe wrote:
> > Hello
> > 
> > This serie adds support for the crypto offloader present on amlogic GXL
> > SoCs.
> > 
> > Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc
> > 
> > Regards
> > 
> 
> Does this new driver pass all the crypto self-tests?
> Including with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y?
> 

Yes it pass all extra self-tests.
I forgot to write it in the cover letter.

Regards
