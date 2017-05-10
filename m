From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v5 3/7] media: i2c: max2175: Add MAX2175 support
Date: Wed, 10 May 2017 11:12:31 +0300
Message-ID: <20170510081231.GB3227@valkosipuli.retiisi.org.uk>
References: <20170509133738.16414-1-ramesh.shanmugasundaram@bp.renesas.com>
 <20170509133738.16414-4-ramesh.shanmugasundaram@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170509133738.16414-4-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, hverkuil@xs4all.nl, sakari.ailus@linux.intel.com, crope@iki.fi, chris.paterson2@renesas.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ramesh,

On Tue, May 09, 2017 at 02:37:34PM +0100, Ramesh Shanmugasundaram wrote:
...
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-of.h>

Could you rebase this on the V4L2 fwnode patchset here, please?

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=v4l2-acpi>

It depends on other patches which will reach media-tree master in next rc1,
for now I've merged them here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=v4l2-acpi-merge>

I'll send a pull request for media-tree once we have 4.12rc1 in media-tree
master.

Thanks.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
