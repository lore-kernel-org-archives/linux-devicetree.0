From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: shmobile: Document Renesas H2-based Stout DT
 bindings
Date: Thu, 15 Feb 2018 10:21:43 +0100
Message-ID: <92474baf-d237-dbf3-d8cb-b1c74064f3e3@gmail.com>
References: <20180213232916.31470-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdUtVkBPwYKzhEh0WObyMdJs4nk2a2UJ+hHT7cztM62_tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUtVkBPwYKzhEh0WObyMdJs4nk2a2UJ+hHT7cztM62_tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/14/2018 09:16 AM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Wed, Feb 14, 2018 at 12:29 AM, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Document the Renesas H2 Stout (ADAS Starter Kit) device tree bindings,
> 
> Thanks for your patch!
> 
> According to https://elinux.org/images/1/10/StoutTopWithLabels.png,
> it's called "ADAS Starterkit".
> 
>> listing it as a supported board.
>>
>> This allows to use checkpatch.pl to validate .dts files referring to
>> the Stout board.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> 
>> Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> Cc: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
>> Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
>> Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
>> index 41d3920aaa5e..bf9bb6eda4a6 100644
>> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
>> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
>> @@ -94,6 +94,8 @@ Boards:
>>      compatible = "renesas,kzm9g", "renesas,sh73a0"
>>    - Lager (RTP0RC7790SEB00010S)
>>      compatible = "renesas,lager", "renesas,r8a7790"
>> +  - Stout (Y-R-CAR-ADAS-SKH2-BOARD)
> 
> Please keep the list alphabetically sorted.
> 
> I'd add "ADAS Starterkit" here, too, cfr. M3ULCB below.

OK

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
