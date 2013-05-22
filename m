From: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/6] drivers: bus: add a new driver for WEIM
Date: Wed, 22 May 2013 16:16:19 +0800
Message-ID: <519C7ED3.3030004@freescale.com>
References: <1369039742-10893-1-git-send-email-b32955@freescale.com> <1369039742-10893-2-git-send-email-b32955@freescale.com> <20130521054323.GE3080@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130521054323.GE3080@S2101-09.ap.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8821=E6=97=A5 13:43, Shawn Guo =E5=86=99=
=E9=81=93:
> It seems we can find it out from "reg" property, so that we can save
> this property?
>
we may have several devices attaching to the weim, each device has its=20
own CS index.
it's better to keep this property, make it more clear.

thanks
Huang Shijie
