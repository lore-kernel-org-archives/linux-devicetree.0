From: Siebren Vroegindeweij <siebren.vroegindeweij@gmail.com>
Subject: [PATCH v1] Add support for the ektf2127 touchscreencontroller
Date: Mon,  4 Jul 2016 11:29:04 +0200
Message-ID: <1467624545-3455-1-git-send-email-siebren.vroegindeweij@gmail.com>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: linux-input@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Michel Verlaan <michel.verl@gmail.com>
List-Id: devicetree@vger.kernel.org

Hey All,

The driver as submitted today has been tested on an ARM tablet with an ektf2127 touchscreencontroller.
For instantiation it uses the information from the devicetree.
If there is no information about the resolution in the devictree it will use the
resolution as provided by the chip itself.

Please review and merge,

Michel Verlaan and Siebren Vroegindeweij
