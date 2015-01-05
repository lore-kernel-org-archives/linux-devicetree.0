From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/9] ARM Versatile multi-platform support
Date: Mon, 5 Jan 2015 10:08:18 +0000
Message-ID: <CAFEAcA8Nq6BPOerN7EhHpT_oa9W3+2Y_=5+zBuQD_c5fh0Yb1A@mail.gmail.com>
References: <1419967718-26909-1-git-send-email-robherring2@gmail.com>
 <CAFEAcA9pKdRNQ-fgKumQhjTjei-4NJ-OB1gSOxTCnCjShy10jw@mail.gmail.com> <54AA5E7C.1040706@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54AA5E7C.1040706-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 5 January 2015 at 09:50, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> On 31/12/14 09:25, Peter Maydell wrote:
>> Will Deacon and Marc Zyngier are currently in possession of that h/w.
>> I'm sure they'd be delighted to pull it out of the cupboard and
>> give it a spin :-)
>
> I'll try to find some time (or a victim to do the testing... ;-)

To save you some time in trying to debug things which didn't work
before this patchset, the status last time I tested on h/w was:
 * PCI MMIO accesses work
 * PCI IO accesses work
 * PCI bus-master (DMA) doesn't work

with the failure symptom for DMA being that the card wrote to
the correct area of memory but only every other word, so you
got strings like "HellXXXXrld" with the Xs being garbage.
This feels to me like a h/w issue rather than a driver problem.

-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
