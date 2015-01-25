From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Sun, 25 Jan 2015 17:54:02 +0100
Message-ID: <54C51FAA.4080300@gmail.com>
References: <1421687701-5667-1-git-send-email-kaloz@openwrt.org> <20150119182113.GH32663@lunn.ch> <op.xsrcplz12s3iss@ecaz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <op.xsrcplz12s3iss@ecaz>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 20.01.2015 11:57, Imre Kaloz wrote:
> On Mon, 19 Jan 2015 19:21:13 +0100, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
>> Thanks for the v2. I have a few comments, and some points we will need
>> to discuss.
[...]
>>> +    model = "Linksys WRT1900AC (Mamba)";
>>> +    compatible = "linksys,mamba", "marvell,armadaxp-mv78230",
>>> +             "marvell,armadaxp", "marvell,armada-370-xp";
>>
>> So this is where the discussion starts. I don't like Mamba being so
>> prominent. As far as i understand, Mamba is the board, not the device.
>> In theory, another device could be created using the same board as a
>> basis, but with different PCIe cards, etc. At that point, i would
>> suggest refactoring the common parts out into a
>> armada-xp-linksys-mamba.dtsi which is then included into any device
>> .dts file using the Mamba board.
>>
>> This file describes the device. So i would prefer it to be called
>> armada-xp-linksys-wrt1900ac.dts. The first compatible should be
>> "linksys,wrt1900ac". Having "linksys,mamba" second is O.K.
>
> I would like to ask for others' opinion for multiple reasons, and would
> decide in v3 based on that.
>
> - The device is called the "mamba", the marketing name is the WRT1900AC.
> As history showed, it's perfectly possible that exactly the same device
> go on the market under a different name. The E4200v2 is the same device
> as the EA4500, with a different factory firmware. There the name of the
> device is "viper".

If there is a good reason to have "mamba" in the chain of compatibles
and "mamba" is the name of the platform/reference design, the compatible
for this very board should look like this:

compatible = "linksys,wrt1900ac", "linksys,mamba",
    "marvell,armadaxp-mv78230", "marvell,armadaxp",
    "marvell,armada-370-xp";

That way you can have wrt1900ac specific stuff captured before the
more generic mamba platform.

> - OpenWrt is the only firmware/stack other than the official one and
> people already know this device as "mamba".
>
> - Let's say the same device gets released under the same name or just
> the radios change - so no redesign takes place at all. In my opinion
> that hardly justifies adding multiple .dts files just to change the name
> of the LEDs to reflect that. I think people who want to run mainline on
> their device wouldn't be concerned about seeing a codename, but on the
> other hand we could receive patches to "correct" the marketing name in
> the LEDs.

As soon as you'll discover another "mamba"-based device, you can
split-off the common stuff into a linksys-mamba.dtsi and include it
into each of the two device dts files.

Right now, I'd suggest to have just a single linksys-wrt1900ac.dts.

[...]

>>> +
>>> +        power {
>>> +            label = "mamba:white:power";
>>
>> Please replace this mamba with wrt1900ac. It is a property of the
>> device, not the board. Another device using the mamba board may use it
>> differently.
>>
>
> See above.

The LED should be named by the device, not the platform. If OpenWRT
userspace already expects "mamba" in here, I guess we are stuck with
it. If not, call it "wrt1900ac:white:power".

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
