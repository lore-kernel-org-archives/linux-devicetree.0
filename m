From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [RFC v2 0/4] iio: Devicetree support
Date: Sat,  2 Feb 2013 16:59:36 -0800
Message-ID: <1359853180-5664-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set adds basic device tree support to the IIO subsystem. It is the
result of the [1] and [2] discussions.

The first two patches are actually updates to the MAX1363 driver. The first
patch updates the driver to use devm_ functions, and the second patch adds
support for an external reference voltage.

Patch 3 changes the first parameter to iio_channel_get() to be the pointer to
the consumer device instead of the consumer device name.

Patch 4 adds basic OF support to the IIO subsystem. Support is modeled after
the clock subsystem.

The patches are now based on the to togreg branch of iio kernel repository.
Several patches were already applied and are no longer part of the patch set.

Guenter

---
[1] http://marc.info/?l=linux-iio&m=135902119507483&w=2
[2] http://marc.info/?l=lm-sensors&m=135375101529918&w=1
