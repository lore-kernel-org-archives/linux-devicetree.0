From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1] dt-bindings: fec: explicitly mark deprecated
 properties
Date: Mon, 12 Aug 2019 17:12:05 -0600
Message-ID: <20190812231205.GA21028@bogus>
References: <20190718201453.13062-1-TheSven73@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190718201453.13062-1-TheSven73@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>
Cc: Fugang Duan <fugang.duan@nxp.com>, Mark Rutland <mark.rutland@arm.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, 18 Jul 2019 16:14:53 -0400, Sven Van Asbroeck wrote:
> fec's gpio phy reset properties have been deprecated.
> Update the dt-bindings documentation to explicitly mark
> them as such, and provide a short description of the
> recommended alternative.
> 
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>  .../devicetree/bindings/net/fsl-fec.txt       | 30 +++++++++++--------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 

Applied, thanks.

Rob
