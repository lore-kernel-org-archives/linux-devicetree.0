From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] doc: dt: add documentation for nxp,lpc1850-usb-otg-phy
Date: Thu, 21 May 2015 18:29:52 +0530
Message-ID: <555DD6C8.7040804@ti.com>
References: <1431797277-4906-1-git-send-email-manabian@gmail.com> <1431797277-4906-3-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431797277-4906-3-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Saturday 16 May 2015 10:57 PM, Joachim Eastwood wrote:
> Add binding documentation for nxp,lpc1850-usb-otg-phy. This PHY

%s/nxp,lpc1850-usb-otg-phy/NXP LPC18xx/43xx USB OTG PHY
> can found on NXP LPC18xx and LPC43xx devices.

Fix $subject to something like 'dt_bindings: Add NXP LPC18xx/43xx USB OTG PHY 
bindings'
>
> Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   .../bindings/phy/nxp,lpc1850-usb-otg-phy.txt          | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt b/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt
> new file mode 100644
> index 000000000000..3da60ca04a42
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/nxp,lpc1850-usb-otg-phy.txt

phy-lpc18xx-usb-otg.txt?

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
