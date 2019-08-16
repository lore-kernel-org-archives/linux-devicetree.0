From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: msi: Correct
 msi-controller@c's reg
Date: Fri, 16 Aug 2019 16:54:25 -0500
Message-ID: <20190816215425.GA2726@bogus>
References: <1564306219-17439-1-git-send-email-bmeng.cn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564306219-17439-1-git-send-email-bmeng.cn@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, 28 Jul 2019 02:30:18 -0700, Bin Meng wrote:
> The base address of msi-controller@c should be set to c.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  Documentation/devicetree/bindings/interrupt-controller/msi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
