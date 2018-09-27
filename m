From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 8/8] dt-binding: mtd: Document gpio-addr-flash
Date: Thu, 27 Sep 2018 15:03:19 -0500
Message-ID: <20180927200319.GA5099@bogus>
References: <20180925204813.GA6450@bogus>
 <20180926063934.9229-1-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180926063934.9229-1-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh@kernel.org, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org, open list <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, 26 Sep 2018 08:39:34 +0200, Ricardo Ribalda Delgado wrote:
> Add documentation for gpio-addr-flash. This binding allow creating
> flash devices that are paged using GPIOs.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> 
> Changelog v3: 
> 
> - Changes suggested by Rob Herring (Thanks!)
>   - Add gpio description
>   - Improve partition
> 
>  .../bindings/mtd/gpio-addr-flash.txt          | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
