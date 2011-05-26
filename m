From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC PATCH v3 1/2] drivers/amba: create devices from device tree
Date: Thu, 26 May 2011 09:41:06 +0200
Message-ID: <BANLkTimq=6UGTHVL=r2GQZJaKMBH7X6wqw@mail.gmail.com>
References: <1306359073-16274-1-git-send-email-robherring2@gmail.com>
	<1306359073-16274-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1306359073-16274-2-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux@arm.linux.org.uk, arnd@arndb.de, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

2011/5/25 Rob Herring <robherring2@gmail.com>:

Trivia:

> + =A0 =A0 =A0 /* Allow the arm,amba-deviceid value to override the h/w va=
lue */
> + =A0 =A0 =A0 prop =3D of_get_property(node, "arm,amba-deviceid", NULL);
> + =A0 =A0 =A0 if (prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev->periphid =3D of_read_ulong(prop, 1);

That currently does not override the H/W value at all. But when/if patch
http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3D6829/1
gets merged, it eventually will.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
