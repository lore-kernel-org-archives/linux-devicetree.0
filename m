From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v8 2/6] video: add of helper for videomode
Date: Tue, 13 Nov 2012 10:46:53 -0700
Message-ID: <50A2878D.8020707@wwwdotorg.org>
References: <1352734626-27412-1-git-send-email-s.trumtrar@pengutronix.de> <1352734626-27412-3-git-send-email-s.trumtrar@pengutronix.de> <20121113110837.GA30049@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20121113110837.GA30049@avionic-0098.mockup.avionic-design.de>
Sender: linux-media-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robherring2@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Guennady Liakhovetski <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On 11/13/2012 04:08 AM, Thierry Reding wrote:
> On Mon, Nov 12, 2012 at 04:37:02PM +0100, Steffen Trumtrar wrote:
>> This adds support for reading display timings from DT or/and
>> convert one of those timings to a videomode. The
>> of_display_timing implementation supports multiple children where
>> each property can have up to 3 values. All children are read into
>> an array, that can be queried. of_get_videomode converts exactly
>> one of that timings to a struct videomode.

>> diff --git
>> a/Documentation/devicetree/bindings/video/display-timings.txt
>> b/Documentation/devicetree/bindings/video/display-timings.txt

>> + - clock-frequency: displayclock in Hz
> 
> "display clock"?

I /think/ I had suggested naming this clock-frequency before so that
the property name would be more standardized; other bindings use that
same name. But I'm not too attached to the name I guess.
