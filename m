From: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v5 0/5] Add ARM Mali Midgard device tree bindings and gpu
 node for rk3288
Date: Tue, 9 May 2017 15:45:10 +0800
Message-ID: <ddec5773-43ef-a4c3-2280-8f0c5b1f1c4d@rock-chips.com>
References: <cover.1493804968.git.guillaume.tucker@collabora.com>
 <12996903.t3AZceNVOh@diego>
 <b63475e9-21f6-5995-90b6-e0eeae8144ab@rock-chips.com>
 <b43fc703-3c39-58e9-6006-1aa7f9d0cea6@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b43fc703-3c39-58e9-6006-1aa7f9d0cea6-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Wookey <wookey-Xpnwy/r4z8dg9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Reitan <john.reitan-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 05/09/2017 03:40 PM, Guillaume Tucker wrote:
> On 09/05/17 02:16, Randy Li wrote:
>>
>>
>> On 05/09/2017 12:27 AM, Heiko Stübner wrote:
>>> Am Mittwoch, 3. Mai 2017, 10:56:24 CEST schrieb Guillaume Tucker:
>>>> The ARM Mali Midgard GPU kernel driver is only available
>>>> out-of-tree and is not going to be merged in its current form.
>>>> However, it would be useful to have its device tree bindings
>>>> merged.  In particular, this would enable distributions to create
>>>> working driver packages (dkms...) without having to patch the
>>>> kernel.
>>>>
>>>> The bindings for the earlier Mali Utgard GPU family have already
>>>> been merged, so this is essentially the same scenario but for
>>>> newer GPUs (Mali-T604 ~ Mali-T880).
>>>>
>>>> This series of patches first imports the bindings from the latest
>>>> driver release with some clean-up then adds a gpu node for the
>>>> rk3288 SoC.  This was successfully tested on Radxa Rock2 Square,
>>>> Firefly, Veyron Minnie and Jerry boards using Mali kernel driver
>>>> r16p0 and r12p0 user-space binary.
>> I won't suggest such combine. We meet some problems at mali 400 serial.
>> I would suggest the kernel version would match the user library.
> 
> Well, I can test it again with r12p0 kernel driver (out-of-tree)
> if you want.  The user-space driver checks the version of the
> kernel driver and gives up if it's not compatible.  With Midgard,
> there's a range of versions that maintain kernel/userspace
> compatibility unlike Utgard and older Midgard releases where they
> had to exactly match.  Again, if there was a mismatch then the
> user-space would fail to initialise and report an error.
Anyway, could you verify the mali userspace library r13p0?
Rockchip would use this version to offer the support of X11, wayland and 
gbm.
> 
>> Also please notice there is rk3288w, the hardware version becomes r1p0.
> 
> Sounds like a new SoC?  Does rk3288w affect rk3288 in any way?
It is not a new SoC, just a new version of rk3288. It fixes a various of 
the chip bug of the rk3288.
> 
> Unless it's a special case, it seems to me that any new SoC with
> a Midgard GPU would need an extra vendor compatible string in the
> binding documentation and maybe a separate gpu dt node.
> 
>>> The actual devicetree parts are all Rockchip-specific, so I guess 
>>> I'll just
>>> pick up the whole series, including the binding doc, after the merge
>>> window if nobody complains before that :-)
> 
> Thanks!
> 
> 
> Guillaume
> 
> 

-- 
Randy Li

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
