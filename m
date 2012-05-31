From: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: mmp: support DT in irq
Date: Wed, 30 May 2012 23:23:37 -0400
Message-ID: <87vcjdm3t2.fsf@laptop.org>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <1335515957-1798-4-git-send-email-haojian.zhuang@gmail.com>
 <87ehq1tq5w.fsf@laptop.org>
 <CAN1soZz2=NcadK1kD6d9t92G6Xdfn=TPGP5_ngwX_fGj+QhOVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAN1soZz2=NcadK1kD6d9t92G6Xdfn=TPGP5_ngwX_fGj+QhOVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 (Haojian Zhuang's message of "Thu, 31 May 2012 11:07:52 +0800")
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, May 30 2012, Haojian Zhuang wrote:
>> Did you test non-DT boot with these changes?
>>
> I tested non-DT boot on my brownstone board on TTC dkb board.

Thanks.  Do you know how/where cascade_irq gets set on that board?

> It seems that you meet issue in icu_mux_irq_demux(). Could you give me
> the detail which interrupt is running while you meet the error?

It was IRQ 17 (TWSI).

> By the way, do you have the boot log?

I'll send it tomorrow when I get back to work.

Thanks,

- Chris.
-- 
Chris Ball   <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>   <http://printf.net/>
One Laptop Per Child
