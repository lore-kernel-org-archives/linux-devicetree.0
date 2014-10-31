From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 14/20] usb: dwc3: add Tx de-emphasis quirk
Date: Thu, 30 Oct 2014 22:00:10 -0500
Message-ID: <20141031030010.GB1080@saruman>
References: <1414663725-2195-1-git-send-email-ray.huang@amd.com>
 <1414663725-2195-15-git-send-email-ray.huang@amd.com>
 <20141030164210.GM10130@saruman>
 <20141031012954.GA20367@hr-slim.amd.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141031012954.GA20367-066jutd8Y+7kLsZ8J5Uweg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Jason Chang <jason.chang-5C7GfCeVMHo@public.gmane.org>, Vincent Wan <vincent.wan-5C7GfCeVMHo@public.gmane.org>, Tony Li <tony.li-5C7GfCeVMHo@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 31, 2014 at 09:29:55AM +0800, Huang Rui wrote:
> On Thu, Oct 30, 2014 at 11:42:10AM -0500, Felipe Balbi wrote:
> > On Thu, Oct 30, 2014 at 06:08:39PM +0800, Huang Rui wrote:
> > > This patch adds Tx de-emphasis quirk, and the Tx de-emphasis value is
> > > configurable according to PIPE3 specification.
> > >=20
> > > Value		Description
> > > 0		-6dB de-emphasis
> > > 1		-3.5dB de-emphasis
> > > 2		No de-emphasis
> > > 3		Reserved
> > >=20
> > > It can be configured on DT or platform data.
> > >=20
> > > Signed-off-by: Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>
> >=20
> > doesn't apply:
> >=20
> > checking file Documentation/devicetree/bindings/usb/dwc3.txt
> > checking file drivers/usb/dwc3/core.c
> > Hunk #2 succeeded at 718 (offset -2 lines).
> > Hunk #3 succeeded at 777 (offset -2 lines).
> > Hunk #4 succeeded at 807 (offset -2 lines).
> > Hunk #5 succeeded at 829 (offset -2 lines).
> > Hunk #6 succeeded at 840 (offset -2 lines).
> > checking file drivers/usb/dwc3/core.h
> > Hunk #2 FAILED at 697.
> > 1 out of 3 hunks FAILED
> > checking file drivers/usb/dwc3/platform_data.h
> >=20
> > please rebase on testing/next
> >=20
>=20
> That's because in patch 12 and other ones you applied, I changed
> addreviations to uppercase such as "lfps" -> "LFPS", "fpga" -> "FPGA".

didn't notice that. I'll just reapply the entire series.

> Previous 13 patches are already applied. Do you mean, I send the other
> patches since "Tx de-emphasis" (patch 14) after rebased current
> branch.
>=20
> If yes, at patch 1, "Enabling this bit ... hibernation .. yet", should
> it be updated in extra patch?

don't worry, I'll reapply the whole series, thanks :-)

--=20
balbi

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUUvs6AAoJEIaOsuA1yqREZ5gP/0O2Awqolw+xdH0HB0yJ2Ys1
EKNq8PEYrXazHL65nCQYeTlHm2yjqQoVk9fs6sFcBHuda5TUQqr5VS4MiDepNvge
YD0KDRD27fwjaWvZ317R7uoPu3T8ovDZSsRTrUtmfhmgJ+J6BDTsKbgWLaIS2NYf
NNuU5kxr2GS1hHp3egR54tK9AK5JptmsI7wNg7Nex5Pzsy1MpDCdHeoT40leg5N5
F9Li4m+0EBapmxjZMfTRPIVFkF8JvpRhq5GeQsM/0P6vkvf3jsrhXKqQQ4+UjjMA
0FCUuHbyXKYiZ0hBQOYPfQGJ3AJqEcnB0K/kZMTpU7WkjUQPtCtAxTl545nisT3X
XiJviKKsVMzw1GD6FEZmuy8M4NfzDHrxpenzi3hHsi5aEaTnsCGdzmVRXfrClY3S
X6uHT4ZROWPA1lpyvR8O5kLqQC/fSqj2UA/mTJdovdUTBwXApEQ7pC14E0Nvjvof
uyk9H2IN9tC2vBB0/8eRJCN5Ni5E8cKxm+ZbF23VDv2pjPKNDAZVAzqTC/ms4iZF
O07XbTam3nvh0tj/g7szQ5k6eo277CzK1ULOCQFD9x4PnUDNCcNCP4eHW9Veag4/
WYDG/pN1JgUK7thIM2x1yJAGyUzMWpLh8oUx1WrER1PZ/+bBTy78FLha2IUZY7zb
dMhny++MnxkXrTmTbJHz
=U9H7
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
