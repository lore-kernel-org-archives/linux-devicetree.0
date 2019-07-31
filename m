From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v8 00/14] Rockchip ISP1 Driver
Date: Wed, 31 Jul 2019 06:55:26 +0200
Message-ID: <13d89676-ae84-5904-7606-935501cb2d89@xs4all.nl>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <dbdfed3e-7bb6-bf1f-64b9-ab7298193e2d@xs4all.nl>
 <41e7e574-2708-eb4c-ea30-e6a1ac9c073e@collabora.com>
 <8ce532de-6c26-f8db-8754-c8dd1eb0764b@collabora.com>
 <74bb0ba1-2859-39ff-d946-129a440ba150@xs4all.nl>
 <fb1327fb-0903-ce62-4eea-94b81f599b62@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <fb1327fb-0903-ce62-4eea-94b81f599b62@xs4all.nl>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Helen Koike <helen.koike@collabora.com>, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, kernel@collabora.com, heiko@sntech.de, zhengsq@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, mchehab@kernel.org, ezequiel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 7/31/19 6:33 AM, Hans Verkuil wrote:
> On 7/31/19 6:29 AM, Hans Verkuil wrote:
>> On 7/31/19 2:08 AM, Helen Koike wrote:
>>>
>>>
>>> On 7/30/19 5:50 PM, Helen Koike wrote:
>>>>
>>>>
>>>> On 7/30/19 5:15 PM, Hans Verkuil wrote:
>>>>> On 7/30/19 8:42 PM, Helen Koike wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I'm re-sending a new version of ISP(Camera) v4l2 driver for rockchip
>>>>>> rk3399 SoC.
>>>>>>
>>>>>> I didn't change much from the last version, just applying the
>>>>>> suggestions made in the previous one.
>>>>>>
>>>>>> This patchset is also available at:
>>>>>> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v8
>>>>>>
>>>>>> Libcamera patched to work with this version:
>>>>>> https://gitlab.collabora.com/koike/libcamera
>>>>>> (also sent to the mailing list)
>>>>>>
>>>>>> I tested on the rockpi 4 with a rpi v1.3 sensor and also with the
>>>>>> Scarlet Chromebook.
>>>>>>
>>>>>> Known issues (same as in v7):
>>>>>> -------------
>>>>>> - Reloading the module doesn't work (there is some missing cleanup when
>>>>>> unloading)
>>>>>> - When capturing in bayer format, changing the size doesn't seem to
>>>>>> affect the image.
>>>>>> - crop needs more tests
>>>>>> - v4l2-compliance error:
>>>>>>         fail: v4l2-test-controls.cpp(824): subscribe event for control 'Image Processing Controls' failed
>>>>>> test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>>>>>
>>>>> Can you mail me the full v4l2-compliance output?
>>>>
>>>> Sure, please check here: http://ix.io/1Q5u
>>>> I updated v4l-utils with the latest version and I re-ran bootstrap/configure/make,
>>>> but for some reason the hash from the link above is not the latest commit, probably some
>>>> old configuration somewhere. I'll resend this log as soon as I get v4l2-compliance
>>>> properly updated.
>>>
>>> Please see the output of v4l2-compliance here with an updated v4l-utils: http://ix.io/1Q6A
>>
>> So this FAIL is for /dev/v4l-subdev0 (rkisp1-isp-subdev).
>>
>> What is weird that this subdev does not appear to have controls at all.
>>
>> What is the output of 'v4l2-ctl -d /dev/v4l-subdev0 -l'? And if it lists
>> controls, then why?
>>
>> If you run 'v4l2-compliance -u /dev/v4l-subdev0', do you get a fail as
>> well?
> 
> I see the same issue with v4l-subdev1, but I see no "Media Driver Info"
> in the v4l2-compliance output for that subdev. That's strange. It would
> be good to know why that's happening.

It looks to be some parenting issue: v4l2-compliance expects to find
a mediaX directory in /sys/dev/char/81\:Y/device/ where 81:Y is the major/minor
of /dev/v4l-subdev1.

Because is this mi_get_media_fd() cannot find the media device for the subdev
in v4l2-compliance.

Regards,

	Hans
