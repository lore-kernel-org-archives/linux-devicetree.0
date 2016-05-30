From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH 3/4] dt-bindings: Document Renesas R-Car FCP power-domains
 usage
Date: Mon, 30 May 2016 11:09:12 +0100
Message-ID: <574C1148.5070708@bingham.xyz>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
 <1464369565-12259-5-git-send-email-kieran@bingham.xyz>
 <CAMuHMdUvRN2ysYJ9g0daOD8sD7O5XcrZkKbWr0X_L7mG25Ocww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUvRN2ysYJ9g0daOD8sD7O5XcrZkKbWr0X_L7mG25Ocww@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 28/05/16 20:03, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Fri, May 27, 2016 at 7:19 PM, Kieran Bingham <kieran@ksquared.org.uk> wrote:
>> The example misses the power-domains usage, and documentation that the
>> property is used by the node.
>>
>> Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
> 
> Thanks for your patch!
> 
>> ---
>>  Documentation/devicetree/bindings/media/renesas,fcp.txt | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.txt b/Documentation/devicetree/bindings/media/renesas,fcp.txt
>> index 1c0718b501ef..464bb7ae4b92 100644
>> --- a/Documentation/devicetree/bindings/media/renesas,fcp.txt
>> +++ b/Documentation/devicetree/bindings/media/renesas,fcp.txt
>> @@ -21,6 +21,8 @@ are paired with. These DT bindings currently support the FCPV and FCPF.
>>
>>   - reg: the register base and size for the device registers
>>   - clocks: Reference to the functional clock
>> + - power-domains : power-domain property defined with a phandle
>> +                           to respective power domain.
> 
> I'd write "power domain specifier" instead of "phandle". While SYSC on R-Car
> Gen3 uses #power-domain-cells = 0, the FCP module may show up on another
> SoC that uses a different value, needing more than just a phandle.
> 
> In fact I'm inclined to leave out the power-domains property completely:
> it's not a feature of the FCP, but of the SoC the FCP is part of.
> power-domains properties may appear in any device node where needed.

I'm happy to just drop this part. It was mainly the addition to the
example I was after, as I had followed the example, and thus missed the
power-domain setting.

>>  Device node example
>> @@ -30,4 +32,5 @@ Device node example
>>                 compatible = "renesas,r8a7795-fcpv", "renesas,fcpv";
>>                 reg = <0 0xfea2f000 0 0x200>;
>>                 clocks = <&cpg CPG_MOD 602>;
>> +               power-domains = <&sysc R8A7795_PD_A3VP>;
> 
> Adding it to the example doesn't hurt, though.

Ok, I'll adjust and just keep the example in v2.

-- 
Regards

Kieran Bingham
