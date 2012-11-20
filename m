From: Simon Glass <sjg@chromium.org>
Subject: Device tree node to major/minor?
Date: Tue, 20 Nov 2012 14:23:14 -0800
Message-ID: <CAPnjgZ0+8MbjmW7XKsSW0O0n2ob7XcUZokLd8b=1LkSUJ+tQEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lk <linux-kernel@vger.kernel.org>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Che-liang Chiou <clchiou@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

I hope this is a stupid question with an easy answer, but I cannot find it.

I have a device tree node for an mmc block device and I want to use
that block device from another driver. I have a phandle which lets me
get the node of the mmc device, but I am not sure how to convert that
into a block_device. In order to do so, I think I need a major/minor
number. Of course the phandle might in fact point to a SCSI driver and
I want that to work correctly also.

I imagine I might be able to search through the wonders of sysfs in
user space, but is there a better way?

Thanks,
Simon
