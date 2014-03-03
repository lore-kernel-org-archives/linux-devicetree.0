From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [PATCH 1/1] Consistently use xrealloc instead of realloc
Date: Mon, 03 Mar 2014 01:00:22 +0100
Message-ID: <5313C616.9010104@gmx.de>
References: <1393792741-29043-1-git-send-email-xypron.glpk@gmx.de> <20140302234140.GD12916@voom.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140302234140.GD12916@voom.fritz.box>
Sender: linux-kernel-owner@vger.kernel.org
To: David Gibson <david@gibson.dropbear.id.au>
Cc: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, jdl@jdl.com, devicetree-compiler@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Note that in general dtc patches should be CCed to myself and Jon
> Loeliger <jdl@jdl.com>, the dtc maintainers.
>

This is the relevant section in file MAINTAINERS of Torvald's git.
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS

OPEN FIRMWARE AND FLATTENED DEVICE TREE
M:  Grant Likely <grant.likely@linaro.org>
M:  Rob Herring <robh+dt@kernel.org>
L:  devicetree@vger.kernel.org
W:  http://fdt.secretlab.ca
T:  git git://git.secretlab.ca/git/linux-2.6.git
S:  Maintained
F:  drivers/of/
F:  include/linux/of*.h
F:  scripts/dtc/
K:  of_get_property
K:  of_match_table

If the information is not accurate, please, have it updated.

Best regards

Heinrich Schuchardt
