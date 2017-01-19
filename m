From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/6] of_graph_get_remote_endpoint()
Date: Thu, 19 Jan 2017 08:34:00 -0600
Message-ID: <CAL_JsqJEL4jd2gnoC+mygJzuEgPO8H4PQhN5dvmq_rN1mBfVEw@mail.gmail.com>
References: <87o9z34l3o.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87o9z34l3o.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-DT <devicetree@vger.kernel.org>, Laurent <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>, Peter Chen <peter.chen@nxp.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 12:31 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
>
> Hi Rob
>
> Now many driver is getting remote-endpoint by manually,
> but we should use same method to get same result IMO.
> Thus this patch adds of_graph_get_remote_endpoint() for this purpose.
> And use it on several drivers

This looks okay, but I think we need to be improving the graph api at
a higher level. Each user seems to be doing too much open coding of
walking of the graph. The user typically just wants the remote node
parent of a given port and endpoint number. Why does the user walk the
graph to find the endpoint node, then parse remote-endpoint, then walk
up parents. We have lots of other graph users and you didn't need to
update them which means they are already using helpers. Maybe the
drivers here need to be fixed. omapfb in particular looks like it
duplicates a bunch of helpers we already have, but maybe we're close
to removing that driver.

Rob
