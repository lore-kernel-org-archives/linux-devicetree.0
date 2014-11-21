From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 0/8] of: DT Overlay patches to be merged
Date: Fri, 21 Nov 2014 01:35:07 +0000
Message-ID: <1416533715-9758-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

I've finally queued up the following core patches for devicetree overlay
support.  The patches have changed a bit since the v8 series that
Pantelis published. Mostly fixups to issues raised on the list.

Please review and let me know if you have any concerns.

There are still several overlay patches that need to be merged to add
support to the i2c and spi busses as well as the configfs interface.
I'll be looking at those patches next.

g.
