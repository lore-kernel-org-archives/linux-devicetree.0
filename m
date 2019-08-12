From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] macb: bindings doc: update sifive fu540-c000 binding
Date: Mon, 12 Aug 2019 17:32:42 -0600
Message-ID: <20190812233242.GA21855@bogus>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
Sender: netdev-owner@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, paul.walmsley@sifive.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, nicolas.ferre@microchip.com, ynezz@true.cz, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

On Fri, 19 Jul 2019 16:40:29 +0530, Yash Shah wrote:
> As per the discussion with Nicolas Ferre, rename the compatible property
> to a more appropriate and specific string.
> LINK: https://lkml.org/lkml/2019/7/17/200
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/net/macb.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
