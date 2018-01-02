From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] nvmem: add driver for JZ4780 efuse
Date: Tue, 2 Jan 2018 12:02:10 +0000
Message-ID: <3ec9ddab-f855-8c39-4d75-d35be7bd6731@linaro.org>
References: <20171228212954.2922-1-malat@debian.org>
 <20171228212954.2922-2-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171228212954.2922-2-malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Marcin Nowakowski <marcin.nowakowski-8NJIiSa5LzA@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Zubair.Kakakhel-8NJIiSa5LzA@public.gmane.org, PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 28/12/17 21:29, Mathieu Malaterre wrote:
> From: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This patch brings support for the JZ4780 efuse. Currently it only expose
> a read only access to the entire 8K bits efuse memory.
> 
> Tested-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> ---
Please split this patch, as you are mixing code, documentation, dts and 
MAINTAINER changes here.

Without which patch can not be reviewed!!


Thanks,
Srini

>   .../ABI/testing/sysfs-driver-jz4780-efuse          |  16 ++

>   .../bindings/nvmem/ingenic,jz4780-efuse.txt        |  17 ++
>   MAINTAINERS                                        |   5 +
>   arch/mips/boot/dts/ingenic/jz4780.dtsi             |  40 ++-
>   drivers/nvmem/Kconfig                              |  10 +
>   drivers/nvmem/Makefile                             |   2 +
>   drivers/nvmem/jz4780-efuse.c                       | 305 +++++++++++++++++++++
>   7 files changed, 383 insertions(+), 12 deletions(-)
...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
