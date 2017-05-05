From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] [RFC] of/platform: Make of_dev_node_match() helper public
Date: Fri, 5 May 2017 13:50:53 -0500
Message-ID: <CAL_JsqKn8CVTMvjD_JwBUENXs9YgsybkVv1PeLQHMB0EDMWbrg@mail.gmail.com>
References: <1493995961-11828-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1493995961-11828-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Frank Rowand <frowand.list@gmail.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 5, 2017 at 9:52 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Several drivers provide their own match functions, identical to
> of_dev_node_match() in the OF platform core.
>
> Reduce duplication by making of_dev_node_match() public.
> To avoid conflicts, the duplicates in coresight and i2c must be removed
> at the same time.

I think you are down one level too far. At least the 2 users here are
just for calls to bus_find_device. We already have a function for that
with of_find_device_by_node at least for platform devices. Perhaps
rework that to be "struct device *of_find_bus_device_by_node(struct
bus_type *b, struct device_node *np)" and then wrappers for each bus
type. And perhaps make a class variant as well. However, we should
also consider if OF is the right level. Maybe it should be fwnode
functions?

Rob
