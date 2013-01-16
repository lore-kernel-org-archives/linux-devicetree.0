From: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] arm: mvebu: Enable USB controllers on Armada XP
 OpenBlocks AX3-4 board
Date: Wed, 16 Jan 2013 16:16:59 -0300
Message-ID: <CALF0-+XKGk+ru3VZ6815KTu_Aj_daYafr+Y5WJ9dXUoFqbTHOQ@mail.gmail.com>
References: <1358243670-11935-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<1358243670-11935-5-git-send-email-ezequiel.garcia@free-electrons.com>
	<CABMQnVLD+VKj53dfQC24AwCboed3EGt+gqTKt-B9q8nhEx3Ytg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABMQnVLD+VKj53dfQC24AwCboed3EGt+gqTKt-B9q8nhEx3Ytg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
Cc: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Nobuhiro,

On Tue, Jan 15, 2013 at 9:01 PM, Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org> wrote:
> Hi,
>
>
>
> On Tue, Jan 15, 2013 at 6:54 PM, Ezequiel Garcia
> <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts |    9 +++++++++
>>  1 files changed, 9 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
>> index b24644f..55f5b6f 100644
>> --- a/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
>> +++ b/arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts
>> @@ -127,5 +127,14 @@
>>                         nr-ports = <2>;
>>                         status = "okay";
>>                 };
>> +               usb@d0050000 {
>> +                       status = "okay";
>> +               };
>> +               usb@d0051000 {
>> +                       status = "okay";
>> +               };
>> +               usb@d0052000 {
>> +                       status = "okay";
>> +               };
> USB2 of openblocks-ax3-4 is used as Mini-PCIE.
> I think this is unnecessary.
>

Mmm... could you explain this with some more detail.
Unfortunately, I don't have access to an Openblocks board to check on this,
so I'd appreciate any clarification.

Is there any Openblocks datasheet or hardware schematics publicly
available for me to look at?

Thanks a lot,

-- 
    Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
