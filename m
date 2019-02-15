From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 0/2] drm/omap: panel-tpo-td028ttec1: add backlight
 support
Date: Fri, 15 Feb 2019 10:25:54 +0200
Message-ID: <94353858-9f0e-b842-9766-6f7d3ff6cc2a@ti.com>
References: <20190205063813.14873-1-andreas@kemnade.info>
 <a54e7427-ff84-d105-aab7-c5eab42e6df9@ti.com>
 <20190215081242.21cc9953@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190215081242.21cc9953@kemnade.info>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

On 15/02/2019 09:12, Andreas Kemnade wrote:
> Hi,
> 
> On Fri, 8 Feb 2019 11:13:33 +0200
> Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> 
>> On 05/02/2019 08:38, Andreas Kemnade wrote:
>>> This panel has a backlight, so add a property describing that and
>>> add the code to use that.
>>> This makes things like xset dpms force off
>>> also turn off the backlight, so we do not need to rely on additional
>>> userspace programs to do that.
>>>
>>> Andreas Kemnade (2):
>>>   drm/omap: panel-tpo-td028ttec1: add backlight support
>>>   dt-bindings: panel: td028ttec1: add backlight property
>>>
>>>  .../devicetree/bindings/display/panel/tpo,td028ttec1.txt       |  2 ++
>>>  drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c        | 10 ++++++++++
>>>  2 files changed, 12 insertions(+)
>>>   
>>
>> Thanks, I'll pick these up.
>>
> 
> hmm, that sounds like: patch accepted, will appear in linux-next soon.
> I have not seen it there, or is it just in some branch not merged into
> linux-next. Any new obstacles?

It's too late to get it to the next merge window, so I'll have to wait
until the merge window is closed before I can send these to drm-next.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
