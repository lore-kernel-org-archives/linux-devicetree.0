Return-Path: <SRS0=uMbO=HI=linaro.org=manivannan.sadhasivam@kernel.org>
Date: Thu, 19 Apr 2018 20:08:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Revisiting Devicetree Overlay Manager
Message-ID: <20180419143804.brdgezjaxqalarum@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: robh+dt@kernel.org, frowand.list@gmail.com, grant.likely@secretlab.ca, pantelis.antoniou@konsulko.com
Cc: dimitrysh@google.com, john.stultz@linaro.org, nicolas.dechesne@linaro.org, devicetree@vger.kernel.org, daniel.thompson@linaro.org, loic.poulain@linaro.org
List-ID: <devicetree@vger.kernel.org>

Hello Everyone,

I have just started working on the Devicetree Overlay Manager support in
kernel. The idea is to merge overlays at boot time specified via some
interface like kernel command line. The motivation for this work comes from
Overlay Manager [1] submitted by John last year. The mechanism which I have
been working on is an extension to John's work. It focusses on addressing
Rob's comments on the Overlay Manager which involves having multiple ways
to load overlays.

Proposal:
=========

1. Pass all devicetree overlays via following methods:
   - Overlays appended to base DTB
   - Individual overlays built into kernel as firmware blobs
   - Any other ways?

2. Specify overlays to load via kernel command line as below:
   - overlay_mgr.overlays=<overlay1,overlay2,...>

3. Merge only the specified overlays during boot time. First look for the
overlay in the base DTB. If it is found, just apply it, else defer to firmware
load approach.

The Overlay Manager code is expected to be very simple and will just do the
above mentioned work. Later on, it will be extended to support dynamic
modification of overlays from userspace with some additional security
features like having a property listed in the base devicetree for only
allowing changes to the current node and its child nodes, etc...

Pain Points:
============

1. Starting from 4.17 we don't have any API exposed from DT core to merge
individual devicetree nodes. We only have of_overlay_fdt_apply() function
which takes the whole FDT. This will work very well for the firmware approach
since we will pass the overlays blobs but not for overlays appended to base DTB,
where we will pass individual overlay nodes.

2. Using firmware load method will force us to have this Overlay Manager code
at late_initcall level since firmware class exists only in fs_inticall level,
which might be too late for some devices.

3. This whole approach is not expected to work very well (still not yet tested)
on DSI based devices since it needs to be present at very early during boot
process.

The Overlay Manager propsed here will be board agnostic and it should work on
all platforms supporting DT. This will be a _very_ useful feature for the
development boards such as 96Boards, Raspberry Pi, BBB etc... and also for
production ready devices.

So, I'd like to hear suggestions/feedbacks for the above mentioned proposal &
pain points and hope to land the most awaited feature in kernel.

Regards,
Mani

[1] https://lkml.org/lkml/2017/10/10/20
