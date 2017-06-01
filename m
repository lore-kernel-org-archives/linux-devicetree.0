From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [RFC v2 3/3] dt: bindings: Add a binding for referencing EEPROM
 from camera sensors
Date: Thu, 1 Jun 2017 11:00:04 +0300
Message-ID: <20170601080004.GI1019@valkosipuli.retiisi.org.uk>
References: <1493974110-26510-1-git-send-email-sakari.ailus@linux.intel.com>
 <1493974110-26510-4-git-send-email-sakari.ailus@linux.intel.com>
 <20170508172418.zha3eyfsnuricfjk@rob-hp-laptop>
 <20170529122004.GE29527@valkosipuli.retiisi.org.uk>
 <c7a98681-4c95-0103-96ee-97ca6a02d9b3@zonque.org>
 <20170529130524.GF29527@valkosipuli.retiisi.org.uk>
 <20170531173718.GA11983@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170531173718.GA11983@amd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 31, 2017 at 07:37:18PM +0200, Pavel Machek wrote:
> Yeah, it would be good to get the corresponding patches to be merged
> to v4l-utils...

There are also no drivers to make use of this currently --- I certainly
don't object using the group_id before better solutions are available. But
the kernel needs to have the information before it can use it. :-)

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org	XMPP: sailus-PCDdDYkjdNMDXYZnReoRVg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
