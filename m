From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v4] ARM: l2c: add options to overwrite prefetching behavior
Date: Wed, 10 Jun 2015 21:26:35 +0200
Message-ID: <55788F6B.7060406@hauke-m.de>
References: <1432941541-18588-1-git-send-email-hauke@hauke-m.de> <20150610172100.230c0e71@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150610172100.230c0e71-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?windows-1252?Q?Gregory_Cl=E9me?= =?windows-1252?Q?nt?= <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/10/2015 05:21 PM, Thomas Petazzoni wrote:
> Dear Hauke Mehrtens,
> 
> On Sat, 30 May 2015 01:19:01 +0200, Hauke Mehrtens wrote:
>> These options make it possible to overwrites the data and instruction
>> prefetching behavior of the arm pl310 cache controller.
>>
>> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> 
> This patch would be useful to me. I'll test it tomorrow. Did you submit
> it into the Russell patch tracking system, as Russell suggested to do
> in his reply on your v3 ?
> 
> Russell said:
> 
> """
> I don't see anything wrong with it, but as ever, it needs to end up in
> the patch system if it's not going to get buried beneath a huge pile of
> email.
> """
Thanks for asking, I did not know Russell's patch process, but Florian
guided me and now it is submitted, see
http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=8391/1

Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
