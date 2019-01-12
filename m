Return-Path: <SRS0=+lSs=PU=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH RFC 0/3] Add R8A779{7|8}0 RPC-IF support
Message-ID: <4b74a2a5-6b3b-9b06-6a8f-fce39124ec59@cogentembedded.com>
Date: Sat, 12 Jan 2019 20:41:24 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
'renesas-devel-20190110-v5.0-rc1' tag. I'm adding the RPC-IF device nodes
for R8A77970/R8A77980 (based on the RPC-IF driver which is still a work in
progress) and describing the QSPI flashes connected to RPC-IF on the Eagle/
Condor and V3M/V3H Starter Kit boards...

[1/3] arm64: dts: renesas: r8a779{7|8}0: add RPC-IF support
[2/3] arm64: dts: renesas: r8a77970: eagle/v3msk: add QSPI flash support
[3/3] arm64: dts: renesas: r8a77980: condor/v3hsk: add QSPI flash support

WBR, Sergei
