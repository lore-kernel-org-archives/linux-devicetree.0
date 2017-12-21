From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] ARM: dts: imx: Add memory node unit name
Date: Thu, 21 Dec 2017 09:07:36 +0100
Message-ID: <20171221090736.3ac9d5db@karo-electronics.de>
References: <1512575989-15627-1-git-send-email-marcofrk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1512575989-15627-1-git-send-email-marcofrk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Franchi <marcofrk@gmail.com>
Cc: shawnguo@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed,  6 Dec 2017 13:59:49 -0200 Marco Franchi wrote:
> Fix the following warnings from dtc by adding the unit name to memory 
> nodes:
> 
> Warning (unit_address_vs_reg): Node /memory has a reg or ranges property, but no unit name
> 
> Converted using the following command:
> 
> perl -p0777i -e 's/memory \{\n\t\treg = \<0x+([0-9a-f])/memory\@$1$\0000000 \{\n\t\treg = <0x$1/m' `find ./arch/arm/boot/dts -name "imx*"`
> 
> The files below were manually fixed:
> -imx1-ads.dts
> -imx1-apf9328.dts
> 
The imx*.dtsi files all have this:
|	memory { device_type = "memory"; reg = <0 0>; };
Thus you will end up with a 'memory' node with a reg = <0 0> entry and
an additional 'memory@...' node with the correct 'reg' values.


Lothar Waßmann
