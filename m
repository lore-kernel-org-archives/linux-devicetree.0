Return-Path: <SRS0=3Ka7=MV=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77980 support to the Renesas R-Car gen3 thermal
 driver
Message-ID: <3c96d51e-fc36-2ff9-03a8-176c4c0ed365@cogentembedded.com>
Date: Tue, 9 Oct 2018 22:07:21 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'next' branch of Eduardo Valentin's
'linux-soc-thermal.git' repo. We're adding support for the R8A77980 thermal
sensor controller to the R-Car gen3 thermal driver.

[1/2] dt-bindings: thermal: rcar-gen3-thermal: document R8A77980 bindings
[2/2] thermal: rcar_gen3_thermal: add R8A77980 support

MBR, Sergei
