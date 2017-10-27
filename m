From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] openrisc: dts: Add OpenRISC platform SoC
Date: Thu, 26 Oct 2017 22:18:33 -0500
Message-ID: <20171027031833.g6zrlewszok4vksx@rob-hp-laptop>
References: <20171022024641.28478-1-shorne@gmail.com>
 <20171022024641.28478-4-shorne@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171022024641.28478-4-shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Openrisc <openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 22, 2017 at 11:46:41AM +0900, Stafford Horne wrote:
> Add devicetree binding documentation for the OpenRISC platform
> opencores,or1ksim.  This is the main OpenRISC reference platform
> supporting multiple FPGA SoC's.
> 
> This format is based on some of the mips binding docs as we have
> similar requirements.
> 
> Also, update maintainers so openrisc related binding changes are visible
> to the openrisc team.

Your subject is wrong because this is not a dts patch. Use 
"dt-bindings: openrisc: ..."

> 
> Suggested-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> Signed-off-by: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/openrisc/opencores/or1ksim.txt        | 39 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/openrisc/opencores/or1ksim.txt

Otherwise,

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
