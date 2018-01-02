From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] nvmem: add driver for JZ4780 efuse
Date: Tue, 2 Jan 2018 21:47:53 +0530
Message-ID: <CANc+2y7_Bx7APkD2pDEQUT9cJqXEUCPkDQuzO_GP1qENabnNeQ@mail.gmail.com>
References: <20171228212954.2922-1-malat@debian.org> <20171228212954.2922-2-malat@debian.org>
 <3ec9ddab-f855-8c39-4d75-d35be7bd6731@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3ec9ddab-f855-8c39-4d75-d35be7bd6731-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Marcin Nowakowski <marcin.nowakowski-8NJIiSa5LzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Zubair.Kakakhel-8NJIiSa5LzA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Srini,

On 2 January 2018 at 17:32, Srinivas Kandagatla
<srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>
> On 28/12/17 21:29, Mathieu Malaterre wrote:
>>
>> From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> This patch brings support for the JZ4780 efuse. Currently it only expose
>> a read only access to the entire 8K bits efuse memory.
>>
>> Tested-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>> ---
>
> Please split this patch, as you are mixing code, documentation, dts and
> MAINTAINER changes here.
>
> Without which patch can not be reviewed!!

Sure, will do it soon.

>
> Thanks,
> Srini
>
>>   .../ABI/testing/sysfs-driver-jz4780-efuse          |  16 ++
>
>
>>   .../bindings/nvmem/ingenic,jz4780-efuse.txt        |  17 ++
>>   MAINTAINERS                                        |   5 +
>>   arch/mips/boot/dts/ingenic/jz4780.dtsi             |  40 ++-
>>   drivers/nvmem/Kconfig                              |  10 +
>>   drivers/nvmem/Makefile                             |   2 +
>>   drivers/nvmem/jz4780-efuse.c                       | 305
>> +++++++++++++++++++++
>>   7 files changed, 383 insertions(+), 12 deletions(-)
>
> ...

Regards,
PrasannaKumar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
