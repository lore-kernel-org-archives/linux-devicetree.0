From: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Subject: [PATCH 0/5] Move some OF functionality from pseries to generic OF
 code
Date: Tue, 02 Oct 2012 13:11:47 -0500
Message-ID: <506B2E63.5090900@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, cbe-oss-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

This set of patches moves some OF code that has been living
in the pseries tree over to the generic OF code base. The
functionality being migrated over is something that, I believe,
should live in the generic code base. The specific functionality
being migrated to generic OF code is;

o Updating the device tree in /proc when adding/removing a node.
o Adding a notification chain for adding/removing nodes and
  properties of the device tree.
o Re-naming the base OF code prom_* routines to of_* to better go
  with the naming used for OF code.

-Nathan 
