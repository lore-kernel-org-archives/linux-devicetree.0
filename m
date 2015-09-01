From: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCHv6 0/6] iio: mma8452: improve driver and support more chips
Date: Tue,  1 Sep 2015 13:45:07 +0200
Message-ID: <1441107913-4112-1-git-send-email-martink@posteo.de>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org
List-Id: devicetree@vger.kernel.org

Version 6 of the mma8452 driver improvements. This is rebased on the current
-next tree because of cleanup changes in the meantime. Also, the patches are
slightly more cleaned up (adding the DT bindings document in the right patch).
Here we go:


These changes add support for motion interrupts and 3 more accelerometer
chips, two of which use them because they don't support the until now
included transient interrupt sources:

MMA8453Q, MMA8652FC and MMA8653FC; datasheets are in the commit messages.
The driver and module name remains the same, seperating it from the device
names it now supports.

Please review and test if you can. For MMA8452Q, nothing should have
changed.

revision history
----------------
v6   rebase! remove one patch (adding a new DT property). minor patch cleanup.
v5   DRIVER_NAME define removed; more flexible DT property
v4   cleanup; one bugfix patch removed from series; DT people added
v3   adds one patch to allow all possible pin wirings; adds more email
recipients
v2   splits the work into a series of smaller pieces
v1   initial post
