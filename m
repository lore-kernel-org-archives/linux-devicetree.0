From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 2/2] PCI: Rockchip: Add Rockchip PCIe controller
 support
Date: Wed, 22 Jun 2016 18:35:27 -0700
Message-ID: <20160623013527.GA46876@google.com>
References: <1466041835-1695-1-git-send-email-shawn.lin@rock-chips.com>
 <20160623002919.GA21157@google.com>
 <dcdc3402-22d9-473a-d9ae-b9bd994c24a6@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dcdc3402-22d9-473a-d9ae-b9bd994c24a6@rock-chips.com>
Sender: linux-pci-owner@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci@vger.kernel.org, Wenrui Li <wenrui.li@rock-chips.com>, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Jun 23, 2016 at 09:09:46AM +0800, Shawn Lin wrote:
> =E5=9C=A8 2016/6/23 8:29, Brian Norris =E5=86=99=E9=81=93:
> >On Thu, Jun 16, 2016 at 09:50:35AM +0800, Shawn Lin wrote:

[...]

> >>+	/* 500ms timeout value should be enough for gen1/2 taining */
> >>+	timeout =3D jiffies + msecs_to_jiffies(500);
> >>+
> >>+	err =3D -ETIMEDOUT;
> >>+	while (time_before(jiffies, timeout)) {
> >>+		status =3D pcie_read(port, PCIE_CLIENT_BASIC_STATUS1);
> >>+		if (((status >> PCIE_CLIENT_LINK_STATUS_SHIFT) &
> >>+		      PCIE_CLIENT_LINK_STATUS_MASK) =3D=3D
> >>+		      PCIE_CLIENT_LINK_STATUS_UP) {
> >>+			dev_dbg(port->dev, "pcie link training gen1 pass!\n");
> >>+			err =3D 0;
> >>+			break;
> >>+		}
> >>+		msleep(20);
> >>+	}
> >
> >Technically, the above timeout loop is not quite correct. Possible e=
rror
> >case: we can fail with a timeout after 500 ms if the training comple=
tes
> >between the 480-500 ms time window. This can happen because you're
> >doing:
> >
> >(1) read register: if complete, then terminate successfully
> >(2) delay
> >(3) check for timeout: if time is up, return error
> >
> >You actually need:
> >
> >(1) read register: if complete, then terminate successfully
> >(2) delay
> >(3) check for timeout: if time is up, repeat (1), and then report er=
ror
> >
> >You can examine the logic for readx_poll_timeout() in
> >include/linux/iopoll.h to see an example of a proper timeout loop. Y=
ou
> >could even try to use one of the helpers there, except that your
> >pcie_read() takes 2 args.
>=20
> I see, thanks.
>=20
> >
> >>+	if (err) {
> >>+		dev_err(port->dev, "pcie link training gen1 timeout!\n");
> >>+		return err;
> >>+	}
> >>+
> >>+	/*
> >>+	 * Enable retrain for gen2. This should be configured only after
> >>+	 * gen1 finished.
> >>+	 */
> >>+	status =3D pcie_read(port,
> >>+			   PCIR_RC_CONFIG_LCS + PCIE_RC_CONFIG_BASE);
> >>+	status |=3D PCIE_CORE_LCSR_RETAIN_LINK;
> >>+	pcie_write(port, status,
> >>+		   PCIR_RC_CONFIG_LCS + PCIE_RC_CONFIG_BASE);
> >
> >I'm not really an expert on this, but how are you actually "retraini=
ng
> >for gen2"? Is that just the behavior of the core, that it retries at=
 the
> >higher rate on the 2nd training attempt? I'm just confused, since yo=
u
> >set PCIE_CLIENT_GEN_SEL_2 above, so you've already allowed either ge=
n1
> >or gen2 negotiation AFAICT, and so seemingly you might already have
> >negotiated at gen2.
>=20
>=20
> Not really. I allow the core to enable gen2, but it needs a extra
> setting of retrain after finishing gen1. It's not so strange as it
> depends on the vendor's design. So I have to say it fits the
> designer's expectation.

OK.

> >>+	err =3D -ETIMEDOUT;
> >>+
> >>+	while (time_before(jiffies, timeout)) {
> >
> >You never reset 'timeout' when starting this loop. So you only have =
a
> >cumulative 500 ms to do both the gen1 and gen2 loops. Is that
> >intentional? (I feel like this comment was made on an earlier revisi=
on
> >of this driver, though I haven't read everything thoroughly.)
>=20
> yes, I don't have any docs to let me know how long should I wait for
> gen1/2 to be finished. Maybe someday it will be augmented to a larger
> value if finding a device actually need a longer time. But the only
> thing I can say is that it's from my test for many pcie devices
> currently.
>=20
>=20
> Do you agree?

I'm not suggesting increasing the timeout, exactly; I'm suggesting that
you should set some minimum timeout for each training loop, instead of
reusing the same deadline. i.e., something like this before the second
loop:

	/* Reset the deadline for gen2 */
	timeout =3D jiffies + msecs_to_jiffies(500);

As it stands, if the first loop takes 490 ms, that leaves you only 10 m=
s
for the second loop. And I think it'd be confusing if we ever see the
first loop take a "long" time, and then we time out on the second --
we'd be blaming the gen2 training for gen1's slowness.

> >>+		status =3D pcie_read(port, PCIE_CORE_CTRL_MGMT_BASE);
> >>+		if (((status >> PCIE_CORE_PL_CONF_SPEED_SHIFT) &
> >>+		      PCIE_CORE_PL_CONF_SPEED_MASK) =3D=3D
> >>+		      PCIE_CORE_PL_CONF_SPEED_50G) {
> >>+			dev_dbg(port->dev, "pcie link training gen2 pass!\n");
> >>+			err =3D 0;
> >>+			break;
> >>+		}
> >>+		msleep(20);
> >>+	}
> >
> >Similar problem with your timeout loop, as mentioned above. Although=
 I
> >confused about what you do in the error case here...
> >
> >>+	if (err)
> >>+		dev_dbg(port->dev, "pcie link training gen2 timeout, force to ge=
n1!\n");
> >
> >... how are you forcing gen1? I don't see any code that indicates th=
is.
> >Should you at least be checking that there aren't some kind of train=
ing
> >errors, and that we settled back on gen1/2.5G?
>=20
> yes, when failing gen2,  my pcie controller will fallback to gen1
> automatically.

OK. Well maybe the text should say something like "falling back" instea=
d
of "force"?

> if we pass the gen1 then fail to train gen2, a dbg msg here is enough
> here to let we know that we should check the HW signal. Of course we
> should make sure that this device supports gen2.

OK.

[...]

Brian
