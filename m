Return-Path: <SRS0=7xkd=XJ=gmail.com=marek.vasut@kernel.org>
Subject: Re: [PATCH V2] of: Fix of_empty_ranges_quirk()
References: <20190907161537.27258-1-marek.vasut@gmail.com>
 <CAL_JsqJk40bRhvrtjtpCzhm_jTX=D5pEgWHd8csrVDn77nwWvQ@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d490a735-32f2-5aa4-4782-81c8c2522337@gmail.com>
Date: Sat, 14 Sep 2019 18:00:21 +0200
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJk40bRhvrtjtpCzhm_jTX=D5pEgWHd8csrVDn77nwWvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Frank Rowand <frowand.list@gmail.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 9/9/19 7:37 PM, Rob Herring wrote:
[...]
>>  drivers/of/address.c | 47 ++++++++++++++++++++++++--------------------
>>  1 file changed, 26 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index 978427a9d5e6..df82ef88823f 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -473,21 +473,42 @@ static struct of_bus *of_match_bus(struct device_node *np)
>>         return NULL;
>>  }
>>
>> -static int of_empty_ranges_quirk(struct device_node *np)
>> +static bool of_missing_ranges_is_ok(struct device_node *np)
>>  {
>> +       /*
>> +        * Normally, an absence of a "ranges" property means we are
>> +        * crossing a non-translatable boundary, and thus the addresses
>> +        * below the current cannot be converted to CPU physical ones.
>> +        * Unfortunately, while this is very clear in the spec, it's not
>> +        * what Apple understood, and they do have things like /uni-n or
>> +        * /ht nodes with no "ranges" property and a lot of perfectly
>> +        * useable mapped devices below them. Thus we treat the absence of
>> +        * "ranges" as equivalent to an empty "ranges" property which means
>> +        * a 1:1 translation at that level. It's up to the caller not to try
>> +        * to translate addresses that aren't supposed to be translated in
>> +        * the first place. --BenH.
>> +        *
>> +        * As far as we know, this damage only exists on Apple machines, so
>> +        * This code is only enabled on powerpc.
> 
> You dropped Grant's name on this. Wouldn't matter too much as we can
> run 'git blame', but now we have another level to trace back thru.

I think that's what Frank suggested, since he reworded this message before.

>> +        */
>> +
>>         if (IS_ENABLED(CONFIG_PPC)) {
>>                 /* To save cycles, we cache the result for global "Mac" setting */
>> -               static int quirk_state = -1;
>> +               static int quirk_state_initialized;
> 
> This can be bool too.

Fine

[...]

-- 
Best regards,
Marek Vasut
