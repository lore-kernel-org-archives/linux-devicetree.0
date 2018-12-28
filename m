Return-Path: <SRS0=BZPC=PF=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77980 support to the Renesas RPC-IF driver
Message-ID: <72626acd-9d5f-14a1-6464-5fdeba17fece@cogentembedded.com>
Date: Fri, 28 Dec 2018 13:42:51 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'devel' branch of Simon Horman's 'renesas.git'
repo and the Renesas RPC-IF driver/bindings patches v4. We're adding support for the
R-Car V3H (R8A77980) RPC-IF...

[1/2] dt-bindings: spi: renesas-rpc: document R8A77980 bindings
[2/2] spi-renesas-rpc: add R8A77980 support 

MBR, Sergei
