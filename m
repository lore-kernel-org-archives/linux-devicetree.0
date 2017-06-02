From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: Add hi6421v530 bindings
Date: Fri, 2 Jun 2017 17:01:18 +0800
Message-ID: <CAFGCpxzxQfC+mf6Ltjzq=rtk+1C_R2x0+eu3s+zszK58x0OS8Q@mail.gmail.com>
References: <20170526063518.21246-1-guodong.xu@linaro.org> <20170526063518.21246-2-guodong.xu@linaro.org>
 <20170531180755.on4jcgwxpnli3mly@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170531180755.on4jcgwxpnli3mly@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Riku Voipio <riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 1, 2017 at 2:07 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Fri, May 26, 2017 at 02:35:13PM +0800, Guodong Xu wrote:
>> DT bindings for hisilicon HI655x PMIC chip.
>>
>> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../bindings/mfd/hisilicon,hi6421v530.txt          | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt
>> new file mode 100644
>> index 0000000..6ffe6f6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421v530.txt
>> @@ -0,0 +1,25 @@
>> +Hisilicon Hi6421v530 Power Management Integrated Circuit (PMIC)
>> +
>> +The hardware layout for access PMIC Hi6421v530 from AP SoC Hi3660.
>> +Between PMIC Hi6421v530 and Hi3660, the physical signal channel is SSI.
>> +We can use memory-mapped I/O to communicate.
>> +
>> ++----------------+             +-------------+
>> +|                |             |             |
>> +|    Hi3660      |   SSI bus   |  Hi6421v530 |
>> +|                |-------------|             |
>> +|                |(REGMAP_MMIO)|             |
>> ++----------------+             +-------------+
>
> regmap is a Linuxism and should not be part of the binding.
>
> So there some sort of controller that generates SSI packets? based on
> MMIO addresses? That should be more fully described here. For example,
> the PMIC should probably be a child of the controller.

Hi, Rob

Thanks for review. I just sent v2 of this patchset, according to
review comments I got. In v2, I discarded this new binding file.
Actually, I extended the existing
Documentation/devicetree/bindings/mfd/hi6421.txt to make it support
v530. There is no regmap in that.

Yes, there is a controller to generate SSI packets. However that is
completely blind to main SoC. It's more MMIO.

-Guodong
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
