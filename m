From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: mfd: hi6421: Add hi6421v530
 compatible string
Date: Mon, 5 Jun 2017 17:03:55 +0800
Message-ID: <CAFGCpxywcinia_eD4wFGrswt6vPoVYAbiTwpUj9mWv0XbmCZNA@mail.gmail.com>
References: <20170602105156.11351-1-guodong.xu@linaro.org> <20170602105156.11351-2-guodong.xu@linaro.org>
 <20170605081451.d7pd6r7aeza54pgv@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170605081451.d7pd6r7aeza54pgv@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Riku Voipio <riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 5, 2017 at 4:14 PM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, 02 Jun 2017, Guodong Xu wrote:
>
>> Add compatible string for HiSilicon Hi6421v530 PMIC.
>>
>> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/hi6421.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>

Thanks Lee.

>> diff --git a/Documentation/devicetree/bindings/mfd/hi6421.txt b/Document=
ation/devicetree/bindings/mfd/hi6421.txt
>> index 0d5a446..22da96d 100644
>> --- a/Documentation/devicetree/bindings/mfd/hi6421.txt
>> +++ b/Documentation/devicetree/bindings/mfd/hi6421.txt
>> @@ -1,7 +1,9 @@
>>  * HI6421 Multi-Functional Device (MFD), by HiSilicon Ltd.
>>
>>  Required parent device properties:
>> -- compatible : contains "hisilicon,hi6421-pmic";
>> +- compatible    : One of the following chip-specific strings:
>> +     "hisilicon,hi6421-pmic";
>> +     "hisilicon,hi6421v530-pmic";
>>  - reg                : register range space of hi6421;
>>
>>  Supported Hi6421 sub-devices include:
>
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
