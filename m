From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH v2 0/2] of: Clean up naming of platform devices
Date: Fri, 23 May 2014 08:36:07 +0900
Message-ID: <1400801769-4506-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series makes of_device_make_bus_id() more reliable in choosing a
unique name and clears out some historical cruft. I've rebased it onto
Rob's for-next tree so that it plays well with the removal of
of_can_translate_address()
