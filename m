From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 0/4] Ingenic JZ47xx NEMC patchset V3
Date: Tue,  5 Feb 2019 00:52:36 -0300
Message-ID: <20190205035240.31410-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Since the V2 of my patchset I could test it on the JZ4740, and see
that the hardware is the exact same as on the JZ4725B.

As the JZ4740 is already fully upstream, and also older, I now add
support for the JZ4740 instead of the JZ4725B.

The only patches modified since v2 are the 1/4 and 4/4, and the change
is a dumb rename of '4725b' into '4740', so I kept the Reviewed-by: for
these two. I hope it's OK.

Cheers,
-Paul
