From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 05/14] dt-bindings: add openrisc to vendor prefixes
 list
Date: Mon, 18 Sep 2017 15:39:25 -0500
Message-ID: <20170918203925.cebdxbx2mmlqdidb@rob-hp-laptop>
References: <20170910064926.5874-1-shorne@gmail.com>
 <20170910064926.5874-6-shorne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170910064926.5874-6-shorne@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Openrisc <openrisc@lists.librecores.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Thierry Reding <treding@nvidia.com>, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Marek Vasut <marek.vasut@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 10, 2017 at 03:49:17PM +0900, Stafford Horne wrote:
> Add OpenRISC.io to vendor prefixes.  This is reserved for softcores
> developed by the OpenRISC community.  The OpenRISC community has
> separated from OpenCores.org requiring a new prefix.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> 
> Changes since v1
>  - New patch
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
