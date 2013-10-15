From: Grant Likely <grant.likely@linaro.org>
Subject: [RFC 0/9] of: refactor IRQ parsing and add interrupts-extended implementation
Date: Tue, 15 Oct 2013 21:39:14 +0100
Message-ID: <1381869563-16083-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi everyone.

This series is mostly a set of cleanup to the interrupt parsing code.
Some of it merely clarification, like the renames of of_irq_map_*, some
to tighten up the API by using of_phandle_args, and some to prepare for
the last patch in the series.

Of all these patches, the last one is probably the only one likely to be
controversial. It adds a new way of specifying interrupts. If a device
gets wired up to multiple interrupt controllers, the interrupts-extended
property allows the device to specify multiple connections without
redirecting through an interrupt-map node which can be rather difficult
to understand. In a lot of cases, an interrupts-extended property is a
whole lot easier to use.

Please take a look and comment. We'll probably discuss the
interrupts-extended binding in Edinburgh at the DT workshop in a few
weeks.
