From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 0/3] regulator: dt: add policy to match regulator with
 prop "regulator-compatible"
Date: Wed, 20 Jun 2012 10:59:32 +0200
Message-ID: <CACRpkdYSLiLZwVwY1tU9PWGTx2EGP6OykeXE5rtwRKAHror-Yg@mail.gmail.com>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, devicetree-discuss@lists.ozlabs.org
Cc: broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, lrg@ti.com, lee.jones@linaro.org, swarren@wwwdotorg.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 19, 2012 at 4:28 PM, Laxman Dewangan <ldewangan@nvidia.com>=
 wrote:

> add policy to match regulator with the property of "regulator-compati=
ble" of each
> child regulator node with their hardware counterparts name.
> Modify documentation as well to reflect this change and dts files.
>
> Changes from V1:
> - Modify the existing of_regulator_match() to use the property
> =A0"regulator-compatible" of each child node of regulator for
> =A0 matching rather than child node name.
> - Documentation change to reflect this policy who are using the
> =A0of_regulator_match().
> - Modify the dts file to absorb this policy.

If I had today deployed the device trees generated prior to this patch,
and try to boot kernels after this patch with the same device tree,
would they still work as expected?

I don't know it it's an issue right now, but at some point we need to
realize that people will expect old device trees to work on newer
kernels.

Yours,
Linus Walleij
