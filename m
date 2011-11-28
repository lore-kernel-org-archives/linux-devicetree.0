From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH] of/irq: of_irq_init: add check for parent equal to
 child node
Date: Mon, 28 Nov 2011 10:54:46 +0000
Message-ID: <1322477686.3164.31.camel@hornet.cambridge.arm.com>
References: <1322448550-15392-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1322448550-15392-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Sun, 2011-11-27 at 20:49 -0600, Rob Herring wrote:
> From: Rob Herring <rob.herring@calxeda.com>
>=20
> With the revert of "of/irq: of_irq_find_parent: check for parent equa=
l to
> child" (dc9372808412edb), we need another way to handle parent node e=
qual
> to the child node. This can simply be handled in of_irq_init by check=
ing
> for this condition.
>=20
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

Works for me, thanks!

Tested-by: Pawel Moll <pawel.moll@arm.com>

Cheers!

Pawe=C5=82
