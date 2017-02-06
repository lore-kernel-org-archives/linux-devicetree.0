From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] of: introduce of_graph_get_remote_node
Date: Mon, 6 Feb 2017 07:41:35 -0600
Message-ID: <CAL_JsqLEgY4RNKP6Z9vqVZWA0Chj7=Fr6rHudjxDJ+rAYURorg@mail.gmail.com>
References: <20170204033635.10250-1-robh@kernel.org> <20170204033635.10250-2-robh@kernel.org>
 <20170206085023.onmsh5dcmn6ofpp5@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206085023.onmsh5dcmn6ofpp5@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, Neil Armstrong <narmstrong@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Frank Rowand <frowand.list@gmail.com>, Marek Vasut <marex@denx.de>, Kevin Hilman <khilman@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzk@kernel.org>, Xinliang Liu <z.liuxinliang@hisilicon.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, Kukjin Kim <kgene@kernel.org>, Mali DP Maintainers <malidp@foss.arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>Che
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2017 at 2:50 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Feb 03, 2017 at 09:36:31PM -0600, Rob Herring wrote:
>> The OF graph API leaves too much of the graph walking to clients when
>> in many cases the driver doesn't care about accessing the port or
>> endpoint nodes. The drivers typically just want the device connected via
>> a particular graph connection. of_graph_get_remote_node provides this
>> functionality.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>
> Just a quick procedural comment: drm-misc for 4.11 is closed already, but
> if we can get this core patch into 4.11 still then that would avoid
> cross-tree sync pains in 4.12 ...

Right, I was thinking the same thing.

Rob
