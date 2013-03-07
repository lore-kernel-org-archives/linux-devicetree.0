From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: HOWTO Undo/Revert of_platform_populate?
Date: Thu, 7 Mar 2013 11:32:47 +0100
Message-ID: <CAPybu_3LfWLYLSn52dgFDuBTASLvQ0_XWsywH=Avpma+4s921g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi

I have an FPGA attached to the pci bus. The FPGA has an internal bus
with multiple cores that are already supported in the kernel.

I have made a driver that populates those cores using a user provided
device tree. I use the function of_platform_populate for that.

All this is working fine, but now I need a method to undo what
of_platform_populate does when the fpga is reprogrammed.

I haven't found any function that does this in the api.

Before implementing my own I would like to know if am I missing something?


Thanks!

-- 
Ricardo Ribalda
