From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: misc: bk4: Add device tree binding for
 Liebherr's BK4 SPI bus
Date: Mon, 15 Oct 2018 13:46:27 -0500
Message-ID: <20181015184627.GA23207@bogus>
References: <20180927222655.24482-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180927222655.24482-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2018 at 12:26:55AM +0200, Lukasz Majewski wrote:
> Add Device Tree binding document for Liebherr's BK4 external SPI bus.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>  Documentation/devicetree/bindings/misc/lwn-bk4.txt | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/lwn-bk4.txt

Applied.

To add to Mark's comments, the status of binding patches can be checked 
on patchwork[1]. There's no reason for pings to me. If it is in the 
"New" state, I will get to it and you can see where you are in the 
queue. ATM, I'm rather backed up.

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/
