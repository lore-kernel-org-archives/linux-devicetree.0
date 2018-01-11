From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/10] Xilinx ZynqMP DisplayPort subsystem DRM KMS driver
Date: Thu, 11 Jan 2018 09:16:08 +0100
Message-ID: <1f0a0f73-4027-15c1-0dc8-7233d3ebe42a@xilinx.com>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
 <20180109095649.GK26573@phenom.ffwll.local>
 <BY1PR0201MB10002CAFCC860052538BA14DD6160@BY1PR0201MB1000.namprd02.prod.outlook.com>
 <20180111080738.GC13066@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180111080738.GC13066-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11.1.2018 09:07, Daniel Vetter wrote:
> On Thu, Jan 11, 2018 at 02:07:08AM +0000, Hyun Kwon wrote:
>> Hi Daniel,
>>
>>> -----Original Message-----
>>> From: Daniel Vetter [mailto:daniel.vetter-/w4YWyX8dFk@public.gmane.org] On Behalf Of Daniel
>>> Vetter
>>> Sent: Tuesday, January 09, 2018 1:57 AM
>>> To: Hyun Kwon <hyunk-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Michal
>>> Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>>> Subject: Re: [PATCH 00/10] Xilinx ZynqMP DisplayPort subsystem DRM
>>> KMS driver
>>>
>>> On Thu, Jan 04, 2018 at 06:05:49PM -0800, Hyun Kwon wrote:
>>>> Hi,
>>>>
>>>> This patchset adds the DRM KMS driver for Xilinx ZynqMP DisplayPort
>>>> subsystem. The Xilinx ZynqMP SoC has a hardened full display pipeline
>>>> which supports blending of up to 2 planes, and the encoder is
>>>> DisplayPort v1.2 compatible.
>>>>
>>>> This series mainly includes 2 sets: Xilinx DRM KMS (patch 1/10 - 5/10)
>>>> and ZynqMP DP subsystem drivers (patch 6/10 - 10/10).
>>>>
>>>> The Xilinx DRM KMS is intended as a common layer shared across other
>>>> (upcoming) Xilinx sub-drivers. It helps sub-drivers for both hardened as
>>>> well as soft IPs interoperate together.
>>>>
>>>> ZynqMP DP subsystem driver is a sub-driver that implements
>>> corresponding
>>>> drm objects (crtc, plane, encoder, connector,,,) for ZynqMP SoC display
>>>> pipeline. The entire pipeline is mainly partitioned into 2 blocks:
>>>> generic display logic (zynqmp_disp.c) such as blending, csc,,, and the
>>>> DP transmitter logic (zynqmp_dp.c).
>>>
>>> I read through it all (well mostly the drm relevant bits, not your backend
>>> code) and looks fairly resonable. Few minor clenaups and code removals
>>> tbh.
>>>
>>> Wrt merging/maintianing, do you want to maintain it as part of the
>>> drm-misc small drivers group? Highly recommended imo. See
>>>
>>> https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-
>>> misc.html#small-drivers
>>>
>>> for details. Ideally we'd need 2 xilinx maintainers to be able to push
>>> patches & cross-review stuff.
>>
>> I don't have any preference on how to maintain, so I'll follow your
>> suggestion. One thing that may be worth a note is that there is sizable
>> amount of development within Xilinx, and those will come in near future
>> (considering what can be done with FPGA :-)). I'll look for the 2nd
>> reviewer, and specify that in the next patch if found.
> 
> If the xilinx activity gets too much we can always split things up again.
> But if it's just the occasional burst (around a new product for example),
> then drm-misc has ample of bandwidth to absorb that.
> 
> And yes the idea is very much that all regular contributors would have
> commit rights too. All to reduce friction and make it easier to
> contribute.

Right now I think it is visible that everything needs to be reviewed
properly to make sure that we are doing these stuff properly.
This topic can be refreshed in future but I don't think we are there yet.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
