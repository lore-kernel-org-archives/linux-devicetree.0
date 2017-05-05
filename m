From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [RFC v2 0/3] Document bindings for camera modules and associated flash devices
Date: Fri,  5 May 2017 11:48:27 +0300
Message-ID: <1493974110-26510-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: pavel-+ZI9xUNit7I@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This RFC patchset documents properties commonly required by camera modules
and associated camera flash devices.

The camera module is essentially a package consisting of an image sensor, 
a lens, possibly a voice coil to move the lens and a number of other
things that at least the drivers need not to know of. All the devices in a
camera module are declared separately in the system and as such the fact
that they come in a single package isn't generally very useful to driver
software. 

I'm sending the set as RFC as there's no driver implementation, and a 
dependency to the V4L2 async changes:

<URL:http://www.spinics.net/lists/linux-media/msg114915.html>

since RFC v1:

- Remove sentences elaborating applicability of the bindings.

- Say a LED driver is a piece of hardware.

- Otherwise reformulate the descriptions according to the comments.

Sakari Ailus (3):
  dt: bindings: Add a binding for flash devices associated to a sensor
  dt: bindings: Add lens-focus binding for image sensors
  dt: bindings: Add a binding for referencing EEPROM from camera sensors

 .../devicetree/bindings/media/video-interfaces.txt       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
