From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 2/5] ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual
 initial support
Date: Wed, 21 Sep 2016 13:46:22 -0300
Message-ID: <CAOMZO5CnP3=CNnQcOzra7eQ-cAwProgH+Kws0FHVOw7Q6nCDow@mail.gmail.com>
References: <1473618641-10159-1-git-send-email-jagan@amarulasolutions.com>
 <1473618641-10159-3-git-send-email-jagan@amarulasolutions.com>
 <CAOMZO5CsrrqqUPaVbU-ya79VSXgxyspa_fbr8HY1voJgpy2LLg@mail.gmail.com>
 <CAMty3ZDKrXxmwDFxSBvL_anJQPdXEfnJ40uNv5B6KssQyJJKhA@mail.gmail.com>
 <CAOMZO5B_ahBJr_Tgz_HShmG9heUwCj4K0N3FHhxja1yg0gCUGA@mail.gmail.com> <CAOf5uw=bMMa98RP=kvA=NfS89TWOEqU3Q2HjpEmzUTVrdg2=sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOf5uw=bMMa98RP=kvA=NfS89TWOEqU3Q2HjpEmzUTVrdg2=sQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Trimarchi <michael@amarulasolutions.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jagan Teki <jagannadh.teki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Matteo Lisi <matteo.lisi@engicam.com>
List-Id: devicetree@vger.kernel.org

Hi Michael,

On Tue, Sep 20, 2016 at 10:23 AM, Michael Trimarchi
<michael@amarulasolutions.com> wrote:

> Engicam use fixed regulator always on and on on boot. Their board does
> not have any
> external pmu. Is this answer to your comment?

All I am saying is that  "regulator-boot-on" and "regulator-always-on"
properties should be removed.

The "reg_3p3v" regulator will be turned on and off by the flexcan driver.
