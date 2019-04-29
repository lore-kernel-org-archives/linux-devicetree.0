From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4 00/14] media: make Marvell camera work on DT-based OLPC XO-1.75
Date: Mon, 29 Apr 2019 11:16:22 +0200
Message-ID: <20190429091632.2462285-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>, jacopo mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@iki.fi>
List-Id: devicetree@vger.kernel.org


Hi,

this is the fourth spin of a patchset that modernizes the Marvell MMP2 CC=
IC
driver.

At the core of the rework is the move to asynchronous sensor discovery
and clock management with the standard clock framework. There are also
some straightforward fixes for the bitrotten parts.

Compared the the previous version it addresses things pointed out in last
review, in patches [01/10] and [10/10]. Details in the changelogs of
the individual patches.

Tested on OLPC XO-1 and OLPC XO-1.75 laptops.

Thanks,
Lubo
