From: "Simon Arlott" <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: Re: [PATCH 1/3] mtd: brcmnand: Add brcm,bcm6368-nand device tree
 binding
Date: Fri, 4 Dec 2015 21:29:55 -0000
Message-ID: <b3a23d0b4e1e11c9b71848e0345777cd4163f185@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
References: <565F81A6.6060307@simon.arlott.org.uk>
    <CAOiHx=kLrJPfvQUjNiEmvAMVj8v37RMFqaMp=tqzAVe22q+9fQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOiHx=kLrJPfvQUjNiEmvAMVj8v37RMFqaMp=tqzAVe22q+9fQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, December 4, 2015 16:04, Jonas Gorski wrote:
> On Thu, Dec 3, 2015 at 12:41 AM, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org> wrote:
>> +   * "brcm,nand-bcm6368"
>> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm6368"
>> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
>> +       and enable registers, and boot address registers
>> +     - reg-names: (required) "nand-intr-base"
>
> Can't we use the same name as bcm63138, i.e. nand-int-base?

Brian,

Before I change this, is there anything else in the patch series that needs to
be changed?

(I'll keep the comment referring to "NAND_INTR_BASE" the same because that's the name
in the original #define for this hardware.)

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
