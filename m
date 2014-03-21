From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 1/3] [media] of: move graph helpers from
 drivers/media/v4l2-core to drivers/of
Date: Fri, 21 Mar 2014 15:10:09 +0100
Message-ID: <532C4841.9090508@samsung.com>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de>
 <3632624.gNVi6QOfGx@avalon> <20140320222347.CAB6DC412EA@trevor.secretlab.ca>
 <2848953.vVjghJyYNE@avalon> <532C408D.4070002@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <532C408D.4070002@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Grant Likely <grant.likely@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Philipp Zabel <philipp.zabel@gmail.com>
List-Id: devicetree@vger.kernel.org

On 21/03/14 14:37, Tomi Valkeinen wrote:
> On 21/03/14 00:32, Laurent Pinchart wrote:
> 
>> > The OF graph bindings documentation could just specify the ports node as 
>> > optional and mandate individual device bindings to specify it as mandatory or 
>> > forbidden (possibly with a default behaviour to avoid making all device 
>> > bindings too verbose).
>
> Isn't it so that if the device has one port, it can always do without
> 'ports', but if it has multiple ports, it always has to use 'ports' so
> that #address-cells and #size-cells can be defined?
> 
> If so, there's nothing left for the individual device bindings to decide.

Wouldn't it make the bindings even more verbose ? Letting the individual
device bindings to decide sounds more sensible to me.

--
Thanks,
Sylwester
