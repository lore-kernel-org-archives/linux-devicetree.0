Return-Path: <jingoohan1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1446111638-197070-3-git-send-email-wangzhou1@hisilicon.com>
References: <1446111638-197070-1-git-send-email-wangzhou1@hisilicon.com>
	<1446111638-197070-3-git-send-email-wangzhou1@hisilicon.com>
Date: Fri, 30 Oct 2015 10:27:20 +0900
Message-ID: <CAPOBaE4A-Z4C+dChKuX0bu27RT49fo+FCp_4z5qMJmjQiDHG3g@mail.gmail.com>
Subject: Re: [PATCH v13 2/6] PCI: designware: Remove *_mod_base
From: Han Jingoo <jingoohan1@gmail.com>
Content-Type: multipart/alternative; boundary=089e0117646d3200f005234854e7
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, "pratyush.anand@gmail.com" <pratyush.anand@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "rmk+kernel@arm.linux.org.uk" <rmk+kernel@arm.linux.org.uk>, "thomas.petazzoni@free-electrons.com" <thomas.petazzoni@free-electrons.com>, "gabriele.paoloni@huawei.com" <gabriele.paoloni@huawei.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "james.morse@arm.com" <james.morse@arm.com>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "robh@kernel.org" <robh@kernel.org>, "gabriel.fernandez@linaro.org" <gabriel.fernandez@linaro.org>, "Minghuan.Lian@freescale.com" <Minghuan.Lian@freescale.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "zhangjukuo@huawei.com" <zhangjukuo@huawei.com>, "qiuzhenfa@hisilicon.com" <qiuzhenfa@hisilicon.com>, "liudongdong3@huawei.com" <liudongdong3@huawei.com>, "qiujiang@huawei.com" <qiujiang@huawei.com>, "xuwei5@hisilicon.com" <xuwei5@hisilicon.com>, "liguozhu@hisilicon.com" <liguozhu@hisilicon.com>, Han Jingoo <jingoohan1@gmail.com>
List-ID: <devicetree@vger.kernel.org>

--089e0117646d3200f005234854e7
Content-Type: text/plain; charset=UTF-8

Acked-by: Jingoo Han <jingoohan1@gmail.com>

2015. 10. 29. Thursday,  Zhou Wang<wangzhou1@hisilicon.com> wrote:

> This patch reverts commit f4c55c5a3f7f ("PCI: designware: Program ATU with
> untranslated address") based on 1/6 in this series. we delete *_mod_base in
> pcie-designware. This was discussed in [1]
>
> dw_pcie_setup which is called in pci_common_init_dev uses io_base, however,
> io_base had been modified in dra7xx_pcie_host_init in dw_pcie_host_init.
> So an
> io_base_tmp is added in struct pcie_port to store original io_base value.
> It
> will be deleted in "PCI: designware: Add ARM64 support" in which
> dw_pcie_setup
> will be removed.
>
> [1] http://www.spinics.net/lists/arm-kernel/msg436779.html
>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com <javascript:;>>
> Signed-off-by: Gabriele Paoloni <gabriele.paoloni@huawei.com
> <javascript:;>>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de <javascript:;>>
> Tested-by: James Morse <james.morse@arm.com <javascript:;>>
> Tested-by: Gabriel Fernandez <gabriel.fernandez@st.com <javascript:;>>
> Tested-by: Minghuan Lian <Minghuan.Lian@freescale.com <javascript:;>>
> Acked-by: Pratyush Anand <pratyush.anand@gmail.com <javascript:;>>
> ---
>  drivers/pci/host/pci-dra7xx.c      |  8 ++++----
>  drivers/pci/host/pcie-designware.c | 41
> ++++++++++----------------------------
>  drivers/pci/host/pcie-designware.h |  5 +----
>  3 files changed, 16 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/pci/host/pci-dra7xx.c b/drivers/pci/host/pci-dra7xx.c
> index 0b4847a..8c36880 100644
> --- a/drivers/pci/host/pci-dra7xx.c
> +++ b/drivers/pci/host/pci-dra7xx.c
> @@ -153,10 +153,10 @@ static void dra7xx_pcie_host_init(struct pcie_port
> *pp)
>  {
>         dw_pcie_setup_rc(pp);
>
> -       pp->io_mod_base &= DRA7XX_CPU_TO_BUS_ADDR;
> -       pp->mem_mod_base &= DRA7XX_CPU_TO_BUS_ADDR;
> -       pp->cfg0_mod_base &= DRA7XX_CPU_TO_BUS_ADDR;
> -       pp->cfg1_mod_base &= DRA7XX_CPU_TO_BUS_ADDR;
> +       pp->io_base &= DRA7XX_CPU_TO_BUS_ADDR;
> +       pp->mem_base &= DRA7XX_CPU_TO_BUS_ADDR;
> +       pp->cfg0_base &= DRA7XX_CPU_TO_BUS_ADDR;
> +       pp->cfg1_base &= DRA7XX_CPU_TO_BUS_ADDR;
>
>         dra7xx_pcie_establish_link(pp);
>         if (IS_ENABLED(CONFIG_PCI_MSI))
> diff --git a/drivers/pci/host/pcie-designware.c
> b/drivers/pci/host/pcie-designware.c
> index 75338a6..4e2dcd4 100644
> --- a/drivers/pci/host/pcie-designware.c
> +++ b/drivers/pci/host/pcie-designware.c
> @@ -365,11 +365,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
>         struct of_pci_range range;
>         struct of_pci_range_parser parser;
>         struct resource *cfg_res;
> -       u32 val, ns;
> -       const __be32 *addrp;
> -       int i, index, ret;
> -
> -       ns = of_n_size_cells(np);
> +       u32 val;
> +       int i, ret;
>
>         cfg_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "config");
>         if (cfg_res) {
> @@ -377,12 +374,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                 pp->cfg1_size = resource_size(cfg_res)/2;
>                 pp->cfg0_base = cfg_res->start;
>                 pp->cfg1_base = cfg_res->start + pp->cfg0_size;
> -
> -               /* Find the untranslated configuration space address */
> -               index = of_property_match_string(np, "reg-names",
> "config");
> -               addrp = of_get_address(np, index, NULL, NULL);
> -               pp->cfg0_mod_base = of_read_number(addrp, ns);
> -               pp->cfg1_mod_base = pp->cfg0_mod_base + pp->cfg0_size;
>         } else if (!pp->va_cfg0_base) {
>                 dev_err(pp->dev, "missing *config* reg space\n");
>         }
> @@ -409,18 +400,13 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                         pp->io_size = resource_size(&pp->io);
>                         pp->io_bus_addr = range.pci_addr;
>                         pp->io_base = range.cpu_addr;
> -
> -                       /* Find the untranslated IO space address */
> -                       pp->io_mod_base = range.cpu_addr;
> +                       pp->io_base_tmp = range.cpu_addr;
>                 }
>                 if (restype == IORESOURCE_MEM) {
>                         of_pci_range_to_resource(&range, np, &pp->mem);
>                         pp->mem.name = "MEM";
>                         pp->mem_size = resource_size(&pp->mem);
>                         pp->mem_bus_addr = range.pci_addr;
> -
> -                       /* Find the untranslated MEM space address */
> -                       pp->mem_mod_base = range.cpu_addr;
>                 }
>                 if (restype == 0) {
>                         of_pci_range_to_resource(&range, np, &pp->cfg);
> @@ -428,11 +414,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                         pp->cfg1_size = resource_size(&pp->cfg)/2;
>                         pp->cfg0_base = pp->cfg.start;
>                         pp->cfg1_base = pp->cfg.start + pp->cfg0_size;
> -
> -                       /* Find the untranslated configuration space
> address */
> -                       pp->cfg0_mod_base = range.cpu_addr;
> -                       pp->cfg1_mod_base = pp->cfg0_mod_base +
> -                                           pp->cfg0_size;
>                 }
>         }
>
> @@ -504,7 +485,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>
>         if (!pp->ops->rd_other_conf)
>                 dw_pcie_prog_outbound_atu(pp, PCIE_ATU_REGION_INDEX1,
> -                                         PCIE_ATU_TYPE_MEM,
> pp->mem_mod_base,
> +                                         PCIE_ATU_TYPE_MEM, pp->mem_base,
>                                           pp->mem_bus_addr, pp->mem_size);
>
>         dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
> @@ -542,12 +523,12 @@ static int dw_pcie_rd_other_conf(struct pcie_port
> *pp, struct pci_bus *bus,
>
>         if (bus->parent->number == pp->root_bus_nr) {
>                 type = PCIE_ATU_TYPE_CFG0;
> -               cpu_addr = pp->cfg0_mod_base;
> +               cpu_addr = pp->cfg0_base;
>                 cfg_size = pp->cfg0_size;
>                 va_cfg_base = pp->va_cfg0_base;
>         } else {
>                 type = PCIE_ATU_TYPE_CFG1;
> -               cpu_addr = pp->cfg1_mod_base;
> +               cpu_addr = pp->cfg1_base;
>                 cfg_size = pp->cfg1_size;
>                 va_cfg_base = pp->va_cfg1_base;
>         }
> @@ -557,7 +538,7 @@ static int dw_pcie_rd_other_conf(struct pcie_port *pp,
> struct pci_bus *bus,
>                                   busdev, cfg_size);
>         ret = dw_pcie_cfg_read(va_cfg_base + address, where, size, val);
>         dw_pcie_prog_outbound_atu(pp, PCIE_ATU_REGION_INDEX0,
> -                                 PCIE_ATU_TYPE_IO, pp->io_mod_base,
> +                                 PCIE_ATU_TYPE_IO, pp->io_base,
>                                   pp->io_bus_addr, pp->io_size);
>
>         return ret;
> @@ -577,12 +558,12 @@ static int dw_pcie_wr_other_conf(struct pcie_port
> *pp, struct pci_bus *bus,
>
>         if (bus->parent->number == pp->root_bus_nr) {
>                 type = PCIE_ATU_TYPE_CFG0;
> -               cpu_addr = pp->cfg0_mod_base;
> +               cpu_addr = pp->cfg0_base;
>                 cfg_size = pp->cfg0_size;
>                 va_cfg_base = pp->va_cfg0_base;
>         } else {
>                 type = PCIE_ATU_TYPE_CFG1;
> -               cpu_addr = pp->cfg1_mod_base;
> +               cpu_addr = pp->cfg1_base;
>                 cfg_size = pp->cfg1_size;
>                 va_cfg_base = pp->va_cfg1_base;
>         }
> @@ -592,7 +573,7 @@ static int dw_pcie_wr_other_conf(struct pcie_port *pp,
> struct pci_bus *bus,
>                                   busdev, cfg_size);
>         ret = dw_pcie_cfg_write(va_cfg_base + address, where, size, val);
>         dw_pcie_prog_outbound_atu(pp, PCIE_ATU_REGION_INDEX0,
> -                                 PCIE_ATU_TYPE_IO, pp->io_mod_base,
> +                                 PCIE_ATU_TYPE_IO, pp->io_base,
>                                   pp->io_bus_addr, pp->io_size);
>
>         return ret;
> @@ -680,7 +661,7 @@ static int dw_pcie_setup(int nr, struct pci_sys_data
> *sys)
>
>         if (global_io_offset < SZ_1M && pp->io_size > 0) {
>                 sys->io_offset = global_io_offset - pp->io_bus_addr;
> -               pci_ioremap_io(global_io_offset, pp->io_base);
> +               pci_ioremap_io(global_io_offset, pp->io_base_tmp);
>                 global_io_offset += SZ_64K;
>                 pci_add_resource_offset(&sys->resources, &pp->io,
>                                         sys->io_offset);
> diff --git a/drivers/pci/host/pcie-designware.h
> b/drivers/pci/host/pcie-designware.h
> index d0bbd27..2dbf649 100644
> --- a/drivers/pci/host/pcie-designware.h
> +++ b/drivers/pci/host/pcie-designware.h
> @@ -27,19 +27,16 @@ struct pcie_port {
>         u8                      root_bus_nr;
>         void __iomem            *dbi_base;
>         u64                     cfg0_base;
> -       u64                     cfg0_mod_base;
>         void __iomem            *va_cfg0_base;
>         u32                     cfg0_size;
>         u64                     cfg1_base;
> -       u64                     cfg1_mod_base;
>         void __iomem            *va_cfg1_base;
>         u32                     cfg1_size;
>         u64                     io_base;
> -       u64                     io_mod_base;
> +       u64                     io_base_tmp;
>         phys_addr_t             io_bus_addr;
>         u32                     io_size;
>         u64                     mem_base;
> -       u64                     mem_mod_base;
>         phys_addr_t             mem_bus_addr;
>         u32                     mem_size;
>         struct resource         cfg;
> --
> 1.9.1
>
>

--089e0117646d3200f005234854e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGJyPkFja2VkLWJ5OiBKaW5nb28gSGFuICZsdDs8YSBocmVmPSJtYWlsdG86amluZ29vaGFuMUBn
bWFpbC5jb20iPmppbmdvb2hhbjFAZ21haWwuY29tPC9hPiZndDs8YnI+PGJyPjIwMTUuIDEwLiAy
OS4gVGh1cnNkYXkswqDCoFpob3UgV2FuZyZsdDs8YSBocmVmPSJtYWlsdG86d2FuZ3pob3UxQGhp
c2lsaWNvbi5jb20iPndhbmd6aG91MUBoaXNpbGljb24uY29tPC9hPiZndDsgd3JvdGU6PGJyPjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2Jv
cmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPlRoaXMgcGF0Y2ggcmV2
ZXJ0cyBjb21taXQgZjRjNTVjNWEzZjdmICgmcXVvdDtQQ0k6IGRlc2lnbndhcmU6IFByb2dyYW0g
QVRVIHdpdGg8YnI+DQp1bnRyYW5zbGF0ZWQgYWRkcmVzcyZxdW90OykgYmFzZWQgb24gMS82IGlu
IHRoaXMgc2VyaWVzLiB3ZSBkZWxldGUgKl9tb2RfYmFzZSBpbjxicj4NCnBjaWUtZGVzaWdud2Fy
ZS4gVGhpcyB3YXMgZGlzY3Vzc2VkIGluIFsxXTxicj4NCjxicj4NCmR3X3BjaWVfc2V0dXAgd2hp
Y2ggaXMgY2FsbGVkIGluIHBjaV9jb21tb25faW5pdF9kZXYgdXNlcyBpb19iYXNlLCBob3dldmVy
LDxicj4NCmlvX2Jhc2UgaGFkIGJlZW4gbW9kaWZpZWQgaW4gZHJhN3h4X3BjaWVfaG9zdF9pbml0
IGluIGR3X3BjaWVfaG9zdF9pbml0LiBTbyBhbjxicj4NCmlvX2Jhc2VfdG1wIGlzIGFkZGVkIGlu
IHN0cnVjdCBwY2llX3BvcnQgdG8gc3RvcmUgb3JpZ2luYWwgaW9fYmFzZSB2YWx1ZS4gSXQ8YnI+
DQp3aWxsIGJlIGRlbGV0ZWQgaW4gJnF1b3Q7UENJOiBkZXNpZ253YXJlOiBBZGQgQVJNNjQgc3Vw
cG9ydCZxdW90OyBpbiB3aGljaCBkd19wY2llX3NldHVwPGJyPg0Kd2lsbCBiZSByZW1vdmVkLjxi
cj4NCjxicj4NClsxXSA8YSBocmVmPSJodHRwOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2FybS1r
ZXJuZWwvbXNnNDM2Nzc5Lmh0bWwiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vd3d3LnNwaW5pY3Mu
bmV0L2xpc3RzL2FybS1rZXJuZWwvbXNnNDM2Nzc5Lmh0bWw8L2E+PGJyPg0KPGJyPg0KU2lnbmVk
LW9mZi1ieTogWmhvdSBXYW5nICZsdDs8YSBocmVmPSJqYXZhc2NyaXB0OjsiIG9uY2xpY2s9Il9l
KGV2ZW50LCAmIzM5O2N2bWwmIzM5OywgJiMzOTt3YW5nemhvdTFAaGlzaWxpY29uLmNvbSYjMzk7
KSI+d2FuZ3pob3UxQGhpc2lsaWNvbi5jb208L2E+Jmd0Ozxicj4NClNpZ25lZC1vZmYtYnk6IEdh
YnJpZWxlIFBhb2xvbmkgJmx0OzxhIGhyZWY9ImphdmFzY3JpcHQ6OyIgb25jbGljaz0iX2UoZXZl
bnQsICYjMzk7Y3ZtbCYjMzk7LCAmIzM5O2dhYnJpZWxlLnBhb2xvbmlAaHVhd2VpLmNvbSYjMzk7
KSI+Z2FicmllbGUucGFvbG9uaUBodWF3ZWkuY29tPC9hPiZndDs8YnI+DQpTaWduZWQtb2ZmLWJ5
OiBBcm5kIEJlcmdtYW5uICZsdDs8YSBocmVmPSJqYXZhc2NyaXB0OjsiIG9uY2xpY2s9Il9lKGV2
ZW50LCAmIzM5O2N2bWwmIzM5OywgJiMzOTthcm5kQGFybmRiLmRlJiMzOTspIj5hcm5kQGFybmRi
LmRlPC9hPiZndDs8YnI+DQpUZXN0ZWQtYnk6IEphbWVzIE1vcnNlICZsdDs8YSBocmVmPSJqYXZh
c2NyaXB0OjsiIG9uY2xpY2s9Il9lKGV2ZW50LCAmIzM5O2N2bWwmIzM5OywgJiMzOTtqYW1lcy5t
b3JzZUBhcm0uY29tJiMzOTspIj5qYW1lcy5tb3JzZUBhcm0uY29tPC9hPiZndDs8YnI+DQpUZXN0
ZWQtYnk6IEdhYnJpZWwgRmVybmFuZGV6ICZsdDs8YSBocmVmPSJqYXZhc2NyaXB0OjsiIG9uY2xp
Y2s9Il9lKGV2ZW50LCAmIzM5O2N2bWwmIzM5OywgJiMzOTtnYWJyaWVsLmZlcm5hbmRlekBzdC5j
b20mIzM5OykiPmdhYnJpZWwuZmVybmFuZGV6QHN0LmNvbTwvYT4mZ3Q7PGJyPg0KVGVzdGVkLWJ5
OiBNaW5naHVhbiBMaWFuICZsdDs8YSBocmVmPSJqYXZhc2NyaXB0OjsiIG9uY2xpY2s9Il9lKGV2
ZW50LCAmIzM5O2N2bWwmIzM5OywgJiMzOTtNaW5naHVhbi5MaWFuQGZyZWVzY2FsZS5jb20mIzM5
OykiPk1pbmdodWFuLkxpYW5AZnJlZXNjYWxlLmNvbTwvYT4mZ3Q7PGJyPg0KQWNrZWQtYnk6IFBy
YXR5dXNoIEFuYW5kICZsdDs8YSBocmVmPSJqYXZhc2NyaXB0OjsiIG9uY2xpY2s9Il9lKGV2ZW50
LCAmIzM5O2N2bWwmIzM5OywgJiMzOTtwcmF0eXVzaC5hbmFuZEBnbWFpbC5jb20mIzM5OykiPnBy
YXR5dXNoLmFuYW5kQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqBkcml2ZXJzL3Bj
aS9ob3N0L3BjaS1kcmE3eHguY8KgIMKgIMKgIHzCoCA4ICsrKystLS0tPGJyPg0KwqBkcml2ZXJz
L3BjaS9ob3N0L3BjaWUtZGVzaWdud2FyZS5jIHwgNDEgKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS08YnI+DQrCoGRyaXZlcnMvcGNpL2hvc3QvcGNpZS1kZXNpZ253YXJlLmgg
fMKgIDUgKy0tLS08YnI+DQrCoDMgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMzgg
ZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2hvc3QvcGNp
LWRyYTd4eC5jIGIvZHJpdmVycy9wY2kvaG9zdC9wY2ktZHJhN3h4LmM8YnI+DQppbmRleCAwYjQ4
NDdhLi44YzM2ODgwIDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvcGNpL2hvc3QvcGNpLWRyYTd4
eC5jPGJyPg0KKysrIGIvZHJpdmVycy9wY2kvaG9zdC9wY2ktZHJhN3h4LmM8YnI+DQpAQCAtMTUz
LDEwICsxNTMsMTAgQEAgc3RhdGljIHZvaWQgZHJhN3h4X3BjaWVfaG9zdF9pbml0KHN0cnVjdCBw
Y2llX3BvcnQgKnBwKTxicj4NCsKgezxicj4NCsKgIMKgIMKgIMKgIGR3X3BjaWVfc2V0dXBfcmMo
cHApOzxicj4NCjxicj4NCi3CoCDCoCDCoCDCoHBwLSZndDtpb19tb2RfYmFzZSAmYW1wOz0gRFJB
N1hYX0NQVV9UT19CVVNfQUREUjs8YnI+DQotwqAgwqAgwqAgwqBwcC0mZ3Q7bWVtX21vZF9iYXNl
ICZhbXA7PSBEUkE3WFhfQ1BVX1RPX0JVU19BRERSOzxicj4NCi3CoCDCoCDCoCDCoHBwLSZndDtj
ZmcwX21vZF9iYXNlICZhbXA7PSBEUkE3WFhfQ1BVX1RPX0JVU19BRERSOzxicj4NCi3CoCDCoCDC
oCDCoHBwLSZndDtjZmcxX21vZF9iYXNlICZhbXA7PSBEUkE3WFhfQ1BVX1RPX0JVU19BRERSOzxi
cj4NCivCoCDCoCDCoCDCoHBwLSZndDtpb19iYXNlICZhbXA7PSBEUkE3WFhfQ1BVX1RPX0JVU19B
RERSOzxicj4NCivCoCDCoCDCoCDCoHBwLSZndDttZW1fYmFzZSAmYW1wOz0gRFJBN1hYX0NQVV9U
T19CVVNfQUREUjs8YnI+DQorwqAgwqAgwqAgwqBwcC0mZ3Q7Y2ZnMF9iYXNlICZhbXA7PSBEUkE3
WFhfQ1BVX1RPX0JVU19BRERSOzxicj4NCivCoCDCoCDCoCDCoHBwLSZndDtjZmcxX2Jhc2UgJmFt
cDs9IERSQTdYWF9DUFVfVE9fQlVTX0FERFI7PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgZHJhN3h4
X3BjaWVfZXN0YWJsaXNoX2xpbmsocHApOzxicj4NCsKgIMKgIMKgIMKgIGlmIChJU19FTkFCTEVE
KENPTkZJR19QQ0lfTVNJKSk8YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvaG9zdC9wY2ll
LWRlc2lnbndhcmUuYyBiL2RyaXZlcnMvcGNpL2hvc3QvcGNpZS1kZXNpZ253YXJlLmM8YnI+DQpp
bmRleCA3NTMzOGE2Li40ZTJkY2Q0IDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMvcGNpL2hvc3Qv
cGNpZS1kZXNpZ253YXJlLmM8YnI+DQorKysgYi9kcml2ZXJzL3BjaS9ob3N0L3BjaWUtZGVzaWdu
d2FyZS5jPGJyPg0KQEAgLTM2NSwxMSArMzY1LDggQEAgaW50IGR3X3BjaWVfaG9zdF9pbml0KHN0
cnVjdCBwY2llX3BvcnQgKnBwKTxicj4NCsKgIMKgIMKgIMKgIHN0cnVjdCBvZl9wY2lfcmFuZ2Ug
cmFuZ2U7PGJyPg0KwqAgwqAgwqAgwqAgc3RydWN0IG9mX3BjaV9yYW5nZV9wYXJzZXIgcGFyc2Vy
Ozxicj4NCsKgIMKgIMKgIMKgIHN0cnVjdCByZXNvdXJjZSAqY2ZnX3Jlczs8YnI+DQotwqAgwqAg
wqAgwqB1MzIgdmFsLCBuczs8YnI+DQotwqAgwqAgwqAgwqBjb25zdCBfX2JlMzIgKmFkZHJwOzxi
cj4NCi3CoCDCoCDCoCDCoGludCBpLCBpbmRleCwgcmV0Ozxicj4NCi08YnI+DQotwqAgwqAgwqAg
wqBucyA9IG9mX25fc2l6ZV9jZWxscyhucCk7PGJyPg0KK8KgIMKgIMKgIMKgdTMyIHZhbDs8YnI+
DQorwqAgwqAgwqAgwqBpbnQgaSwgcmV0Ozxicj4NCjxicj4NCsKgIMKgIMKgIMKgIGNmZ19yZXMg
PSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAmcXVv
dDtjb25maWcmcXVvdDspOzxicj4NCsKgIMKgIMKgIMKgIGlmIChjZmdfcmVzKSB7PGJyPg0KQEAg
LTM3NywxMiArMzc0LDYgQEAgaW50IGR3X3BjaWVfaG9zdF9pbml0KHN0cnVjdCBwY2llX3BvcnQg
KnBwKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBwLSZndDtjZmcxX3NpemUgPSByZXNv
dXJjZV9zaXplKGNmZ19yZXMpLzI7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHAtJmd0
O2NmZzBfYmFzZSA9IGNmZ19yZXMtJmd0O3N0YXJ0Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHBwLSZndDtjZmcxX2Jhc2UgPSBjZmdfcmVzLSZndDtzdGFydCArIHBwLSZndDtjZmcwX3Np
emU7PGJyPg0KLTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIEZpbmQgdGhlIHVudHJh
bnNsYXRlZCBjb25maWd1cmF0aW9uIHNwYWNlIGFkZHJlc3MgKi88YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpbmRleCA9IG9mX3Byb3BlcnR5X21hdGNoX3N0cmluZyhucCwgJnF1b3Q7cmVn
LW5hbWVzJnF1b3Q7LCAmcXVvdDtjb25maWcmcXVvdDspOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGFkZHJwID0gb2ZfZ2V0X2FkZHJlc3MobnAsIGluZGV4LCBOVUxMLCBOVUxMKTs8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcC0mZ3Q7Y2ZnMF9tb2RfYmFzZSA9IG9mX3JlYWRf
bnVtYmVyKGFkZHJwLCBucyk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHAtJmd0O2Nm
ZzFfbW9kX2Jhc2UgPSBwcC0mZ3Q7Y2ZnMF9tb2RfYmFzZSArIHBwLSZndDtjZmcwX3NpemU7PGJy
Pg0KwqAgwqAgwqAgwqAgfSBlbHNlIGlmICghcHAtJmd0O3ZhX2NmZzBfYmFzZSkgezxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRldl9lcnIocHAtJmd0O2RldiwgJnF1b3Q7bWlzc2luZyAq
Y29uZmlnKiByZWcgc3BhY2VcbiZxdW90Oyk7PGJyPg0KwqAgwqAgwqAgwqAgfTxicj4NCkBAIC00
MDksMTggKzQwMCwxMyBAQCBpbnQgZHdfcGNpZV9ob3N0X2luaXQoc3RydWN0IHBjaWVfcG9ydCAq
cHApPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHAtJmd0O2lvX3Np
emUgPSByZXNvdXJjZV9zaXplKCZhbXA7cHAtJmd0O2lvKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBwcC0mZ3Q7aW9fYnVzX2FkZHIgPSByYW5nZS5wY2lfYWRkcjs8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwcC0mZ3Q7aW9fYmFzZSA9
IHJhbmdlLmNwdV9hZGRyOzxicj4NCi08YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAvKiBGaW5kIHRoZSB1bnRyYW5zbGF0ZWQgSU8gc3BhY2UgYWRkcmVzcyAqLzxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBwLSZndDtpb19tb2RfYmFzZSA9
IHJhbmdlLmNwdV9hZGRyOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHBwLSZndDtpb19iYXNlX3RtcCA9IHJhbmdlLmNwdV9hZGRyOzxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIH08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAocmVzdHlwZSA9PSBJ
T1JFU09VUkNFX01FTSkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IG9mX3BjaV9yYW5nZV90b19yZXNvdXJjZSgmYW1wO3JhbmdlLCBucCwgJmFtcDtwcC0mZ3Q7bWVt
KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwcC0mZ3Q7PGEgaHJl
Zj0iaHR0cDovL21lbS5uYW1lIiB0YXJnZXQ9Il9ibGFuayI+bWVtLm5hbWU8L2E+ID0gJnF1b3Q7
TUVNJnF1b3Q7Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBwLSZn
dDttZW1fc2l6ZSA9IHJlc291cmNlX3NpemUoJmFtcDtwcC0mZ3Q7bWVtKTs8YnI+DQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwcC0mZ3Q7bWVtX2J1c19hZGRyID0gcmFuZ2Uu
cGNpX2FkZHI7PGJyPg0KLTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oC8qIEZpbmQgdGhlIHVudHJhbnNsYXRlZCBNRU0gc3BhY2UgYWRkcmVzcyAqLzxicj4NCi3CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBwLSZndDttZW1fbW9kX2Jhc2UgPSByYW5n
ZS5jcHVfYWRkcjs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaWYgKHJlc3R5cGUgPT0gMCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIG9mX3BjaV9yYW5nZV90b19yZXNvdXJjZSgmYW1wO3JhbmdlLCBu
cCwgJmFtcDtwcC0mZ3Q7Y2ZnKTs8YnI+DQpAQCAtNDI4LDExICs0MTQsNiBAQCBpbnQgZHdfcGNp
ZV9ob3N0X2luaXQoc3RydWN0IHBjaWVfcG9ydCAqcHApPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcHAtJmd0O2NmZzFfc2l6ZSA9IHJlc291cmNlX3NpemUoJmFtcDtw
cC0mZ3Q7Y2ZnKS8yOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBw
LSZndDtjZmcwX2Jhc2UgPSBwcC0mZ3Q7Y2ZnLnN0YXJ0Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHBwLSZndDtjZmcxX2Jhc2UgPSBwcC0mZ3Q7Y2ZnLnN0YXJ0ICsg
cHAtJmd0O2NmZzBfc2l6ZTs8YnI+DQotPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgLyogRmluZCB0aGUgdW50cmFuc2xhdGVkIGNvbmZpZ3VyYXRpb24gc3BhY2UgYWRk
cmVzcyAqLzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBwLSZndDtj
ZmcwX21vZF9iYXNlID0gcmFuZ2UuY3B1X2FkZHI7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcHAtJmd0O2NmZzFfbW9kX2Jhc2UgPSBwcC0mZ3Q7Y2ZnMF9tb2RfYmFz
ZSArPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcHAtJmd0O2NmZzBfc2l6ZTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB9PGJyPg0KwqAgwqAgwqAgwqAgfTxicj4NCjxicj4NCkBAIC01MDQsNyArNDg1LDcg
QEAgaW50IGR3X3BjaWVfaG9zdF9pbml0KHN0cnVjdCBwY2llX3BvcnQgKnBwKTxicj4NCjxicj4N
CsKgIMKgIMKgIMKgIGlmICghcHAtJmd0O29wcy0mZ3Q7cmRfb3RoZXJfY29uZik8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBkd19wY2llX3Byb2dfb3V0Ym91bmRfYXR1KHBwLCBQQ0lFX0FU
VV9SRUdJT05fSU5ERVgxLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFBDSUVfQVRVX1RZUEVfTUVNLCBwcC0mZ3Q7bWVt
X21vZF9iYXNlLDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoFBDSUVfQVRVX1RZUEVfTUVNLCBwcC0mZ3Q7bWVtX2Jhc2Us
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcHAtJmd0O21lbV9idXNfYWRkciwgcHAtJmd0O21lbV9zaXplKTs8YnI+DQo8
YnI+DQrCoCDCoCDCoCDCoCBkd19wY2llX3dyX293bl9jb25mKHBwLCBQQ0lfQkFTRV9BRERSRVNT
XzAsIDQsIDApOzxicj4NCkBAIC01NDIsMTIgKzUyMywxMiBAQCBzdGF0aWMgaW50IGR3X3BjaWVf
cmRfb3RoZXJfY29uZihzdHJ1Y3QgcGNpZV9wb3J0ICpwcCwgc3RydWN0IHBjaV9idXMgKmJ1cyw8
YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBpZiAoYnVzLSZndDtwYXJlbnQtJmd0O251bWJlciA9PSBw
cC0mZ3Q7cm9vdF9idXNfbnIpIHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0eXBlID0g
UENJRV9BVFVfVFlQRV9DRkcwOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNwdV9hZGRy
ID0gcHAtJmd0O2NmZzBfbW9kX2Jhc2U7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3B1
X2FkZHIgPSBwcC0mZ3Q7Y2ZnMF9iYXNlOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNm
Z19zaXplID0gcHAtJmd0O2NmZzBfc2l6ZTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2
YV9jZmdfYmFzZSA9IHBwLSZndDt2YV9jZmcwX2Jhc2U7PGJyPg0KwqAgwqAgwqAgwqAgfSBlbHNl
IHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB0eXBlID0gUENJRV9BVFVfVFlQRV9DRkcx
Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNwdV9hZGRyID0gcHAtJmd0O2NmZzFfbW9k
X2Jhc2U7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3B1X2FkZHIgPSBwcC0mZ3Q7Y2Zn
MV9iYXNlOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNmZ19zaXplID0gcHAtJmd0O2Nm
ZzFfc2l6ZTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB2YV9jZmdfYmFzZSA9IHBwLSZn
dDt2YV9jZmcxX2Jhc2U7PGJyPg0KwqAgwqAgwqAgwqAgfTxicj4NCkBAIC01NTcsNyArNTM4LDcg
QEAgc3RhdGljIGludCBkd19wY2llX3JkX290aGVyX2NvbmYoc3RydWN0IHBjaWVfcG9ydCAqcHAs
IHN0cnVjdCBwY2lfYnVzICpidXMsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgYnVzZGV2LCBjZmdfc2l6ZSk7PGJyPg0KwqAgwqAgwqAgwqAg
cmV0ID0gZHdfcGNpZV9jZmdfcmVhZCh2YV9jZmdfYmFzZSArIGFkZHJlc3MsIHdoZXJlLCBzaXpl
LCB2YWwpOzxicj4NCsKgIMKgIMKgIMKgIGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUocHAsIFBD
SUVfQVRVX1JFR0lPTl9JTkRFWDAsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgUENJRV9BVFVfVFlQRV9JTywgcHAtJmd0O2lvX21vZF9iYXNl
LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oFBDSUVfQVRVX1RZUEVfSU8sIHBwLSZndDtpb19iYXNlLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBwLSZndDtpb19idXNfYWRkciwgcHAt
Jmd0O2lvX3NpemUpOzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIHJldHVybiByZXQ7PGJyPg0KQEAg
LTU3NywxMiArNTU4LDEyIEBAIHN0YXRpYyBpbnQgZHdfcGNpZV93cl9vdGhlcl9jb25mKHN0cnVj
dCBwY2llX3BvcnQgKnBwLCBzdHJ1Y3QgcGNpX2J1cyAqYnVzLDxicj4NCjxicj4NCsKgIMKgIMKg
IMKgIGlmIChidXMtJmd0O3BhcmVudC0mZ3Q7bnVtYmVyID09IHBwLSZndDtyb290X2J1c19ucikg
ezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHR5cGUgPSBQQ0lFX0FUVV9UWVBFX0NGRzA7
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY3B1X2FkZHIgPSBwcC0mZ3Q7Y2ZnMF9tb2Rf
YmFzZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjcHVfYWRkciA9IHBwLSZndDtjZmcw
X2Jhc2U7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2ZnX3NpemUgPSBwcC0mZ3Q7Y2Zn
MF9zaXplOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZhX2NmZ19iYXNlID0gcHAtJmd0
O3ZhX2NmZzBfYmFzZTs8YnI+DQrCoCDCoCDCoCDCoCB9IGVsc2Ugezxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHR5cGUgPSBQQ0lFX0FUVV9UWVBFX0NGRzE7PGJyPg0KLcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgY3B1X2FkZHIgPSBwcC0mZ3Q7Y2ZnMV9tb2RfYmFzZTs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjcHVfYWRkciA9IHBwLSZndDtjZmcxX2Jhc2U7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgY2ZnX3NpemUgPSBwcC0mZ3Q7Y2ZnMV9zaXplOzxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHZhX2NmZ19iYXNlID0gcHAtJmd0O3ZhX2NmZzFfYmFzZTs8YnI+
DQrCoCDCoCDCoCDCoCB9PGJyPg0KQEAgLTU5Miw3ICs1NzMsNyBAQCBzdGF0aWMgaW50IGR3X3Bj
aWVfd3Jfb3RoZXJfY29uZihzdHJ1Y3QgcGNpZV9wb3J0ICpwcCwgc3RydWN0IHBjaV9idXMgKmJ1
cyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBidXNkZXYsIGNmZ19zaXplKTs8YnI+DQrCoCDCoCDCoCDCoCByZXQgPSBkd19wY2llX2NmZ193
cml0ZSh2YV9jZmdfYmFzZSArIGFkZHJlc3MsIHdoZXJlLCBzaXplLCB2YWwpOzxicj4NCsKgIMKg
IMKgIMKgIGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUocHAsIFBDSUVfQVRVX1JFR0lPTl9JTkRF
WDAsPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgUENJRV9BVFVfVFlQRV9JTywgcHAtJmd0O2lvX21vZF9iYXNlLDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFBDSUVfQVRVX1RZUEVfSU8s
IHBwLSZndDtpb19iYXNlLDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHBwLSZndDtpb19idXNfYWRkciwgcHAtJmd0O2lvX3NpemUpOzxicj4N
Cjxicj4NCsKgIMKgIMKgIMKgIHJldHVybiByZXQ7PGJyPg0KQEAgLTY4MCw3ICs2NjEsNyBAQCBz
dGF0aWMgaW50IGR3X3BjaWVfc2V0dXAoaW50IG5yLCBzdHJ1Y3QgcGNpX3N5c19kYXRhICpzeXMp
PGJyPg0KPGJyPg0KwqAgwqAgwqAgwqAgaWYgKGdsb2JhbF9pb19vZmZzZXQgJmx0OyBTWl8xTSAm
YW1wOyZhbXA7IHBwLSZndDtpb19zaXplICZndDsgMCkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHN5cy0mZ3Q7aW9fb2Zmc2V0ID0gZ2xvYmFsX2lvX29mZnNldCAtIHBwLSZndDtpb19i
dXNfYWRkcjs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwY2lfaW9yZW1hcF9pbyhnbG9i
YWxfaW9fb2Zmc2V0LCBwcC0mZ3Q7aW9fYmFzZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgcGNpX2lvcmVtYXBfaW8oZ2xvYmFsX2lvX29mZnNldCwgcHAtJmd0O2lvX2Jhc2VfdG1wKTs8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBnbG9iYWxfaW9fb2Zmc2V0ICs9IFNaXzY0Szs8
YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwY2lfYWRkX3Jlc291cmNlX29mZnNldCgmYW1w
O3N5cy0mZ3Q7cmVzb3VyY2VzLCAmYW1wO3BwLSZndDtpbyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzeXMtJmd0O2lvX29m
ZnNldCk7PGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2hvc3QvcGNpZS1kZXNpZ253YXJl
LmggYi9kcml2ZXJzL3BjaS9ob3N0L3BjaWUtZGVzaWdud2FyZS5oPGJyPg0KaW5kZXggZDBiYmQy
Ny4uMmRiZjY0OSAxMDA2NDQ8YnI+DQotLS0gYS9kcml2ZXJzL3BjaS9ob3N0L3BjaWUtZGVzaWdu
d2FyZS5oPGJyPg0KKysrIGIvZHJpdmVycy9wY2kvaG9zdC9wY2llLWRlc2lnbndhcmUuaDxicj4N
CkBAIC0yNywxOSArMjcsMTYgQEAgc3RydWN0IHBjaWVfcG9ydCB7PGJyPg0KwqAgwqAgwqAgwqAg
dTjCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByb290X2J1c19ucjs8YnI+DQrCoCDC
oCDCoCDCoCB2b2lkIF9faW9tZW3CoCDCoCDCoCDCoCDCoCDCoCAqZGJpX2Jhc2U7PGJyPg0KwqAg
wqAgwqAgwqAgdTY0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjZmcwX2Jhc2U7PGJy
Pg0KLcKgIMKgIMKgIMKgdTY0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjZmcwX21v
ZF9iYXNlOzxicj4NCsKgIMKgIMKgIMKgIHZvaWQgX19pb21lbcKgIMKgIMKgIMKgIMKgIMKgICp2
YV9jZmcwX2Jhc2U7PGJyPg0KwqAgwqAgwqAgwqAgdTMywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjZmcwX3NpemU7PGJyPg0KwqAgwqAgwqAgwqAgdTY0wqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBjZmcxX2Jhc2U7PGJyPg0KLcKgIMKgIMKgIMKgdTY0wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBjZmcxX21vZF9iYXNlOzxicj4NCsKgIMKgIMKgIMKgIHZvaWQg
X19pb21lbcKgIMKgIMKgIMKgIMKgIMKgICp2YV9jZmcxX2Jhc2U7PGJyPg0KwqAgwqAgwqAgwqAg
dTMywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjZmcxX3NpemU7PGJyPg0KwqAgwqAg
wqAgwqAgdTY0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpb19iYXNlOzxicj4NCi3C
oCDCoCDCoCDCoHU2NMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW9fbW9kX2Jhc2U7
PGJyPg0KK8KgIMKgIMKgIMKgdTY0wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpb19i
YXNlX3RtcDs8YnI+DQrCoCDCoCDCoCDCoCBwaHlzX2FkZHJfdMKgIMKgIMKgIMKgIMKgIMKgIMKg
aW9fYnVzX2FkZHI7PGJyPg0KwqAgwqAgwqAgwqAgdTMywqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBpb19zaXplOzxicj4NCsKgIMKgIMKgIMKgIHU2NMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgbWVtX2Jhc2U7PGJyPg0KLcKgIMKgIMKgIMKgdTY0wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBtZW1fbW9kX2Jhc2U7PGJyPg0KwqAgwqAgwqAgwqAgcGh5c19hZGRy
X3TCoCDCoCDCoCDCoCDCoCDCoCDCoG1lbV9idXNfYWRkcjs8YnI+DQrCoCDCoCDCoCDCoCB1MzLC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1lbV9zaXplOzxicj4NCsKgIMKgIMKgIMKg
IHN0cnVjdCByZXNvdXJjZcKgIMKgIMKgIMKgIMKgY2ZnOzxicj4NCi0tPGJyPg0KMS45LjE8YnI+
DQo8YnI+DQo8L2Jsb2NrcXVvdGU+DQo=
--089e0117646d3200f005234854e7--
