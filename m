Return-Path: <SRS0=1IWS=TD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34373 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfECQPG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 May 2019 12:15:06 -0400
From: Iker Perez <iker.perez@codethink.co.uk>
Subject: [PATCH v4 0/2] Support for TMP75B temperature sensor                    
Date: Fri,  3 May 2019 17:14:59 +0100
Message-Id: <20190503161501.29489-1-iker.perez@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, devicetree@vger.kernel.org, Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

This patch series adds support for the TMP75 temperature sensor to the 
lm75.c driver. Although the TMP75B has a configurable conversion rate,
this series just sets it to the default rate of 37Hz. Sample rate is set 
close to this.           
                                                                                 
In the future, I want to develop a function that allows the user choose        
the preferred conversion rate from user-land. 


Iker Perez del Palomar Sustatxa (2):
  hwmon: (lm75) Add support for TMP75B
  dt-bindings: hwmon: Add tmp75b to lm75.txt

 Documentation/devicetree/bindings/hwmon/lm75.txt |  1 +
 Documentation/hwmon/lm75                         |  7 +++++--
 drivers/hwmon/lm75.c                             | 11 +++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.11.0
