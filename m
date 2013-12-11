From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 0/5] Remove deprecates usage of device_type
Date: Wed, 11 Dec 2013 11:15:50 +0000
Message-ID: <1386760555-22732-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

I spent some time this morning to clear out a bunch of unnecessary
references to device_type in dt bindings. There is still a lot to do.
"serial" has a lot of unnecessary users, and the are three bindings that
use "network" that probably can be relaxed. However, I think this is a
good first step.

Grant Likely (5):
      dt/bindings: Remove all references to device_type "ethernet-phy"
      dt/bindings: Remove references to linux,phandle properties
      dt/bindings: remove users of device_type "mdio"
      dt/bindings: remove device_type "network" references
      dt/bindings: Remove device_type "serial" from marvell,mv64360-mpsc
