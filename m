From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] mfd: always assign of_node in mfd_add_device()
Date: Tue, 10 Dec 2013 09:54:21 -0700
Message-ID: <52A7473D.5020109@wwwdotorg.org>
References: <1386626809-6251-1-git-send-email-swarren@wwwdotorg.org> <20131210084042.GN12675@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131210084042.GN12675@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/10/2013 01:40 AM, Lee Jones wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> mfd_add_device() assigns .of_node in the device objects it creates only
>> if the mfd_cell for the device has the .of_compatible field set and the
>> DT node for the top-level MFD device contains a child whose compatible
>> property matches the cell's .of_compatible field.
>>
>> This leaves .of_node unset in many cases. When this happens, entries in
>> the DT /aliases property which refer to the top-level MFD DT node will
>> never match the MFD child devices, hence causing the requested alias not
>> to be honored.
>>
>> Solve this by setting each MFD child device's .of_node equal to the top-
>> level MFD device's .of_node field in the cases where it would otherwise
>> remain unset.
> 
> How sure are you that this will be void of repercussions?

I'm simply hopeful:-) It doesn't seem likely that this would cause any
issues, since presumably any devices that are being instantiated from DT
either already work correctly, or wouldn't be affected by this change
since they're manually searching whatever the appropriate DT node is.
Are there any particular points you think I should look into?

>> The first use-case for this will be aliases for the TPS6586x's RTC
>> device.
> 
> Isn't it viable to supply the of_compatible strings for these nodes
> and search the parent for its alias property instead?

I did think of that, but there are two reasons I chose not to do that
initially:

a) It requires that every single top-level MFD driver be edited to set
the .of_compatible field in their mfd_cells array, whereas this patch
automatically works for all drivers.

b) The mfd_cells .of_compatible field is a single entry, whereas a
top-level MFD driver could support an arbitrary number of DT compatible
values. I suppose one could work around this by setting the mfd_cells
.of_compatible field at run-time based on the actual compatible value of
the top-level DT node, but that feels icky.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
