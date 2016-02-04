From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 0/5] mtd: atmel_nand: Add support for NAND Flash on SAMA5D2
Date: Thu, 4 Feb 2016 15:43:45 +0100
Message-ID: <CAGkQfmMVeM+xHqP=2izZ5Xufu+8R=Q_BTwUpXnhOz4o6LV4JQw@mail.gmail.com>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com> <20160204143340.1ffa2292@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160204143340.1ffa2292@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Boris,

2016-02-04 14:33 GMT+01:00 Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
> Hi Romain,
>
> Just a remark that is not directly related to your work: when people
> take the time to review your work, try to keep them in Cc of the
> following versions of your patchset.
>
OK. I'll keep it in mind for my next submission.

> On Mon,  1 Feb 2016 11:25:55 +0100
> Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> The NAND Flash controller for SAMA5D2 has small differences that make it
>> impossible to use the existing driver for SAMA5D3. This patchset uses the
>> device tree's compatible string to get those differences, and the code is
>> slightly modified to handle them.
>>
>> Base on linux-mtd-next, commit 15c0be7bec002f9a529dd0966d0db96dde176fd0
>>
>> See previous revisions to apply on the Atmel Linux 4.1 branch.
>>
>> Compile tested for sama5_defconfig, and tested on SAMA5D3xek as there is no
>> existing SAMA5D2 board with NAND Flash memory (yet).
>
> Overall, it looks good to me (even if I don't fully agree on how you
> decided to define NFC_SR_RB_EDGEX values :-P, but that's just a
> nitpick).
>
> Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>

Thanks for your review.

Best regards,
-- 
Romain Izard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
