From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Mon, 17 Nov 2014 16:26:53 -0800
Message-ID: <CAL1qeaHSevOJ-o=nFqgze8utMgTk-Mh7Y9uRMa6wnjeofji98w@mail.gmail.com>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com>
	<1416237576-21542-2-git-send-email-arul.ramasamy@imgtec.com>
	<546A189B.3090202@imgtec.com>
	<27E62D98F903554192E3C13AFCC91C3C2F506FE2@hbmail01.hb.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <27E62D98F903554192E3C13AFCC91C3C2F506FE2-C8yLA94LPOy3snIXRfWIHVBRoQTxkR7k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Naidu,

On Mon, Nov 17, 2014 at 4:12 PM, Naidu Tellapati
<Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> Hi Andrew,
>
> (We will respond to James Hogan's remaining review comments in a separate email)
>
>>>
>>> +obj-$(CONFIG_SOC_IMG)           += pistachio/
>
>> What is CONFIG_SOC_IMG? It sounds very generic.
>
> May I have your suggestions on the above.
>
> (Assuming we create drivers/soc/img/ instead of drivers/soc/pistachio/)

I don't have much visibility into ImgTec SoCs other than Pistachio,
but I think introducing a SOC_IMG Kconfig symbol is a good idea as it
gives drivers for various pieces of IP present on ImgTec SoCs
(watchdog, I2C, DMA, etc.) a more specific dependency than say MIPS or
METAG.  Maybe James has a suggestion for how to deal with this?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
