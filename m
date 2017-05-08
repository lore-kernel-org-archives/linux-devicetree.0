From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC v3 2/2] mux: mmio-based syscon mux controller
Date: Mon, 08 May 2017 10:12:24 +0200
Message-ID: <1494231144.3029.25.camel@pengutronix.de>
References: <1493380324-20638-1-git-send-email-p.zabel@pengutronix.de>
         <1493380324-20638-2-git-send-email-p.zabel@pengutronix.de>
         <f43fe769-426f-2bfe-fb58-c69743171b0d@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f43fe769-426f-2bfe-fb58-c69743171b0d@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sakari Ailus <sakari.ailus@iki.fi>, Steve Longerbeam <slongerbeam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Mon, 2017-05-08 at 10:00 +0200, Peter Rosin wrote:
> Hi Philipp,
> 
> With the ack on the bindings in place, I'm going to pile these
> two patches on top of my mux series when I send v15 next week (or
> whenever v4.12-rc1 is out). There are a pair of nitpicks that I'm
> going to fix myself, so no need for a resend.

Yes, please. While at it, could you also fix my "bitfieldis" typo in the
commit description of patch 1.

> Thank you very much for making use of the new code, I hope the
> "3rd party interest" will help getting the mux series merged...

Thanks to Sakari for pointing it out in the video-mux review.

regards
Philipp
