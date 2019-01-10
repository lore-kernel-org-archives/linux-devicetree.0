Return-Path: <SRS0=qXSO=PS=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFC 0/2] Add R8A77970 support to the Renesas RPC-IF driver
Message-ID: <c83b1e54-016f-ef28-6bc9-9be9410c0d9a@cogentembedded.com>
Date: Thu, 10 Jan 2019 22:01:04 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

Here's the set of 2 patches against the 'devel' branch of Simon Horman's 'renesas.git'
repo, the 2 patches adding R8A77980 support (posted before NY), and the Renesas RPC-IF driver/bindings patches v5. We're adding support for the R-Car V3M (R8A77970) RPC-IF
(which needs a special handling)...

[1/2] dt-bindings: spi: renesas-rpc: document R8A77970 bindings
[2/2] spi-renesas-rpc: add R8A77970 support 

MBR, Sergei
