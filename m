Return-Path: <dcb314@hotmail.com>
Message-ID: <DUB128-W60BE88653C27C6610D81059C000@phx.gbl>
From: David Binderman <dcb314@hotmail.com>
Subject: linux-4.4-rc3/scripts/dtc/libfdt/fdt.c:88: code that relies on
 undefined behaviour ?
Date: Mon, 30 Nov 2015 18:02:26 +0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello there=2C=0A=
=0A=
[linux-4.4-rc3/scripts/dtc/libfdt/fdt.c:88]: (warning) Invalid test for ove=
rflow 'p+len<p'. Condition is always false unless there is overflow=2C and =
overflow is UB.=0A=
=0A=
Source code is=0A=
=0A=
=A0=A0=A0 if (p + len < p)=0A=
=A0=A0=A0=A0=A0=A0=A0 return NULL=3B=0A=
=0A=
Suggest code rework.=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
=0A=
 		 	   		  =
