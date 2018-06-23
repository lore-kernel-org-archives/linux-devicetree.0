Return-Path: <SRS0=78dS=JJ=zonque.org=daniel@kernel.org>
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 0/4] input: touchscreen: eeti: DT bindings and clean-ups
Date: Sat, 23 Jun 2018 17:45:29 +0200
Message-Id: <20180623154533.26901-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

This is v2 of the series that brings DT bindings to the eeti driver and
cleans up the code a bit.

Changelog:

v1 → v2:
* dropped module parameters
* use touchscreen_report_pos() and drop some code for that
* squashes 4/5 and 5/5 of v1

Daniel Mack (4):
  dt-bindings: input: touchscreen: add bindings for eeti touchscreen
    controller
  input: touchscreen: eeti: add device tree matching table
  input: touchscreen: eeti: drop module parameters, parse DT properties
  input: touchscreen: eeti: fix link to documentation and email address
    in header

 .../bindings/input/touchscreen/eeti.txt       | 31 ++++++++++++++++
 drivers/input/touchscreen/eeti_ts.c           | 37 +++++++++----------
 2 files changed, 48 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt

-- 
2.17.1
