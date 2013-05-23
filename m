From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] USB: gadget: atmel_usba: move global struct usba_ep
 usba_ep to struct usba_udc
Date: Thu, 23 May 2013 12:22:32 +0200
Message-ID: <519DEDE8.3040503@atmel.com>
References: <20130520162149.GC9937@game.jcrosoft.org> <1369067160-3230-1-git-send-email-plagnioj@jcrosoft.com> <519D7D9F.1070109@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519D7D9F.1070109-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/05/2013 04:23, Bo Shen :
> Hi J,
>
> On 5/21/2013 00:25, Jean-Christophe PLAGNIOL-VILLARD wrote:
>> so we can have multiple usb gadget instance
>>
>> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
>> Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>
> For this series, test OK on at91sam9m10g45ek and at91sam9x5ek board
> Tested-by: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

After reading this v4 series, it seems good. So, on the whole series:

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

> PS: When do testing, we need build in or choose as module: "Device
> Drivers ---> Generic Target Core Mod (TCM) and ConfigFS infrastructure"

Thanks a lot to you, Bo and Jean-Christophe.

Bye,
-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
