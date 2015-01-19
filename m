From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/5] PCI: designware: Add setup bus-related to
 pcie_host_ops
Date: Mon, 19 Jan 2015 15:46:40 +0000
Message-ID: <20150119154640.GA3845@red-moon>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
 <000e01d01a7f$47592e20$d60b8a60$%han@samsung.com>
 <CAG374jBZCn+V2zjcAwdKEb0COzBT2VES5uiw0gc40mFvoraERA@mail.gmail.com>
 <6696411.b9yjvPTFJo@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6696411.b9yjvPTFJo@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Tanmay Inamdar <tinamdar@ap>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 19, 2015 at 01:54:26PM +0000, Arnd Bergmann wrote:
> On Monday 19 January 2015 13:38:53 Gabriel Fernandez wrote:
> >=20
> > On 18 December 2014 at 05:58, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrot=
e:
> >=20
> > > On Thursday, December 18, 2014 7:16 AM, Arnd Bergmann wrote:
> > > > On Wednesday 17 December 2014 11:34:45 Gabriel FERNANDEZ wrote:
> > > > > ST sti SoCs PCIe IPs are built around DesignWare IP Core.
> > > > > But in these SoCs PCIe IP doesn't support IO.
> > > I cannot understand how ST sti SoCs PCIe IP does not support I/O.
> > > As far as I know, it cannot be selected by the 'parameter'.
> > > Then, H/W engineers dropped out the I/O control logic?
> > >
> > > > >
> > > > > To support this, add setup_bus() to pcie_host_ops.
> > >
> > >
> > > > >
> > > > > Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> > > > > Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm5QFI55V6+gNQ@public.gmane.org=
g>
> > > >
> > > > The dw-pcie driver should be able to tell whether the device ha=
s
> > > > an I/O space or not, and do the right thing based on that. Don'=
t
> > > > add an implementation specific callback for that.
> > >
> > > I agree with Arnd's opinion.
> > >
> > > In addition, I have one more question.
> > > Then, if a device that requires I/O region is connected to
> > > PCIe slot of ST sti SoCs PCIe, what will happen?
> > > It just prints error messages?
> > >
> > >
> > Arnd i
> > n other post mention to add an empty I/O space to workaround lack o=
f I/O
> > port access.
> > Is it the right thing to do ?
> > =E2=80=8B
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2014-November=
/299623.html
> >=20
>=20
> Good question. Given the latest development, I'd feel tempted to
> try moving the entire pcie-designware driver to use the generic probi=
ng
> that bypassses pci_common_init_dev(). Rob Herring posted a patch
> for the versatile PCI driver, you could try doing the same thing
> here, see http://permalink.gmane.org/gmane.linux.kernel.pci/30346.
>=20
> I think that would completely avoid this problem, and also help every=
one
> that wants to use this driver on arm64.

I was aiming at that, I started by converting the ranges parsing to the=
 new
API, with its own unfortunate quirks (ie untranslated CPU addresses,
that apparently caused deafening silence on the lists :)):

http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/3140=
08.html

Lorenzo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
