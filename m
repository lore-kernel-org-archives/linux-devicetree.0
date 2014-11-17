From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Mon, 17 Nov 2014 18:29:18 -0300
Message-ID: <546A68AE.1060407@imgtec.com>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com> <1416237576-21542-2-git-send-email-arul.ramasamy@imgtec.com> <546A189B.3090202@imgtec.com> <546A5445.3020905@imgtec.com> <20141117212917.GH1739@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141117212917.GH1739-4bYivNCBEGTR3KXKvIWQxtm+Uo4AYnCiHZ5vskTnxNA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naidu.tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, jude.abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 11/17/2014 06:29 PM, James Hogan wrote:
> On Mon, Nov 17, 2014 at 05:02:13PM -0300, Ezequiel Garcia wrote:
>> Hi James,
>>
>> On 11/17/2014 12:47 PM, James Hogan wrote:
>>> Hi,
>>>
>>> Some comments below.
>>>
>>> Should this driver live in drivers/misc/fuse?
>>>
>>
>> You might want to take a look at the discussion around Tegra's eFuse
>> driver, which was originally proposed for drivers/misc and then got
>> merged in drivers/soc.
> 
> Thanks, I hadn't spotted that it got merged elsewhere (must've been
> looking at an older versions of the patchset).
> 
> Curiously the tegra commit 783c8f4c84451bc444e314a71b447239c6ef6fd9 did
> add an unused Makefile in drivers/misc/fuse/ ...
> 

And the fix for that is waiting: https://lkml.org/lkml/2014/10/28/848
-- 
Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
