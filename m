From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH 0/2] SPI EEPROM / device tree interaction improvements.
Date: Wed, 22 Aug 2012 12:03:56 -0700
Message-ID: <1345662238-15211-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

A couple of patches that make using SPI EEPROMs Real Easy for me.

David Daney (2):
  misc/at25, dt: Improve at25 SPI eeprom device tree bindings.
  misc/at25: Add an .id_table to at25 to facilitate driver loading and
    binding.

 Documentation/devicetree/bindings/misc/at25.txt | 34 ++++++---
 drivers/misc/eeprom/at25.c                      | 91 ++++++++++++++++++-------
 2 files changed, 89 insertions(+), 36 deletions(-)

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-- 
1.7.11.4
