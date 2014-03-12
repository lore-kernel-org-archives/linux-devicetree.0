From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/3] ata: ahci_st: Provide DT bindings for ST's SATA
 implementation
Date: Wed, 12 Mar 2014 17:14:52 +0000
Message-ID: <20140312171452.GE22450@lee--X1>
References: <1393328481-7251-1-git-send-email-lee.jones@linaro.org>
 <20140312114257.GA17461@e106331-lin.cambridge.arm.com>
 <20140312124835.GA22450@lee--X1>
 <7613177.7hd4IoKUr4@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7613177.7hd4IoKUr4@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "DCG_UPD_stlinux_kernel@list.st.com" <DCG_UPD_stlinux_kernel@list.st.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@st.com>
List-Id: devicetree@vger.kernel.org

> > > > +This binding describes a SATA device.
> > > > +
> > > > +Required properties:
> > > > + - compatible         : Must be "st,ahci"
> > >=20
> > > Is there not a more specific name? This is awfully generic.
> >=20
> > There isn't one. ST only have one AHCI driver. The driver is named =
as
> > generically.
>=20
> If it is this generic, can't you use the completely generic
> ahci-platform driver and add a "generic-ahci" compatible string
> to that?

It pretty much does. The only 'special' functionality we handle in
the driver are resets and configuring the OOB. However, both are
required.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
