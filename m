From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/3] of: base: add support to get machine compatible string
Date: Wed, 23 Nov 2016 10:05:24 +0000
Message-ID: <2a644b8c-d91e-5ab1-200b-00f749a36307@arm.com>
References: <1479811311-3080-1-git-send-email-bgolaszewski@baylibre.com>
 <1479811311-3080-2-git-send-email-bgolaszewski@baylibre.com>
 <5ce9fb9f-459a-562b-2e9f-85d35f9ec035@arm.com>
 <67a3c2c7-0cb9-9764-2710-6ee66fc4dde4@ti.com>
 <fdb93150-9089-c7bb-2b0a-21ded241a647@arm.com>
 <ae92e013-b41b-6caa-b32f-284ffb6f5aa0@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <ae92e013-b41b-6caa-b32f-284ffb6f5aa0@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-devicetree <devicetree@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Jyri Sarha <jsarha@ti.com>, Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>, Frank Rowand <frowand.list@gmail.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org



On 23/11/16 07:49, Sekhar Nori wrote:
> On Tuesday 22 November 2016 09:16 PM, Sudeep Holla wrote:
>> Hi Sekhar,
>>
>> On 22/11/16 15:06, Sekhar Nori wrote:
>>> Hi Sudeep,
>>>
>>> On Tuesday 22 November 2016 04:23 PM, Sudeep Holla wrote:
>>>>
>>>>
>>>> On 22/11/16 10:41, Bartosz Golaszewski wrote:
>>>>> Add a function allowing to retrieve the compatible string of the root
>>>>> node of the device tree.
>>>>>
>>>>
>>>> Rob has queued [1] and it's in -next today. You can reuse that if you
>>>> are planning to target this for v4.11 or just use open coding in your
>>>> driver for v4.10 and target this move for v4.11 to avoid cross tree
>>>> dependencies as I already mentioned in your previous thread.
>>>
>>> I dont have your original patch in my mailbox, but I wonder if
>>> returning a pointer to property string for a node whose reference has
>>> already been released is safe to do? Probably not an issue for the root
>>> node, but still feels counter-intuitive.
>>>
>>
>> I am not sure if I understand the issue here. Are you referring a case
>> where of_root is freed ?
>
> Yes, right, thats what I was hinting at. Since you are giving up the
> reference to the device node before the function returns, the user can
> be left with a dangling reference.
>

Yes I agree.

>> Also I have seen drivers today just using this pointer directly, but
>> it's better to copy the string(I just saw this done in one case)
>
> Hmm, the reference is given up before the API returns, so I doubt
> copying it later is any additional benefit.
>

True.

> I suspect this is a theoretical issue though since root device node is
> probably never freed.
>

Indeed, not sure if it's worth adding additional code to release the nod
at all call sites.

-- 
Regards,
Sudeep
