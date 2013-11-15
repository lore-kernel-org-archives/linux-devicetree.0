From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH v5 0/3] Kobjectify device tree structures
Date: Fri, 15 Nov 2013 17:46:41 +0000
Message-ID: <1384537604-5032-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi all,

I've resurrected this series and am posting it for review. I think I've
got the last problem that I know about solved. That was the problem that
Nathan pointed out that modified properties don't get reflected in the
sysfs representation. As I mentioned the last time I posted this series,
I will probably put a kernel release between patches 1&2 and patch 3 so
that if there is any problems then the old /proc method is still
available.

I'm posting this for review, but I've only compile tested on ARM and
PowerPC, and boot tested on ARM. I'll be going though a full set of
builds when I'm no longer on an airplane.  :-)

The existing device-tree userspace ABI remains the same with this series
applied.

Nathan, I would particularly appreciate if you can test this on PowerPC
machines with OF_DYNAMIC.

g.
