From: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] arm: boot: dts: build keystone devicetree blob
Date: Fri, 21 Mar 2014 10:40:00 -0400
Message-ID: <532C4F40.5010903@ti.com>
References: <1394639330-1288-1-git-send-email-balbi@ti.com> <53208CDD.7030106@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53208CDD.7030106-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM Kernel Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 12 March 2014 12:35 PM, Santosh Shilimkar wrote:
> On Wednesday 12 March 2014 11:48 PM, Felipe Balbi wrote:
>> Currently, even when building keystone only
>> kernel builds, DTB won't get build because
>> we lack a Makefile rule to get it compiled.
>>
>> This patch adds that rule so mainline kernel
>> users have a chance to use up-to-date DTB on
>> keystone 2 platforms.
>>
>> Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
>> ---
>>
> We have been building dtbs with explicit command
> instead of dtbs since it was just one dtb so far
> supported. Was planning to add the rule once more
> boards get added. Now with Lamarr and Edision in
> for next merge window, will do that post 3.15-rc1.
> 
Just to close the loop, I added a patch as part
of my 3.15 fixes which builds all keystone dt
blobs.

Regards,
Santosh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
