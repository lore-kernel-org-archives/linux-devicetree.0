From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 3/3] MIPS: ath79: Fix the USB PHY reset names
Date: Wed, 8 Feb 2017 16:11:47 -0600
Message-ID: <20170208221147.rwoirkib23s6wuzz@rob-hp-laptop>
References: <1486324352-15188-1-git-send-email-albeu@free.fr>
 <1486324352-15188-3-git-send-email-albeu@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486324352-15188-3-git-send-email-albeu-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban <albeu-GANU6spQydw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Feb 05, 2017 at 08:52:32PM +0100, Alban wrote:
> From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> 
> The binding for the USB PHY went thru before the driver. However the
> new version of the driver now use the PHY core support for reset, and
> this expect the reset to be named "phy". So remove the "usb-" prefix
> from the the reset names.
> 
> Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/phy/phy-ath79-usb.txt | 4 ++--
>  arch/mips/boot/dts/qca/ar9132.dtsi                      | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
