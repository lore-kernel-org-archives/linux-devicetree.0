From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Refactor device tree maintainership
Date: Mon, 22 Jul 2013 17:50:51 +0100
Message-ID: <1374511851.3609.10.camel@hornet>
References: <1374290388-19308-1-git-send-email-grant.likely@linaro.org>
	 <1374290388-19308-3-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1374290388-19308-3-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, 2013-07-20 at 04:19 +0100, Grant Likely wrote:
> +F:	include/dt-bindings

One thing we didn't finish talking about was the question if this
directory is supposed to contain *.dtsi files as well? The obvious
problem I have is a vexpress motherboard being (well, actually not bein
right now) shared between arch/arm/boot/dts and arch/arm64/boot/dts.

Pawel
