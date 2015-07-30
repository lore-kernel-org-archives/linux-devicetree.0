From: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Subject: of: dynamic: resource: add WARN in release_resource for DT overlays
Date: Thu, 30 Jul 2015 15:17:16 +0200
Message-ID: <1438262237-30889-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
References: <[PATCH v3 0/7] Introducing (yet again) Device Tree Overlays>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <[PATCH v3 0/7] Introducing (yet again) Device Tree Overlays>
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


This patch prevents a kernel OOPS when removing a DT overlay containing
nodes with reg properties. release_resources is called for these nodes.
However, the resource structs were never initialized, hence the kernel OOPS.

This is obviously a stopgap measure until a proper solution is coded, see [1].


[1]: https://lkml.org/lkml/2014/4/17/359
