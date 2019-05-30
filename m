Return-Path: <SRS0=1FkI=T6=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFC 0/2] Add Renesas RPC-IF support
Message-ID: <ad503d6e-4739-9744-64b4-fd13f44ea6fe@cogentembedded.com>
Date: Thu, 30 May 2019 22:59:30 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Mason Yang <masonccyang@mxic.com.tw>, linux-spi@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello!

Here's a set of 2 patches against the 'for-mfd-next' branch of Lee Jones's
'mfd.git' repo. Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI
flash or HyperFlash connected to the SoC to be accessed via the external
address space read mode or the manual mode. The MFD driver for RPC-IF
registers either the SPI or HyperFLash subdevice, depending on the contents
of the device tree subnode; it also provides the absract "back end" API
that can be used by the "front end" SPI/MTD drivers to talk to the real
hardware... The HyperFlash subdriver isn't ready yet, so the MFD driver
may need some updates in order to serve it, hence the RFC status...

Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.

[1/2] dt-bindings: mfd: document Renesas RPC-IF bindings
[2/2] mfd: add Renesas RPC-IF driver

MBR, Sergei
