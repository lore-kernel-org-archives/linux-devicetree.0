From: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Unified fwnode endpoint parser
Date: Wed, 16 Aug 2017 15:37:20 +0300
Message-ID: <20170816123719.zdeq3b37tfjj5hk7@valkosipuli.retiisi.org.uk>
References: <20170816112019.9250-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170816112019.9250-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, niklas.soderlund-1zkq55x86MTQD6PfKP4TzA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The patches depend on the ccp2 patches here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=ccp2>

On Wed, Aug 16, 2017 at 02:20:17PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> We have a large influx of new, unmerged, drivers that are now parsing
> fwnode endpoints and each one of them is doing this a little bit
> differently. The needs are still exactly the same for the graph data
> structure is device independent. This is still a non-trivial task and the
> majority of the driver implementations are buggy, just buggy in different
> ways.
> 
> Facilitate parsing endpoints by adding a convenience function for parsing
> the endpoints, and make the omap3isp driver use it as an example.
> 
> The parser succeeds an essential bugfix in the set.
> 
> I plan to include the first patch to a pull request soonish, the second
> could go in with the first user.
> 
> Open question: should we designate an error code to silently skip endpoints
> from driver's parse_endpoint() callback? Would that be useful? An error
> code not relevant for parsing endpoints in general (such as EISDIR) could
> be chosen, otherwise we're hampering with error codes that can be returned
> in general.
> 
> since v1:
> 
> - The first patch has been merged (it was a bugfix).
> 
> - In anticipation that the parsing can take place over several iterations,
>   take the existing number of async sub-devices into account when
>   re-allocating an array of async sub-devices.
> 
> - Rework the first patch to better anticipate parsing single endpoint at a
>   time by a driver.
> 
> - Add a second patch that adds a function for parsing endpoints one at a
>   time based on port and endpoint numbers.
> 
> Sakari Ailus (2):
>   v4l: fwnode: Support generic parsing of graph endpoints in a device
>   v4l: fwnode: Support generic parsing of graph endpoints in a single
>     port
> 
>  drivers/media/platform/omap3isp/isp.c | 116 +++++++---------------
>  drivers/media/platform/omap3isp/isp.h |   3 -
>  drivers/media/v4l2-core/v4l2-fwnode.c | 176 ++++++++++++++++++++++++++++++++++
>  include/media/v4l2-async.h            |   4 +-
>  include/media/v4l2-fwnode.h           |  16 ++++
>  5 files changed, 231 insertions(+), 84 deletions(-)
> 
> -- 
> 2.11.0
> 
> 

-- 
Sakari Ailus
e-mail: sakari.ailus-X3B1VOXEql0@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
