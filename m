From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] gpio: Add driver for Zynq GPIO controller
Date: Thu, 10 Jul 2014 10:57:16 +0200
Message-ID: <CACRpkdZb1jDh2_bAvjj5SPsG3k4Sr8nTEjiVR29dNx9rS5a0_g@mail.gmail.com>
References: <1403091577-10232-1-git-send-email-harinik@xilinx.com>
	<5cc8b89b-20ff-4fa9-92dd-bb2f6d3512d8@BY2FFO11FD030.protection.gbl>
	<CACRpkdb1M3-hrSKLKWz21LCJ1sMvsq5E-aqkpmVhy0NwOS5HhA@mail.gmail.com>
	<d1af864d-bf78-48bb-a545-8de3f9def75f@BL2FFO11FD037.protection.gbl>
	<CACRpkdYSU6NdFuab6rJS7eADSqORNDBzbFfJ65nFoJj3EZVd-g@mail.gmail.com>
	<3adb614c-38ae-4b0c-9e50-99f071bbf4c5@BL2FFO11FD038.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <3adb614c-38ae-4b0c-9e50-99f071bbf4c5@BL2FFO11FD038.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
Cc: Harini Katakam <harini.katakam@xilinx.com>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Michal Simek <michal.simek@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Harini Katakam <harinikatakamlinux@gmail.com>, Harini Katakam <harinik@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 8, 2014 at 5:55 PM, S=C3=B6ren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> I fully agree and you don't have to convince me. But to a lot of our
> customers that are used to use FPGAs, SOCs and Linux are pretty new. =
You
> see a lot of scary stuff. Accessing /dev/mem seems to be a lot of
> people's big hammer solution for everything. Then I always perceive i=
t
> as great progress if things like the sysfs interface are used instead=
=2E

Well as upstream maintainer I really don't differentiate on the level
of badness of different bad solutions, none of them are really helpful
to the community, only to some specific user, so they get to carry the
quirks...

Yours,
Linus Walleij
