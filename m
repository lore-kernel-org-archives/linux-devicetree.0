From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 00/18] ARM64: meson: DT cleanups
Date: Mon, 23 Jan 2017 10:46:46 -0800
Message-ID: <m2bmux397t.fsf@baylibre.com>
References: <20170120222118.21476-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120222118.21476-1-afaerber@suse.de> ("Andreas
 =?utf-8?Q?F=C3=A4rber=22's?=
        message of "Fri, 20 Jan 2017 23:21:00 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Hello,
>
> This series fixes several cosmetic issues, on top of v4.11/dt64 branch.
>
> Patches 3-5 rename a node, the rest should all be non-functional changes.

Can you respin patches 1-9 with minor comments addressed and
acks/reviews collected and I'll apply those.

> Patches 10-18 could be squashed if desired.

I'm less sure about these as I tend to agree with Rob that this is just
needless churn.  If you want to resend those separately, making your
arguments, I'll merge it if you convice the DT maintainers. :)

Kevin
