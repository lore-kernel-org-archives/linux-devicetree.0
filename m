From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: AS3722: add dt node properties for system power
 controller
Date: Fri, 20 Dec 2013 13:47:01 +0000
Message-ID: <20131220134343.GC3709@lee--X1>
References: <1387457821-12509-1-git-send-email-ldewangan@nvidia.com>
 <20131219130610.GI27373@lee--X1>
 <52B342F4.1070400@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52B342F4.1070400@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, anton@enomsg.org, dwmw2@infradead.org, mark.rutland@arm.com, rob@landley.net, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> >> ams AS3722 device supports the power off by turning off its all ra=
ils.
> >>
> >> Add dt node properties to enable this functionality on this device=
=2E
>=20
> >> diff --git a/Documentation/devicetree/bindings/mfd/as3722.txt b/Do=
cumentation/devicetree/bindings/mfd/as3722.txt
>=20
> >> +functionality from ams AS3722:
> >> +ams,system-power-controller: To enable the power off functionalit=
y through
> >> +	device.
> >=20
> > Do what with it? "on", "<1>", something else?
>=20
> It's a Boolean property, so just add the name to the DT, no value.
> Admittedly the binding should state this.

I was being pedantic. ;)

> The series,
>=20
> Tested-by: Stephen Warren <swarren@nvidia.com>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
