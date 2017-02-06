From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] of: introduce of_graph_get_remote_node
Date: Mon, 6 Feb 2017 07:54:23 -0600
Message-ID: <CAL_JsqJ2HO6WkSGccqGaxHPExnJGyRwrrL2wDOORO+auA=Jbrg@mail.gmail.com>
References: <20170204033635.10250-1-robh@kernel.org> <20170204033635.10250-2-robh@kernel.org>
 <1486377167.3005.30.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486377167.3005.30.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2017 at 4:32 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Hi Rob,
>
> thanks for this clean-up series! I was not aware how far the duplication
> has spread over time.
>
> On Fri, 2017-02-03 at 21:36 -0600, Rob Herring wrote:
>> The OF graph API leaves too much of the graph walking to clients when
>> in many cases the driver doesn't care about accessing the port or
>> endpoint nodes. The drivers typically just want the device connected via
>> a particular graph connection. of_graph_get_remote_node provides this
>> functionality.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>>  drivers/of/base.c        | 28 ++++++++++++++++++++++++++++
>>  include/linux/of_graph.h |  8 ++++++++
>>  2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index d4bea3c797d6..ea18ab16b92c 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -2469,3 +2469,31 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
>>       return of_get_next_parent(np);
>>  }
>>  EXPORT_SYMBOL(of_graph_get_remote_port);
>> +
>> +struct device_node *of_graph_get_remote_node(const struct device_node *node,
>> +                                          int port, int endpoint)
>
> I think this should have a documentation comment, similar to the
> of_graph_get_endpoint_by_regs one, as it is not really clear from the
> function name that the returned device node is the parent (or
> grandparent) device node containing the remote port to the specified
> node & port & endpoint.
> Also it might be interesting to the user that -1 is a wildcard value for
> port / endpoint.

I really want to not allow using a wildcard here. Drivers should know
what port they want (or iterate over all of them). It didn't look like
any drivers were depending on the wildcard, but were just using -1 for
"no reg property" when really that should 0. Of course, I may have
missed something.

I guess I could enforce port/endpoint > 0 here as there's no existing users.

Rob
