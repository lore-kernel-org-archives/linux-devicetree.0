From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v8 00/14] Rockchip ISP1 Driver
Date: Wed, 31 Jul 2019 06:29:59 +0200
Message-ID: <74bb0ba1-2859-39ff-d946-129a440ba150@xs4all.nl>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <dbdfed3e-7bb6-bf1f-64b9-ab7298193e2d@xs4all.nl>
 <41e7e574-2708-eb4c-ea30-e6a1ac9c073e@collabora.com>
 <8ce532de-6c26-f8db-8754-c8dd1eb0764b@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8ce532de-6c26-f8db-8754-c8dd1eb0764b@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Helen Koike <helen.koike@collabora.com>, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, kernel@collabora.com, ezequiel@collabora.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com
List-Id: devicetree@vger.kernel.org

On 7/31/19 2:08 AM, Helen Koike wrote:
> 
> 
> On 7/30/19 5:50 PM, Helen Koike wrote:
>>
>>
>> On 7/30/19 5:15 PM, Hans Verkuil wrote:
>>> On 7/30/19 8:42 PM, Helen Koike wrote:
>>>> Hello,
>>>>
>>>> I'm re-sending a new version of ISP(Camera) v4l2 driver for rockchip
>>>> rk3399 SoC.
>>>>
>>>> I didn't change much from the last version, just applying the
>>>> suggestions made in the previous one.
>>>>
>>>> This patchset is also available at:
>>>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v8
>>>>
>>>> Libcamera patched to work with this version:
>>>> https://gitlab.collabora.com/koike/libcamera
>>>> (also sent to the mailing list)
>>>>
>>>> I tested on the rockpi 4 with a rpi v1.3 sensor and also with the
>>>> Scarlet Chromebook.
>>>>
>>>> Known issues (same as in v7):
>>>> -------------
>>>> - Reloading the module doesn't work (there is some missing cleanup when
>>>> unloading)
>>>> - When capturing in bayer format, changing the size doesn't seem to
>>>> affect the image.
>>>> - crop needs more tests
>>>> - v4l2-compliance error:
>>>>         fail: v4l2-test-controls.cpp(824): subscribe event for control 'Image Processing Controls' failed
>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>
>>> Can you mail me the full v4l2-compliance output?
>>
>> Sure, please check here: http://ix.io/1Q5u
>> I updated v4l-utils with the latest version and I re-ran bootstrap/configure/make,
>> but for some reason the hash from the link above is not the latest commit, probably some
>> old configuration somewhere. I'll resend this log as soon as I get v4l2-compliance
>> properly updated.
> 
> Please see the output of v4l2-compliance here with an updated v4l-utils: http://ix.io/1Q6A

So this FAIL is for /dev/v4l-subdev0 (rkisp1-isp-subdev).

What is weird that this subdev does not appear to have controls at all.

What is the output of 'v4l2-ctl -d /dev/v4l-subdev0 -l'? And if it lists
controls, then why?

If you run 'v4l2-compliance -u /dev/v4l-subdev0', do you get a fail as
well?

BTW, note that struct rkisp1_isp_subdev has a ctrl_handler field that
isn't used at all.

Regards,

	Hans
