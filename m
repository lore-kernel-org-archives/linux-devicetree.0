From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH 2/4] dt-bindings: Update Renesas R-Car FCP DT binding
Date: Mon, 30 May 2016 11:04:03 +0100
Message-ID: <574C1013.7000804@bingham.xyz>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
 <1464369565-12259-4-git-send-email-kieran@bingham.xyz>
 <CAMuHMdUhv24QWE44k-nHTAkfy_EnDv76toUuOoD46pKNNR3r3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUhv24QWE44k-nHTAkfy_EnDv76toUuOoD46pKNNR3r3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Kieran Bingham <kieran@ksquared.org.uk>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert!

On 28/05/16 20:06, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Fri, May 27, 2016 at 7:19 PM, Kieran Bingham <kieran@ksquared.org.uk> wrote:
>> The FCP driver, can also support the FCPF variant for FDP1 compatible
>> processing.
>>
>> Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
> 
> Thanks for your patch!
> 
>> ---
>>  Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> Cc: devicetree@vger.kernel.org
>>
>> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
>> index 6a12960609d8..1c0718b501ef 100644
>> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
>> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
>> @@ -7,11 +7,12 @@ conversion of AXI transactions in order to reduce the memory bandwidth.
>>
>>  There are three types of FCP: FCP for Codec (FCPC), FCP for VSP (FCPV) and FCP
>>  for FDP (FCPF). Their configuration and behaviour depend on the module they
>> -are paired with. These DT bindings currently support the FCPV only.
>> +are paired with. These DT bindings currently support the FCPV and FCPF.
>>
>>   - compatible: Must be one or more of the following
>>
>>     - "renesas,r8a7795-fcpv" for R8A7795 (R-Car H3) compatible 'FCP for VSP'
>> +   - "renesas,r8a7795-fcpf" for R8A7795 (R-Car H3) compatible 'FCP for FDP'
>>     - "renesas,fcpv" for generic compatible 'FCP for VSP'
> 
> I guess checkpatch complained about your dtsi additions because you forgot
> to add  "renesas,fcpf" here?

Yes. Looks quite obvious doesn't it :)
I thought CP.pl was complaining because the file was renesas,fcp.txt,
and I was adding in fcpf!.

I was clearly a bit too keen to get those patches out on a friday
evening. I must remember that I'm not smarter than checkpatch!

I'll add the missing line :)

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

-- 
Regards

Kieran Bingham
