From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 0/6] ARM: A couple of SoC license header fixes
Date: Tue, 11 Jun 2019 09:29:15 +0200
Message-ID: <20190611072921.2979446-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Wei Xu <xuwei5@hisilicon.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Patrice Chotard <patrice.chotard@st.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

There's one particular typo in the license header ("publishhed") that see=
ms
to have spread through the tree by copy-pasting. This patch set fixes the
occurences within mach-*/ and dts/ by replacing the header with a SPDX
identifier.

Lubo
