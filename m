Return-Path: <SRS0=wSxN=LE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45742 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727650AbeHUTVx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Aug 2018 15:21:53 -0400
MIME-Version: 1.0
References: <92555b9110d94f5689a3ab59c1b31387635e7178.1533199116.git.marvin24@gmx.de>
In-Reply-To: <92555b9110d94f5689a3ab59c1b31387635e7178.1533199116.git.marvin24@gmx.de>
From: Nicolas Chauvet <kwizart@gmail.com>
Date: Tue, 21 Aug 2018 18:00:57 +0200
Message-ID: <CABr+WTmTkT2QvugDgb0YNfMmqcAsXsHkNH5v3maZLib2-RTsNQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: paz00: fix wakeup gpio keycode
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: marvin24@gmx.de
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Le jeu. 2 ao=C3=BBt 2018 =C3=A0 10:47, Marc Dietrich <marvin24@gmx.de> a =
=C3=A9crit :
>
> The power key is controlled solely by the EC, which only tiggeres this
> gpio after wakeup.
> Fixes immediately return to suspend after wake from LP1.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
It was reported to work on the device with a (yet little custom)
distro kernel based on fedora 4.18.1-300.fc28.armv7hl

Thx

--=20
-

Nicolas (kwizart)
