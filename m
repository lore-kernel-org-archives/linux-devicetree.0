From: Dan Murphy <dmurphy@ti.com>
Subject: [RFC v2] TI Reset Driver adapted to the reset core
Date: Mon, 5 May 2014 15:09:21 -0500
Message-ID: <1399320567-3639-1-git-send-email-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, tony@atomide.com
List-Id: devicetree@vger.kernel.org

All

I have made some big changes to this patchset so I did not put all the
changes in the patches themselves.

In brief

- I removed the object data files for each SoC and moved the data into
the DT.  I updated the binding document as well

- The DT implementation creates a parent reset node with the base offset
for each reset and the children within that parent declares the bit mask

- I created a xlate function in the reset driver to verify that reset
data and that the phandle exists.  The core xlate checks for the nr_resets
which we don't care about since we are not indexed based.

- Made the driver a platform driver as well so this removed the
prm_common patch as well as the header file.

I will add other TI devices once I feel comfortable that the design
is acceptable.

Dan

