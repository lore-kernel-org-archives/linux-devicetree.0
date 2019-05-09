Return-Path: <SRS0=yXcy=TJ=gmail.com=thierry.reding@kernel.org>
Date: Thu, 9 May 2019 16:10:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 04/28] PCI: tegra: Disable PCIe interrupts in runtime
 suspend
Message-ID: <20190509141059.GD8907@ulmo>
References: <20190423092825.759-1-mmaddireddy@nvidia.com>
 <20190423092825.759-5-mmaddireddy@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline
In-Reply-To: <20190423092825.759-5-mmaddireddy@nvidia.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 02:58:01PM +0530, Manikanta Maddireddy wrote:
> Disable PCIe interrupts in runtime suspend to avoid executing irq handler
> and power off sequence in parallel.
>=20
> Following sequence triggers such scenario,
>  - tegra_pcie_remove() triggers runtime suspend
>  - pex_rst is asserted in runtime suspend
>  - PRSNT_MAP bit field in RP_PRIV_MISC register changes from EP_PRSNT to
>    EP_ABSNT
>  - This is sensed by AFI and triggers "Slot present pin change" interrupt
>  - tegra_pcie_isr() function accesses AFI register when runtime suspend
>    is going through power off sequence

This sounds like more of a workaround than a proper solution. If the
above sequence crashes, it means that we have a bug somewhere in that
sequence. By the time the controller is runtime suspended, we should
have shut everything down already.

That said, from the looks of it, I think we may be able to fix this by
moving the pm_runtime_*() calls in tegra_pcie_remove() below the
tegra_pcie_put_resources(). At that point, nothing should be accessing
any registers anymore.

Thierry

>=20
> rmmod pci-tegra
>  pci_generic_config_write32: 108 callbacks suppressed
>  pci_bus 0002:00: 2-byte config write to 0002:00:02.0 offset 0x4c may cor=
rupt adjacent RW1C bits
>  pci_bus 0002:00: 2-byte config write to 0002:00:02.0 offset 0x9c may cor=
rupt adjacent RW1C bits
>  pci_bus 0002:00: 2-byte config write to 0002:00:02.0 offset 0x88 may cor=
rupt adjacent RW1C bits
>  pci_bus 0002:00: 2-byte config write to 0002:00:02.0 offset 0x90 may cor=
rupt adjacent RW1C bits
>  pci_bus 0002:00: 2-byte config write to 0002:00:02.0 offset 0x4 may corr=
upt adjacent RW1C bits
>  igb 0002:04:00.1: removed PHC on enP2p4s0f1
>  igb 0002:04:00.0: removed PHC on enP2p4s0f0
>  pci_bus 0002:00: 2-byte config write to 0002:00:01.0 offset 0x4c may cor=
rupt adjacent RW1C bits
>  pci_bus 0002:00: 2-byte config write to 0002:00:01.0 offset 0x9c may cor=
rupt adjacent RW1C bits
>  pci_bus 0002:00: 2-byte config write to 0002:00:01.0 offset 0x88 may cor=
rupt adjacent RW1C bits
>  pci_bus 0002:00: 2-byte config write to 0002:00:01.0 offset 0x90 may cor=
rupt adjacent RW1C bits
>  pci_bus 0002:00: 2-byte config write to 0002:00:01.0 offset 0x4 may corr=
upt adjacent RW1C bits
>  rcu: INFO: rcu_preempt self-detected stall on CPU
>  SError Interrupt on CPU0, code 0xbf000002 -- SError
>  CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.1.0-rc3-next=
-20190405-00027-gcd8110499e6f-dirty #42
>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
>  pstate: 20000085 (nzCv daIf -PAN -UAO)
>  pc : tegra_pcie_isr+0x58/0x178 [pci_tegra]
>  lr : tegra_pcie_isr+0x40/0x178 [pci_tegra]
>  sp : ffff000010003da0
>  x29: ffff000010003da0 x28: 0000000000000000
>  x27: ffff8000f9e61000 x26: ffff000010fbf420
>  x25: ffff000011427f93 x24: ffff8000fa600410
>  x23: ffff00001129d000 x22: ffff00001129d000
>  x21: ffff8000f18bf3c0 x20: 0000000000000070
>  x19: 00000000ffffffff x18: 0000000000000000
>  x17: 0000000000000000 x16: 0000000000000000
>  x15: 0000000000000000 x14: ffff000008d40a48
>  x13: ffff000008d40a30 x12: ffff000008d40a20
>  x11: ffff000008d40a10 x10: ffff000008d40a00
>  x9 : ffff000008d409e8 x8 : ffff000008d40ae8
>  x7 : ffff000008d40ad0 x6 : ffff000010003e58
>  x5 : ffff8000fac00248 x4 : 0000000000000000
>  x3 : ffff000008d40b08 x2 : fffffffffffffff8
>  x1 : ffff000008d3f4e8 x0 : 00000000ffffffff
>  Kernel panic - not syncing: Asynchronous SError Interrupt
>  CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.1.0-rc3-next=
-20190405-00027-gcd8110499e6f-dirty #42
>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
>  Call trace:
>   dump_backtrace+0x0/0x158
>   show_stack+0x14/0x20
>   dump_stack+0xa8/0xcc
>   panic+0x140/0x2f4
>   nmi_panic+0x6c/0x70
>   arm64_serror_panic+0x74/0x80
>   __pte_error+0x0/0x28
>   el1_error+0x84/0xf8
>   tegra_pcie_isr+0x58/0x178 [pci_tegra]
>   __handle_irq_event_percpu+0x70/0x198
>   handle_irq_event_percpu+0x34/0x88
>   handle_irq_event+0x48/0x78
>   handle_fasteoi_irq+0xb4/0x190
>   generic_handle_irq+0x24/0x38
>   __handle_domain_irq+0x5c/0xb8
>   gic_handle_irq+0x58/0xa8
>   el1_irq+0xb8/0x180
>   cpuidle_enter_state+0x138/0x358
>   cpuidle_enter+0x18/0x20
>   call_cpuidle+0x1c/0x48
>   do_idle+0x230/0x2d0
>   cpu_startup_entry+0x20/0x28
>   rest_init+0xd4/0xe0
>   arch_call_rest_init+0xc/0x14
>   start_kernel+0x444/0x470
>=20
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
> V2: This is new patch in V2
>=20
>  drivers/pci/controller/pci-tegra.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/=
pci-tegra.c
> index bb3c0af9c830..8c0ad038699d 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -1622,6 +1622,18 @@ static int tegra_pcie_disable_msi(struct tegra_pci=
e *pcie)
>  	return 0;
>  }
> =20
> +static void tegra_pcie_disable_interrupts(struct tegra_pcie *pcie)
> +{
> +	u32 value;
> +
> +	value =3D afi_readl(pcie, AFI_INTR_MASK);
> +	value &=3D ~AFI_INTR_MASK_INT_MASK;
> +	afi_writel(pcie, value, AFI_INTR_MASK);
> +
> +	if (IS_ENABLED(CONFIG_PCI_MSI))
> +		tegra_pcie_disable_msi(pcie);
> +}
> +
>  static int tegra_pcie_get_xbar_config(struct tegra_pcie *pcie, u32 lanes,
>  				      u32 *xbar)
>  {
> @@ -2466,6 +2478,11 @@ static int __maybe_unused tegra_pcie_pm_suspend(st=
ruct device *dev)
>  		tegra_pcie_pme_turnoff(port);
> =20
>  	tegra_pcie_disable_ports(pcie);
> +	/*
> +	 * disable interrupts to avoid executing irq handler in parallel
> +	 * to power off sequence.
> +	 */
> +	tegra_pcie_disable_interrupts(pcie);
> =20
>  	if (pcie->soc->program_uphy) {
>  		err =3D tegra_pcie_phy_power_off(pcie);
> --=20
> 2.17.1
>=20

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzUNPMACgkQ3SOs138+
s6F8dw/+LnfeGYhNDpjhjszuq/mvuXFTaRtQSqUCXFetOSddd3PLXDmmp6natUyi
V9HWjE48XuWOYsdIRHWCo2FuaOhxiS3CkOhKk+K7uxrdhzIfKEkRpSXCAndLs3xX
uccPSaURnTFxB6ebFmgbFA2BBuEXIZAJGivXiTiRZQ66tgrmmfgF2WMmF9gXlMTr
t5aPZ9caP4SvenYm1QQILNoBxGvpG9rhJvzBc7Ozd2X98X0zY7vHBf68tx4ZWmQY
VwIe9Ap8Sm5NXIU98vu2mL5HS7W/yp0K7sXy7/QmoVqKdh8Dx6BjTais6o1n9Dhb
idmOanK9xUsRrxnRu26YafN7BxUsdmUJcq77IN9wtSAxjBNdwqOBJ6Ap5Jrm7IxY
hZprI/xs9NFfhZuveu7GzIMuGG2SL98BeOQNwSjIPIKKYSxO15jO478yjewLVwmu
xi37j8iFdJFMoUnz3OxTb8HQ8ePEcOD1F//ph4TnoLXvAwzeNlcd2fc9cQwxEArU
tLOovjE8YjVBZvjl+kP8LDLgjTgpMlCorE2wc78StsAGUfCwra8Go2hvV3jj1oU9
LRRHl201pKj//vWJh6Pf/2wqRMHmOuDVKRjsozU/TLieWSnIZ4JSUn/Q7HyJX91Z
XlyJSYXqGaE2FmoZ7LPf9D/9mInyv7NN6pQHD77m3qcqkBpm5W8=
=6Pgt
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
