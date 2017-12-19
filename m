From: Ludovic BARRE <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH V2 9/9] ARM: dts: stm32: add initial support of
 stm32mp157c eval board
Date: Tue, 19 Dec 2017 09:45:50 +0100
Message-ID: <769a6837-2e52-418c-34d9-47abee216029@st.com>
References: <1513610272-7824-1-git-send-email-ludovic.Barre@st.com>
 <1513610272-7824-10-git-send-email-ludovic.Barre@st.com>
 <CAK8P3a14KzxGK8j75UUBfWgexg2fdzrtdgcqUT=uHfjWrVaWbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a14KzxGK8j75UUBfWgexg2fdzrtdgcqUT=uHfjWrVaWbA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Gerald Baeza <gerald.baeza-qxv4g6HH51o@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/18/2017 09:20 PM, Arnd Bergmann wrote:
> On Mon, Dec 18, 2017 at 4:17 PM, Ludovic Barre <ludovic.Barre-qxv4g6HH51o@public.gmane.org> wrote:
> =
>> +
>> +/ {
>> +       model = "STMicroelectronics STM32MP157C eval daughter";
>> +       compatible = "st,stm32mp157c-ed1", "st,stm32mp157";
>> +
>> +       chosen {
>> +               bootargs = "earlyprintk console=ttySTM3,115200 root=/dev/ram";
>> +               stdout-path = "serial3:115200n8";
>> +       };
> 
> I'd remove the bootargs here and let the boot loader take care of
> that, in particular
> since all three arguments are rather old-school: earlycon is preferred over
> earlyprintk, console= should not be needed if you set stdout-path, and
> /dev/ram is obsoleted by initramfs.
OK, thanks

BR
Ludo

> 
>          Arnd
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
