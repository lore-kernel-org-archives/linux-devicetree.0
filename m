From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add initial support for R-Car V3H (R8A77980)
Date: Wed, 31 Jan 2018 22:54:06 +0300
Message-ID: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Language: en-MW
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hello!

Here are 2 patches against the 'renesas-devel-20180130v2-v4.15' tag of Simon Horman's
'renesas.git' repo. They 1st docuement the SoC DT bindings, and then add the SoC Kconfig
symbol.

[1/2] DT: arm: shmobile: document R8A77980 SoC bindings
[2/2] arm64: add Renesas R8A77980 support

MBR, Sergei
