From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v5 00/10] media: make Marvell camera work on DT-based OLPC XO-1.75
Date: Sun,  5 May 2019 16:00:21 +0200
Message-ID: <20190505140031.9636-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>, jacopo mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@iki.fi>
List-Id: devicetree@vger.kernel.org

Hi,

this is the fifth spin of a patchset that modernizes the Marvell MMP2 CCI=
C
driver, making it work on DT-based systems such as OLPC XO-1.75 laptop.

At the core of the rework is the move to asynchronous sensor discovery
and clock management with the standard clock framework. There are also
some straightforward fixes for the bitrotten parts.

Compared the the previous version it just fixes issues with the device
bindings, pointed out by Sakari Ailus, in patch [01/10].

Tested on OLPC XO-1 and OLPC XO-1.75.

Thanks,
Lubo
