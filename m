From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 0/3] Fwnode property API fixes for OF, pset
Date: Mon,  6 Mar 2017 15:26:28 +0200
Message-ID: <1488806791-25488-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, mika.westerberg@linux.intel.com, rafael@kernel.org, mark.rutland@arm.com, broonie@kernel.org, robh@kernel.org, ahs3@redhat.com
List-Id: devicetree@vger.kernel.org

Hi folks,

Here are three patches that fix a few issues in the fwnode property API
implementation. They were previously a part of a larger patchset "Move
firmware specific code to firmware specific locations" here:

<URL:http://www.spinics.net/lists/linux-acpi/msg72174.html>

There are no dependencies between these three patches and other patches
I've sent recently.

-- 
Kind regards,
Sakari

