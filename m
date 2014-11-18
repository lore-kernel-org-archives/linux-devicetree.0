From: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Tue, 18 Nov 2014 00:12:16 +0000
Message-ID: <27E62D98F903554192E3C13AFCC91C3C2F506FE2@hbmail01.hb.imgtec.org>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com>
 <1416237576-21542-2-git-send-email-arul.ramasamy@imgtec.com>,<546A189B.3090202@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546A189B.3090202-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jude Abraham <Jude.Abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

(We will respond to James Hogan's remaining review comments in a separate email)

>>
>> +obj-$(CONFIG_SOC_IMG)           += pistachio/

> What is CONFIG_SOC_IMG? It sounds very generic.

May I have your suggestions on the above.

(Assuming we create drivers/soc/img/ instead of drivers/soc/pistachio/)


>>  obj-$(CONFIG_ARCH_QCOM)              += qcom/
>>  obj-$(CONFIG_ARCH_TEGRA)     += tegra/
>>  obj-$(CONFIG_SOC_TI)         += ti/
>> diff --git a/drivers/soc/pistachio/Makefile b/drivers/soc/pistachio/Makefile
>> new file mode 100644
>> index 0000000..4d50c94

> Cheers
> James


Regards,
Naidu.--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
