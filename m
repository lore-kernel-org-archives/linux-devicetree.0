From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH_V4 1/3] dt: usb: jz4740: Add DT binding document for OHCI
Date: Tue, 03 Feb 2015 11:32:36 +0100
Message-ID: <54D0A3C4.6010100@metafoo.de>
References: <1422958640-25723-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1422958640-25723-2-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422958640-25723-2-git-send-email-Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/03/2015 11:17 AM, Zubair Lutfullah Kakakhel wrote:
[...]
> V4 Changes
> Removed clock binding because of pending work in clock tree. Will add
> binding later. Rather than introduce a bad binding now and change later.

But this patch is introducing a bad binding. The part needs the clock to 
work. The binding you are specifying right now says that it works fine 
without any clocks.

 > [...]
> +Example for jz4740:
> +
> +/ {
> +	ohci: jz4780-ohci@0x134a0000 {

s/jz4780/jz4740

> +		compatible = "ingenic,jz4740-ohci";
> +		reg = <0x134a0000 0x10000>;
> +
> +		interrupts = <5>;
> +	};
> +};
> +
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
