From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2 2/2] ARM: vt8500: Add support for UHCI companion controller
Date: Sat, 21 Jul 2012 20:19:00 +0400
Message-ID: <500AD674.9050206@mvista.com>
References: <1342787373-2230-1-git-send-email-linux@prisktech.co.nz> <1342787373-2230-2-git-send-email-linux@prisktech.co.nz> <201207202210.28790.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201207202210.28790.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, vt8500-wm8505-linux-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 21-07-2012 2:10, Arnd Bergmann wrote:

>> +static const struct of_device_id platform_uhci_ids[] = {
>> +	{ .compatible = "of-uhci", },
>> +	{}
>> +};

> The of- part is clearly meaningless in the binding that is about of
> devices. Using usb-uhci would be more appropriate I think, but maybe
> someone can come up with an even better name. Which consortium
> or company created uhci?

    UHCI is Intel's spec.

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
