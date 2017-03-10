From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCHv4 10/15] ov2640: convert from soc-camera to a standard
 subdev sensor driver.
Date: Fri, 10 Mar 2017 13:08:33 +0200
Message-ID: <20170310110832.GC3220@valkosipuli.retiisi.org.uk>
References: <20170310102614.20922-1-hverkuil@xs4all.nl>
 <20170310102614.20922-11-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170310102614.20922-11-hverkuil@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, Songjun Wu <songjun.wu@microchip.com>, devicetree@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Fri, Mar 10, 2017 at 11:26:09AM +0100, Hans Verkuil wrote:
> From: Hans Verkuil <hans.verkuil@cisco.com>
> 
> Convert ov2640 to a standard subdev driver. The soc-camera driver no longer
> uses this driver, so it can safely be converted.
> 
> Note: the s_power op has been dropped: this never worked. When the last open()
> is closed, then the power is turned off, and when it is opened again the power
> is turned on again, but the old state isn't restored.
> 
> Someone else can figure out in the future how to get this working correctly,
> but I don't want to spend more time on this.
> 
> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
