From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/3] dt-bindings: meson: Add G12A display bindings
Date: Mon, 15 Apr 2019 15:22:06 -0700
Message-ID: <7hmukqrjsh.fsf@baylibre.com>
References: <20190313141030.5958-1-narmstrong@baylibre.com> <5c7c873c-0535-0342-26b5-6cb29df9859b@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5c7c873c-0535-0342-26b5-6cb29df9859b@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 13/03/2019 15:10, Neil Armstrong wrote:
>> This patchset adds the G12A specific bindings for the Display VPU
>> and VPU Power Control.
>> 
>> The Amlogic Meson G12A Display module is based on the Meson GXM SoC
>> with an updated Plane Blender, thus VPU architecture and interconnect
>> is the same.
>> 
>> Implementation then DT nodes will come in a further patchsets.
>> 
>> Neil Armstrong (3):
>>   dt-bindings: display: amlogic,meson-vpu: Add G12A compatible and ports
>>   dt-bindings: display: amlogic,meson-dw-hdmi: Add G12A compatible and
>>     ports
>>   dt-bindings: power: amlogic,meson-gx-pwrc: Add G12A compatible
>> 
>>  .../devicetree/bindings/display/amlogic,meson-dw-hdmi.txt     | 4 ++++
>>  .../devicetree/bindings/display/amlogic,meson-vpu.txt         | 4 ++++
>>  .../devicetree/bindings/power/amlogic,meson-gx-pwrc.txt       | 4 +++-
>>  3 files changed, 11 insertions(+), 1 deletion(-)
>> 
>
> Kevin,
>
> I applied Patches 1 & 2 to drm-misc-next, can you take Patch 3 along :

Queued for v5.2,

Thanks,

Kevin
