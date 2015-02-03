From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH_V4 1/3] dt: usb: jz4740: Add DT binding document for OHCI
Date: Tue, 03 Feb 2015 16:13:11 +0100
Message-ID: <54D0E587.3060001@metafoo.de>
References: <1422958640-25723-1-git-send-email-Zubair.Kakakhel@imgtec.com> <1422958640-25723-2-git-send-email-Zubair.Kakakhel@imgtec.com> <54D0A3C4.6010100@metafoo.de> <54D0A8A6.5040805@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D0A8A6.5040805-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/03/2015 11:53 AM, Zubair Lutfullah Kakakhel wrote:
>
> On 03/02/15 10:32, Lars-Peter Clausen wrote:
>> On 02/03/2015 11:17 AM, Zubair Lutfullah Kakakhel wrote:
>> [...]
>>> V4 Changes
>>> Removed clock binding because of pending work in clock tree. Will add
>>> binding later. Rather than introduce a bad binding now and change later.
>>
>> But this patch is introducing a bad binding. The part needs the clock to work. The binding you are specifying right now says that it works fine without any clocks.
>
> Facing a chicken and egg problem with these patches here..
>
> When the new clock driver gets in we can add the correct clock binding and replace
> devm_clk_get(&pdev->dev, "uhc"); with devm_clk_get(&pdev->dev, NULL);
>
> Specifying the current binding got NAKed by Arnd who mentioned that clock names shouldn't be needed as required properties.
> And even if needed, then it shouldn't be "uhc" and more close to what other ohci drivers have.

It's not a chicken and egg problem. The order is very clear, first convert 
the clock driver to the CCF, then update the driver to pass NULL instead of 
"uhc", then add the devicetree bindings.

- Lars

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
