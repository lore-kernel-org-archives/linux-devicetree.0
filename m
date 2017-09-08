From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v9 00/23] Unified fwnode endpoint parser, async
 sub-device notifier support, N9 flash DTS
Date: Fri, 8 Sep 2017 16:25:07 +0300
Message-ID: <20170908132507.nqofkw2g43m7ydux@valkosipuli.retiisi.org.uk>
References: <20170908131235.30294-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170908131235.30294-1-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, niklas.soderlund@ragnatech.se, robh@kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, linux-acpi@vger.kernel.org, mika.westerberg@intel.com, devicetree@vger.kernel.org, pavel@ucw.cz, sre@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 08, 2017 at 04:11:51PM +0300, Sakari Ailus wrote:
> With this, the as3645a driver successfully registers a sub-device to the
> media device created by the omap3isp driver. The kernel also has the
> information it's related to the sensor driven by the smiapp driver but we
> don't have a way to expose that information yet.

The patches are also available here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=fwnode-parse>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
