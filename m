From: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
Date: Wed, 2 Dec 2015 20:36:33 +0100
Message-ID: <CAOiHx=mUSmDB_KQNpyksc93D+RKBbR8cwas_DsTPL8H34dxz6g@mail.gmail.com>
References: <56506D55.3000907@simon.arlott.org.uk> <20151122215945.GA5930@rob-hp-laptop>
 <56523E85.905@simon.arlott.org.uk> <56523EFF.9050502@simon.arlott.org.uk>
 <56535977.9050201@gmail.com> <56541BD3.4070202@simon.arlott.org.uk>
 <5654AF69.7040901@gmail.com> <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151202190555.GJ64635-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 2, 2015 at 8:05 PM, Brian Norris
<computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> + Broadcom list + Kamal
>
> On Tue, Nov 24, 2015 at 08:19:37PM -0000, Simon Arlott wrote:
>> Add device tree binding for NAND on the BCM63268.
>>
>> The BCM63268 has a NAND interrupt register with combined status and enable
>> registers.
>>
>> Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
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

There are four chip variants, bcm63168, bcm63268, bcm63169 and
bcm63269, and they were all introduced at the same time. the *16x have
less features than *26x (IIRC only two rgmii ports instead of four, no
hw crypto, maybe no dect?), and the *9 ones have no xDSL support.

>From a registers location/layout, clocks, etc standpoint, there is no
difference between bcm63168 and bcm63268 (and the x9's).

As a reference, Broadcom uses bcm63268 as the "generic" name for the
chip family in their code, but on their website only advertise the
bcm63168. Both chips do exist though, and at least the bcm63169, I
have devices with these three here.


Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
