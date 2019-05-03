Return-Path: <SRS0=1IWS=TD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44779 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbfECONK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 May 2019 10:13:10 -0400
Subject: Re: [PATCH 2/3] clk: add BCM63XX gated clock controller driver
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-3-jonas.gorski@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a8e757f2-c8e8-8aff-0d88-ef86b8241be7@amsat.org>
Date: Fri, 3 May 2019 16:13:05 +0200
MIME-Version: 1.0
In-Reply-To: <20190502122657.15577-3-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 5/2/19 2:26 PM, Jonas Gorski wrote:
> Add a driver for the gated clock controller found on MIPS based BCM63XX
> SoCs.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
