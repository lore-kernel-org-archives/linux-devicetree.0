From: Alexander Popov <alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] powerpc/512x: add LocalPlus Bus FIFO device driver
Date: Tue, 27 Oct 2015 23:42:57 +0300
Message-ID: <562FE1D1.3010903@linux.com>
References: <1444597682-22181-1-git-send-email-alex.popov@linux.com>
 <56280E66.2040804@linux.com>
 <20151027022231.GF11691@vkoul-mobl.iind.intel.com>
Reply-To: alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151027022231.GF11691-bQVUxfxUtC13uc1i7fC1zK2pdiUAq4bhAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Timur Tabi <timur-N01EOCouUvQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Popov <alex.popov-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27.10.2015 05:22, Vinod Koul wrote:
> On Thu, Oct 22, 2015 at 01:15:03AM +0300, Alexander Popov wrote:
>> On 12.10.2015 00:08, Alexander Popov wrote:
>>> This driver for Freescale MPC512x LocalPlus Bus FIFO (called SCLPC
>>> in the Reference Manual) allows Direct Memory Access transfers
>>> between RAM and peripheral devices on LocalPlus Bus.
>>
>>> Changes in v4:
>>>  - the race condition is fixed;
>>>  - plenty of style fixes are made;
>>>  - devm_* functions and EPROBE_DEFER are used in probe().
>>
>> Hello,
>>
>> I've done my best to fix the issues pointed by Timur Tabi and Vinod Koul.
>> Could I have a feedback please?
> 
> I dont see to have v4 in my list :( Can you please repost

Hello, Vinod

I'm sure I haven't miss your address in the list of the recipients.
Anyway I can repost.

Anatolij Gustschin wrote that he applied v4 with some fix to mpc5xxx/next
some time ago.

So should I repost v4 for everybody? How should I mark the reposted patches?

Best regards,
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
