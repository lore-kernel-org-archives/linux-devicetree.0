From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC] TI Reset Driver adapted to the reset core
Date: Tue, 29 Apr 2014 15:19:39 -0500
Message-ID: <1398802790-29287-1-git-send-email-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tony@atomide.com, devicetree@vger.kernel.org
Cc: t-kristo@ti.com, s-anna@ti.com, p.zabel@pengutronix.de
List-Id: devicetree@vger.kernel.org

This is a RFC on the TI reset adoption to the Reset framework.

The patchset was derived from work from Rajendra Nayak and Afzal Mohammed
who have had similar code offerings.  One of the major differences here
is the SoC data has been broken out so that the data and code are independent.

There is currently no OMAP4 or prior support added to this patch series.
Once the RFC is complete and the code infrastructure looks to be acceptable
I will add these data sets into the patchset.

Dan 

