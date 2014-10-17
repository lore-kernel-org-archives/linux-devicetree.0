From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: socfpga: Add a 3.3V fixed regulator node
Date: Fri, 17 Oct 2014 14:19:59 -0500
Message-ID: <54416BDF.6010204@opensource.altera.com>
References: <1413493413-8041-1-git-send-email-dinguyen@opensource.altera.com>	<1413493413-8041-3-git-send-email-dinguyen@opensource.altera.com> <CAD=FV=V3Ewv7Ns_JD0+gd4J6p3k-N-rmFjkdYQobMgB8m7z6SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=V3Ewv7Ns_JD0+gd4J6p3k-N-rmFjkdYQobMgB8m7z6SA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/17/2014 11:57 AM, Doug Anderson wrote:
> Dinh,
> 
> On Thu, Oct 16, 2014 at 2:03 PM,  <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org> wrote:
>> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>>
>> Without the 3.3V regulator node, the SDMMC driver will give these warnings:
>>
>> dw_mmc ff704000.dwmmc0: No vmmc regulator found
>> dw_mmc ff704000.dwmmc0: No vqmmc regulator found
>>
>> This patch adds the regulator node, and points the SD/MMC to the regulator.
>>
[...]
>>
>> -               dwmmc0@ff704000 {
>> +               mmc0: dwmmc0@ff704000 {
>>                         num-slots = <1>;
>>                         broken-cd;
>>                         bus-width = <4>;
>> @@ -41,4 +41,13 @@
>>                         cpu1-start-addr = <0xffd080c4>;
>>                 };
>>         };
>> +
>> +       regulator_3_3v_hps: fixed_3_3v_hps_regulator@0 {
> 
> nit: no @0 since there is no "reg" (register) under this node.
> 
> nit: usually people don't like "_" in node names.  ...I would probably
> do this but I'm not an expert:
>   regulator_3_3v_hps: hps-regulator {

Ok..will fix up.

> 
> This regulator also looks pretty bogus to me.  Is this really a
> regulator that software has no control over?  It means you can't fully
> reset a card but I guess that's OK.

Yes, this is a generic 3.3V regulator that is used for the 3.3V power
rail for the SOC, and any IP the needs 3.3V.

Schematics are here:
http://www.rocketboards.org/pub/Documentation/AlteraSoCDevelopmentBoard/c5_soc_devkit_c.pdf?t=1365712679

http://www.rocketboards.org/pub/Documentation/ArrowSoCKitEvaluationBoard/SoCKit_RevC.pdf

And right, I don't see anyway to be able to reset the card.

> 
> I'd also expect this regulator to be defined in the same dts / dtsi
> file that it's used in.  Your current patch says "there's a generic
> 3.3V regulator on all boards of the socfpga_arria5 class even if they
> don't use MMC, but the "socfpga_arria5_socdk" uses it for MMC.  Is
> that really true?
> 

yeah...My original patch had the regulator placed in it's appropriate
dts board file, but I saw that as a bit of duplication. I figured that
most people are just copying Altera's devkit schematic, that if a new
board file shows up that has a different controllable regulator, then
the board file can have the new regulator node. Meanwhile, this patch
saves adding an additional regulator node for the existing board files.

The 3.3V is not just used by MMC, but the for all 3.3V peripherals.

Thanks for feedback.

Dinh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
