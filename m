From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 0/3] Rework of_find_node_by_path() code
Date: Tue, 13 May 2014 15:58:32 +0100
Message-ID: <1399993115-21552-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series reworks the of_find_node_by_path() function to search by
path component instead of comparing the full path on every node. This
makes for a more efficient search and makes it possible to parse things
like aliases.

This is the second time I'm posting this series. I'm going to apply it
to my tree for the next merge window.
