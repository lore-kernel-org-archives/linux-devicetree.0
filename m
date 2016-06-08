From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH][RESEND v2] of: add missing const for of_parse_phandle_with_args()
 in !CONFIG_OF
Date: Wed, 8 Jun 2016 08:42:49 -0500
Message-ID: <CAL_JsqJObynzqD1Ezo+7=cP8TPDnd1MDLYyoeE8At9mGsY1tFw@mail.gmail.com>
References: <87mvnfkkps.wl%kuninori.morimoto.gx@renesas.com> <87r3cf7z5a.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87r3cf7z5a.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 2, 2016 at 10:09 PM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> Hi Rob
>
> Should I re-send this patch ?
> It still no response...

Sorry, for the delay. Now applied.

Rob

>
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> commit 93c667ca2598bd84f1bd3f2fa176af69707699fe
>> ("of: *node argument to of_parse_phandle_with_args should be const")
>> changed to const for struct device node *np,
>> but it cares CONFIG_OF case only, !CONFIG_OF case need it too.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> ---
>>  include/linux/of.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> index 7fcb681..4f2ce1b 100644
>> --- a/include/linux/of.h
>> +++ b/include/linux/of.h
>> @@ -585,7 +585,7 @@ static inline struct device_node *of_parse_phandle(const struct device_node *np,
>>       return NULL;
>>  }
>>
>> -static inline int of_parse_phandle_with_args(struct device_node *np,
>> +static inline int of_parse_phandle_with_args(const struct device_node *np,
>>                                            const char *list_name,
>>                                            const char *cells_name,
>>                                            int index,
>> --
>> 1.9.1
>>
