From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 4/5] PCI: designware: Add disable IO support
Date: Mon, 16 Mar 2015 21:00:42 +0100
Message-ID: <3714853.Vuc23EfWdL@wuerfel>
References: <1426515635-9466-1-git-send-email-gabriel.fernandez@linaro.org> <1426515635-9466-5-git-send-email-gabriel.fernandez@linaro.org> <582D947C-1229-4DD9-BC82-812D1560C49E@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <582D947C-1229-4DD9-BC82-812D1560C49E-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry
List-Id: devicetree@vger.kernel.org

On Monday 16 March 2015 13:00:51 Kumar Gala wrote:
> On Mar 16, 2015, at 9:20 AM, Gabriel FERNANDEZ <gabriel.fernandez@st.=
com> wrote:
>=20
> > ST sti SoCs PCIe IPs are built around DesignWare IP Core.
> > But in these SoCs PCIe IP doesn't support IO.
> >=20
> > This patch adds the possibility to disable it through
> > a DT property, by creating an empty IO window and by
> > removing PCI_COMMAND_IO from the setup register.
> >=20
> > Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> > Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > .../devicetree/bindings/pci/designware-pcie.txt    |  2 ++
> > drivers/pci/host/pcie-designware.c                 | 24 +++++++++++=
+++++++++--
> > drivers/pci/host/pcie-designware.h                 |  1 +
> > 3 files changed, 25 insertions(+), 2 deletions(-)
>=20
> Why not just update the code such that if the ranges doesn=E2=80=99t =
have an IO
> space rather than introducing a new DT property?

I suspect we can simplify this now by changing over the designware PCI
code from pci_common_init_dev to calling pci_scan_root_bus() in the
same way that pci-versatile.c does. This would also clean up some
other areas of the driver and let you do proper error handling
in the probe.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
