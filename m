From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] Documentation: fsl-quadspi: Add fsl, ls1012a-qspi
 compatible string
Date: Tue, 13 Dec 2016 15:14:03 -0600
Message-ID: <CAL_Jsq+jp_2m7D=Hv6TRa+1nQZhPis-0MPK5kOAWge_7RvN4Qg@mail.gmail.com>
References: <1481188984-43683-1-git-send-email-yao.yuan@freescale.com>
 <1481188984-43683-6-git-send-email-yao.yuan@freescale.com>
 <20161212170948.fq7v5lva4kgt6hly@rob-hp-laptop> <DB6PR0402MB2902DADEB4E6D06418AD311F899B0@DB6PR0402MB2902.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <DB6PR0402MB2902DADEB4E6D06418AD311F899B0-2mNvjAGDOPmZPt/6Y1Ah+Y3W/0Ik+aLCnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org>
Cc: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 12, 2016 at 8:47 PM, Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org> wrote:
> On Thu, Dec 13, 2016 at 05:23:02PM +0800, Rob Herring wrote:
>> On Thu, Dec 08, 2016 at 05:23:04PM +0800, Yuan Yao wrote:
>> > From: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
>>
>> Same problem in this subject too.
>>
>> >
>> > new compatible string: "fsl,ls1012a-qspi".
>> >
>> > Signed-off-by: Yuan Yao <yao.yuan-3arQi8VN3Tc@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 1 +
>> >  1 file changed, 1 insertion(+)
>>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Thanks for your review.
> And do you have any suggestion for this subject?

The problem is you have a space in the compatible string: "fsl,
ls1012a-qspi" rather than "fsl,ls1012a-qspi"

Also, I prefer "dt/bindings: " as the beginning of binding patch subjects.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
