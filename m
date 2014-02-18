From: Grant Likely <grant.likely@linaro.org>
Subject: Bug fix and test matching method for of_match_node()
Date: Tue, 18 Feb 2014 22:31:16 +0000
Message-ID: <1392762680-1498-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hao <haokexin@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

This series fixes the matching order in of_match_node() and adds some
test cases to make sure the ordering is working correctly. It mostly
works, but there is one test case that fails. I haven't debugged yet
whether the problem is of_match_node() or the testcase itself.
