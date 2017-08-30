From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] [media] v4l: vsp1: Use generic node name
Date: Wed, 30 Aug 2017 12:22:17 +0200
Message-ID: <CAMuHMdWy6kmO-zb7h6JRH-jScNhj5DU_8uFEZEVMqg-QU2mh6g@mail.gmail.com>
References: <1504087051-5449-1-git-send-email-geert+renesas@glider.be> <1912736.Rz1RIKoiZO@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1912736.Rz1RIKoiZO@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

On Wed, Aug 30, 2017 at 12:10 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wednesday, 30 August 2017 12:57:31 EEST Geert Uytterhoeven wrote:
>> Use the preferred generic node name in the example.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>>  Documentation/devicetree/bindings/media/renesas,vsp1.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.txt
>> b/Documentation/devicetree/bindings/media/renesas,vsp1.txt index
>> 9b695bcbf2190bdd..16427017cb45561e 100644
>> --- a/Documentation/devicetree/bindings/media/renesas,vsp1.txt
>> +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.txt
>> @@ -22,7 +22,7 @@ Optional properties:
>>
>>  Example: R8A7790 (R-Car H2) VSP1-S node
>>
>> -     vsp1@fe928000 {
>> +     vsp@fe928000 {
>
> vsp1 isn't an instance name but an IP core name.

I know (cfr. "preferred generic node name", not "numerical suffix").

For the actual DTSes on R-Car Gen3, we settled on the more generic "vsp"
for the vsp2 node names.

R-Car Gen2 DTSes still use "vsp1".

>>               compatible = "renesas,vsp1";
>>               reg = <0 0xfe928000 0 0x8000>;
>>               interrupts = <0 267 IRQ_TYPE_LEVEL_HIGH>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
