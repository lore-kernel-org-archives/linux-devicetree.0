From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
Date: Wed, 2 Dec 2015 11:38:54 -0800
Message-ID: <CAGVrzcZa2LNcajdnZHgZ2j+2Yj0_0a-7VmtXoBtWwFK2C02CyA@mail.gmail.com>
References: <56506D55.3000907@simon.arlott.org.uk> <20151122215945.GA5930@rob-hp-laptop>
 <56523E85.905@simon.arlott.org.uk> <56523EFF.9050502@simon.arlott.org.uk>
 <56535977.9050201@gmail.com> <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com> <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151202190555.GJ64635@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Simon Arlott <simon@fire.lp0.eu>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu <kdasu.kdev@gmail.com>
List-Id: devicetree@vger.kernel.org

2015-12-02 11:05 GMT-08:00 Brian Norris <computersforpeace@gmail.com>:
> + Broadcom list + Kamal
>
> On Tue, Nov 24, 2015 at 08:19:37PM -0000, Simon Arlott wrote:
>> Add device tree binding for NAND on the BCM63268.
>>
>> The BCM63268 has a NAND interrupt register with combined status and enable
>> registers.
>>
>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>> ---
>>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> index 4ff7128..f2a71c8 100644
>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>> @@ -72,6 +72,14 @@ we define additional 'compatible' properties and associated register resources w
>>         and enable registers
>>       - reg-names: (required) "nand-int-base"
>>
>> +   * "brcm,nand-bcm63268"
>> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
>
> Looks like you're aiming to support bcm63168? Is bcm63268 the first
> chip to include this style of register then? The numbering seems
> backwards, but that may just be reality.

6362 (NAND rev 2.1, ann. Sep 8, 2009), 6368 (v0.1?!?, ann. Jan 7,
2009) and 6328 (v2.1, can't find release date) are earlier chips that
have an identical combined interrupt enable + status register and a
NAND controller within the same 32-bits word, so these would qualify
as a better compatible string for this specific addition integration
stub here. I would gowith 6368 here then?
-- 
Florian
