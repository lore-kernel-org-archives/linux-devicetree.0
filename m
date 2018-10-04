Return-Path: <SRS0=bbVD=MQ=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77970 support to the Renesas R-Car thermal driver
Message-ID: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com>
Date: Thu, 4 Oct 2018 23:58:04 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'next' branch of Eduardo Valentin's
'linux-soc-thermal.git' repo. We're adding support for the R8A77970 thermal
sensor controller to the R-Car thermal driver.

[1/2] dt-bindings: thermal: rcar-thermal: document R8A77970 bindings
[2/2] thermal: rcar_thermal: add R8A77970 support

MBR, Sergei
