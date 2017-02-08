From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCHv2] dt: bindings: Add support for CSI1 bus
Date: Wed, 8 Feb 2017 10:38:14 +0200
Message-ID: <20170208083813.GG13854@valkosipuli.retiisi.org.uk>
References: <20161228183036.GA13139@amd>
 <20170111225335.GA21553@amd>
 <20170206094956.GA17974@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170206094956.GA17974@amd>
Sender: linux-media-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, ivo.g.dimitrov.75@gmail.com, sre@kernel.org, pali.rohar@gmail.com, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Pavel,

On Mon, Feb 06, 2017 at 10:49:57AM +0100, Pavel Machek wrote:
> From: Sakari Ailus <sakari.ailus@iki.fi>
> 
> In the vast majority of cases the bus type is known to the driver(s)
> since a receiver or transmitter can only support a single one. There
> are cases however where different options are possible.
> 
> The existing V4L2 OF support tries to figure out the bus type and
> parse the bus parameters based on that. This does not scale too well
> as there are multiple serial busses that share common properties.
> 
> Some hardware also supports multiple types of busses on the same
> interfaces.
> 
> Document the CSI1/CCP2 property strobe. It signifies the clock or
> strobe mode.

Thanks. I split this into two (bus type + strobe). The result is in here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=ccp2>

How about the rest? :-) I guess we could get the CCP2 support in omap3isp
without the video bus switch. It'd be nice to have this in a single
patchset.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
