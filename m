From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [RFC] media DT bindings
Date: Mon, 30 Jul 2012 23:02:26 +0200
Message-ID: <5016F662.8030807@gmail.com>
References: <Pine.LNX.4.64.1207110854290.18999@axis700.grange> <5000375B.9060100@gmail.com> <Pine.LNX.4.64.1207161257590.18978@axis700.grange> <5006EB9F.5010408@gmail.com> <20120723121420.GC8302@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20120723121420.GC8302@sirena.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/23/2012 02:14 PM, Mark Brown wrote:
> On Wed, Jul 18, 2012 at 07:00:15PM +0200, Sylwester Nawrocki wrote:
> 
>> One possible solution would be to have host/bridge drivers to register
>> a clkdev entry for I2C client device, so it can acquire the clock through
>> just clk_get(). We would have to ensure the clock is not tried to be
>> accessed before it is registered by a bridge. This would require to add
>> clock handling code to all sensor/encoder subdev drivers though..
> 
> If this is done well it could just be a simple callback, and we could
> probably arrange for the framework to just implement the default
> behaviour if the driver doesn't do anything explicit.

I agree, if a clock is bound to a sub-device beforehand it could 
probably be done with just a callback as well. Implementing default 
behaviour at the framework makes a lot of sense too, it could ease 
the conversion process significantly.

> Of couse this is one of those things where we really need the generic
> clock API to be generally available...

Indeed, I hope it won't take too much time before at least some of the
platforms get converted.

--

Thanks,
Sylwester
