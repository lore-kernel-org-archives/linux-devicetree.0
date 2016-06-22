From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v5 3/7] phy: Add set_mode callback
Date: Wed, 22 Jun 2016 12:00:28 -0500
Message-ID: <576AC42C.5040903@lechnology.com>
References: <1462837203-12125-1-git-send-email-david@lechnology.com>
 <1462837203-12125-4-git-send-email-david@lechnology.com>
 <576A28BF.4040805@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <576A28BF.4040805-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, nsekhar-l0cyMroinI0@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/22/2016 12:57 AM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Tuesday 10 May 2016 05:09 AM, David Lechner wrote:
>> The initial use for this is for PHYs that have a mode related to USB OTG.
>> There are several SoCs (e.g. TI OMAP and DA8xx) that have a mode setting
>> in the USB PHY to override OTG VBUS and ID signals.
>>
>> Of course, the enum can be expaned in the future to include modes for
>> other types of PHYs as well.
>>
>> Suggested-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>
> This patch is required for both phy driver and the usb driver. I can create a
> immutable branch with only this patch and both me and Bin Liu can merge it in
> our next branch.
>
> Thanks
> Kishon
>

I'm new to the kernel merging process, so I am not exactly sure what 
this means, but I think it sounds like a good thing. :-)

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
