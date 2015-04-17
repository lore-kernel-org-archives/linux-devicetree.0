From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v3 00/17] crypto: talitos - Add support for SEC1
Date: Fri, 17 Apr 2015 17:26:42 +0200
Message-ID: <20150417152642.GA7671@aepfle.de>
References: <20150417143147.154871A242C@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-crypto-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150417143147.154871A242C@localhost.localdomain>
Sender: linux-crypto-owner@vger.kernel.org
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Kim Phillips <kim.phillips@freescale.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 17, Christophe Leroy wrote:

> v3 is a complete rework of the patchset. Since a kernel can be built
> with support for both MPC82xx and MPC83xx at the same time, talitos
> driver shall support both SEC1 and SEC2+ at the same time.

The used git send-email command lacked the --thread option.

>From this perspective: NACK to the whole series...

Olaf
