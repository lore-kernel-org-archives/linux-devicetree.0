From: Alexander Amelkin <alexander-RgVAGUil9pwRDxlzMovjVg@public.gmane.org>
Subject: [GIT][PULL] Improvements to max3421-hcd driver
Date: Fri, 26 May 2017 14:22:47 +0300
Message-ID: <fe4f9b0f3a18d48dec6c0a8d79cae386@amelkin.msk.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following changes since commit 
08332893e37af6ae779367e78e444f8f9571511d:

   Linux 4.12-rc2 (2017-05-21 19:30:23 -0700)

are available in the git repository at:

   https://github.com/AlexanderAmelkin/linux-wandboard.git 
tags/max3421-improvements-1

for you to fetch changes up to b9a7559d24c0b2cb6e69124d861a943f79272681:

   usb: max3421-hcd: Remove function name from dev_dbg calls (2017-05-25 
11:52:13 +0300)

The separate patches for these changes will be sent as a follow up.

----------------------------------------------------------------
usb: max3421-hcd: Make the driver more up-to-date and flexible

This set of patches updates the max3421-hcd driver and fixes
some bugs in it. Specifically, it:

- Adds support for devicetree
- Makes platform related parameters configurable
- Adds sanity checks for platform related parameters
- Fixes crash on driver removal
- Tidies up use of memory allocation/deallocation functions
- Removes superfluous debug text

----------------------------------------------------------------
Alexander Amelkin (3):
       usb: max3421-hcd: Add devicetree support to the driver
       usb: max3421-hcd: Fix crash on the driver removal
       usb: max3421-hcd: Remove function name from dev_dbg calls

  .../devicetree/bindings/usb/maxim,max3421-hcd.txt  |  19 +++
  drivers/usb/host/max3421-hcd.c                     | 131 
+++++++++++++++++----
  2 files changed, 127 insertions(+), 23 deletions(-)
  create mode 100644 
Documentation/devicetree/bindings/usb/maxim,max3421-hcd.txt

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
