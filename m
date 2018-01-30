From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/2] fsi: add property to avoid scanning at boot
Date: Tue, 30 Jan 2018 16:21:14 +1030
Message-ID: <20180130055116.17411-1-joel@jms.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Jeremy Kerr <jk@ozlabs.org>, Christopher Bostic <cbostic@linux.vnet.ibm.com>, Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These two patches from Chris add an optional property that says the
FSI attached hardware cannot cope with being probed unless the state of
that hardware is known.

This allows the driver to eg. defer to userspace which can make this
decision.

I am collecting patches for a FSI tree to send to Greg, so I am just after
review from the device tree people.

Christopher Bostic (2):
  dt-bindings: fsi: Add optional property no-scan-on-init
  fsi: core: Add check for master property no-scan-on-init

 Documentation/devicetree/bindings/fsi/fsi.txt | 7 +++++++
 drivers/fsi/fsi-core.c                        | 5 ++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.15.1
