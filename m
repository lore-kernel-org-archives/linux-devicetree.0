From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv4 2/2] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Fri, 20 Oct 2017 18:45:06 +0200
Message-ID: <CACRpkdZXaTk-+LMcV8bZTg0bZ9cPxORHpXNL7m+bwnvr57yJ9A@mail.gmail.com>
References: <AM5PR0701MB26576FCB30CDCA6F989C9B80E4420@AM5PR0701MB2657.eurprd07.prod.outlook.com>
 <CACRpkdaSQRuEEpUC2=Z8K80vrrqbSfoCU4YUNJR+9vBXUgWRyA@mail.gmail.com> <AM5PR0701MB26571DEDBDEA72B54DC1E7F6E4430@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AM5PR0701MB26571DEDBDEA72B54DC1E7F6E4430-drxRBzqxKr3KnPtvPVqCtTMcllmSiLMWnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bernd Edlinger <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 20, 2017 at 4:40 PM, Bernd Edlinger
<bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org> wrote:
> On 10/20/17 10:10, Linus Walleij wrote:

>>> +       err = bgpio_init(&port->bgc, gpio->dev, 4, dat, NULL, NULL,
>>> +                        NULL, NULL, 0);
>>
>> But all you add is input-only GPIO chips. Also for the output ports.
>>
>
> Well actually this allows both input and output,
> but while the input port could be written by accident,
> the hardware does the right thing and ignores the write cycle.
>
> The other parameters of bgpio_input are for devices with
> explicit set- and reset-signals, and configurable
> output-direction etc, which I don't have.

Ah! You're right. With just one register it becomes one of these that
read and write into that register, simply. Sorry for my ignorance.

I would prefer if you set the flag BGPIOF_NO_OUTPUT on the input
only version though. Semantics may matter to the mmio gpio core.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
