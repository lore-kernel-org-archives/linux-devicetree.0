From: Florian Fainelli <fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
Date: Wed, 2 Dec 2015 13:44:10 -0800
Message-ID: <565F662A.2060903@broadcom.com>
References: <56506D55.3000907@simon.arlott.org.uk> <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk> <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com> <56541BD3.4070202@simon.arlott.org.uk> <5654AF69.7040901@gmail.com> <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid> <20151202190555.GJ64635@google.com> <CAGVrzcZa2LNcajdnZHgZ2j+2Yj0_0a-7VmtXoBtWwFK2C02CyA@mail.gmail.com> <565F4E63.3030100@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <565F4E63.3030100-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/12/15 12:02, Simon Arlott wrote:
> On 02/12/15 19:38, Florian Fainelli wrote:
>> 2015-12-02 11:05 GMT-08:00 Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>> + Broadcom list + Kamal
>>>
>>> On Tue, Nov 24, 2015 at 08:19:37PM -0000, Simon Arlott wrote:
>>>> Add device tree binding for NAND on the BCM63268.
>>>>
>>>> The BCM63268 has a NAND interrupt register with combined status and enable
>>>> registers.
>>>>
>>>> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
>>>> ---
>>>>  .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 35 ++++++++++++++++++++++
>>>>  1 file changed, 35 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>>>> b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>>>> index 4ff7128..f2a71c8 100644
>>>> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>>>> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
>>>> @@ -72,6 +72,14 @@ we define additional 'compatible' properties and associated register resources w
>>>>         and enable registers
>>>>       - reg-names: (required) "nand-int-base"
>>>>
>>>> +   * "brcm,nand-bcm63268"
>>>> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
>>>
>>> Looks like you're aiming to support bcm63168? Is bcm63268 the first
>>> chip to include this style of register then? The numbering seems
>>> backwards, but that may just be reality.
>>
>> 6362 (NAND rev 2.1, ann. Sep 8, 2009), 6368 (v0.1?!?, ann. Jan 7,
>> 2009) and 6328 (v2.1, can't find release date) are earlier chips that
>> have an identical combined interrupt enable + status register and a
>> NAND controller within the same 32-bits word, so these would qualify
>> as a better compatible string for this specific addition integration
>> stub here. I would gowith 6368 here then?
>>
> 
> I could change it to 6368 but there's no documented NAND_INTR_BASE for
> it. Only the 63268 and 6818 have a #define for NAND_INTR_BASE.
> 

It looks exactly the same as the 63268 layout, and double checking, this
appears to be a v2.1 controller as well, it was not just properly
documented as such.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
