Return-Path: <SRS0=MJnr=R5=intenta.de=prvs=0988596c6b=helmut.grohne@kernel.org>
Date: Tue, 26 Mar 2019 12:53:38 +0100
From: Helmut Grohne <helmut.grohne@intenta.de>
Subject: What is arm,amba-primecell?
Message-ID: <20190326115337.buoxwqhmdj3gacxy@laureti-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

I stumbled into a compatible property valued arm,amba-primecell and
wondered what it means. Thus I started looking in the kernel source:

linux$ git grep arm,amba-primecell v5.1-rc2
Documentation/devicetree/usage-model.txt:be too invasive.  If a node is compatible with "arm,amba-primecell", then
arch/arm/boot/dts/nspire.dtsi:                          compatible = "arm,amba-primecell";
linux$

Such rare usage seems strange. Is this a mistake? Is it that these two
files need a s/arm,amba-primecell/arm,primecell/?

Helmut
