Return-Path: <SRS0=imBe=ST=ziswiler.com=marcel@kernel.org>
Date: Wed, 17 Apr 2019 08:13:51 +0200
In-Reply-To: <20190410071007.13276-2-igor.opaniuk@toradex.com>
References: <20190410071007.13276-1-igor.opaniuk@toradex.com> <20190410071007.13276-2-igor.opaniuk@toradex.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----VVVE166978OT75IY638FTUZY6MUFOS"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] ARM: dts: tegra124-apalis: convert to SPDX license tags
From: Marcel Ziswiler <marcel@ziswiler.com>
Message-ID: <D9979557-09AE-4EEB-8524-437E630E339C@ziswiler.com>
To: Igor Opaniuk <igor.opaniuk@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-imx@nxp.com
Cc: jonathanh@nvidia.com, thierry.reding@gmail.com, festevam@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, marcel.ziswiler@toradex.com, stefan@agner.ch
List-ID: <devicetree@vger.kernel.org>

------VVVE166978OT75IY638FTUZY6MUFOS
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)

I believe the parentheses don't really server any purpose here=2E With tha=
t:

Acked-by: Marcel Ziswiler <marcel=2Eziswiler@toradex=2Ecom>

On April 10, 2019 9:10:07 AM GMT+02:00, Igor Opaniuk <igor=2Eopaniuk@torad=
ex=2Ecom> wrote:
>Replace boiler plate licenses texts with the SPDX license
>identifiers in Colibri/Apalis DTS files=2E
>
>Signed-off-by: Igor Opaniuk <igor=2Eopaniuk@toradex=2Ecom>
>---
> arch/arm/boot/dts/tegra124-apalis-emc=2Edtsi | 39 ++-------------------
> arch/arm/boot/dts/tegra124-apalis-eval=2Edts | 40 ++--------------------
> arch/arm/boot/dts/tegra124-apalis=2Edtsi     | 40 ++--------------------
> 3 files changed, 6 insertions(+), 113 deletions(-)
>
>diff --git a/arch/arm/boot/dts/tegra124-apalis-emc=2Edtsi
>b/arch/arm/boot/dts/tegra124-apalis-emc=2Edtsi
>index ca2c3a557895=2E=2E36211f876e33 100644
>--- a/arch/arm/boot/dts/tegra124-apalis-emc=2Edtsi
>+++ b/arch/arm/boot/dts/tegra124-apalis-emc=2Edtsi
>@@ -1,42 +1,7 @@
>+// SPDX-License-Identifier: GPL-2=2E0 OR MIT
> /*
>- * Copyright 2016 Toradex AG
>+ * Copyright 2016-2019 Toradex AG
>  *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License
>- *     version 2 as published by the Free Software Foundation=2E
>- *
>- *     This file is distributed in the hope that it will be useful
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> / {
>diff --git a/arch/arm/boot/dts/tegra124-apalis-eval=2Edts
>b/arch/arm/boot/dts/tegra124-apalis-eval=2Edts
>index eaee10ef6512=2E=2Ee2388368d635 100644
>--- a/arch/arm/boot/dts/tegra124-apalis-eval=2Edts
>+++ b/arch/arm/boot/dts/tegra124-apalis-eval=2Edts
>@@ -1,42 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2016-2018 Toradex AG
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License
>- *     version 2 as published by the Free Software Foundation=2E
>- *
>- *     This file is distributed in the hope that it will be useful
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>+ * Copyright 2016-2019 Toradex AG
>  */
>=20
> /dts-v1/;
>diff --git a/arch/arm/boot/dts/tegra124-apalis=2Edtsi
>b/arch/arm/boot/dts/tegra124-apalis=2Edtsi
>index 13c93cd507d8=2E=2E690f881ea9cb 100644
>--- a/arch/arm/boot/dts/tegra124-apalis=2Edtsi
>+++ b/arch/arm/boot/dts/tegra124-apalis=2Edtsi
>@@ -1,42 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2016-2018 Toradex AG
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License
>- *     version 2 as published by the Free Software Foundation=2E
>- *
>- *     This file is distributed in the hope that it will be useful
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>+ * Copyright 2016-2019 Toradex AG
>  */
>=20
> #include "tegra124=2Edtsi"
>--=20
>2=2E17=2E1

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
------VVVE166978OT75IY638FTUZY6MUFOS
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)<br=
><br>I believe the parentheses don't really server any purpose here=2E With=
 that:<br><br>Acked-by: Marcel Ziswiler &lt;marcel=2Eziswiler@toradex=2Ecom=
&gt;<br><br><div class=3D"gmail_quote">On April 10, 2019 9:10:07 AM GMT+02:=
00, Igor Opaniuk &lt;igor=2Eopaniuk@toradex=2Ecom&gt; wrote:<blockquote cla=
ss=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px s=
olid rgb(204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail">Replace boiler plate licenses texts with the SPDX li=
cense<br>identifiers in Colibri/Apalis DTS files=2E<br><br>Signed-off-by: I=
gor Opaniuk &lt;igor=2Eopaniuk@toradex=2Ecom&gt;<hr> arch/arm/boot/dts/tegr=
a124-apalis-emc=2Edtsi | 39 ++-------------------<br> arch/arm/boot/dts/teg=
ra124-apalis-eval=2Edts | 40 ++--------------------<br> arch/arm/boot/dts/t=
egra124-apalis=2Edtsi     | 40 ++--------------------<br> 3 files changed, =
6 insertions(+), 113 deletions(-)<br><br>diff --git a/arch/arm/boot/dts/teg=
ra124-apalis-emc=2Edtsi b/arch/arm/boot/dts/tegra124-apalis-emc=2Edtsi<br>i=
ndex ca2c3a557895=2E=2E36211f876e33 100644<br>--- a/arch/arm/boot/dts/tegra=
124-apalis-emc=2Edtsi<br>+++ b/arch/arm/boot/dts/tegra124-apalis-emc=2Edtsi=
<br>@@ -1,42 +1,7 @@<br>+// SPDX-License-Identifier: GPL-2=2E0 OR MIT<br> /=
*<br>- * Copyright 2016 Toradex AG<br>+ * Copyright 2016-2019 Toradex AG<br=
>  *<br>- * This file is dual-licensed: you can use it either under the ter=
ms<br>- * of the GPL or the X11 license, at your option=2E Note that this d=
ual<br>- * licensing only applies to this file, and not this project as a<b=
r>- * whole=2E<br>- *<br>- *  a) This file is free software; you can redist=
ribute it and/or<br>- *     modify it under the terms of the GNU General Pu=
blic License<br>- *     version 2 as published by the Free Software Foundat=
ion=2E<br>- *<br>- *     This file is distributed in the hope that it will =
be useful<br>- *     but WITHOUT ANY WARRANTY; without even the implied war=
ranty of<br>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E =
 See the<br>- *     GNU General Public License for more details=2E<br>- *<b=
r>- * Or, alternatively<br>- *<br>- *  b) Permission is hereby granted, fre=
e of charge, to any person<br>- *     obtaining a copy of this software and=
 associated documentation<br>- *     files (the "Software"), to deal in the=
 Software without<br>- *     restriction, including without limitation the =
rights to use<br>- *     copy, modify, merge, publish, distribute, sublicen=
se, and/or<br>- *     sell copies of the Software, and to permit persons to=
 whom the<br>- *     Software is furnished to do so, subject to the followi=
ng<br>- *     conditions:<br>- *<br>- *     The above copyright notice and =
this permission notice shall be<br>- *     included in all copies or substa=
ntial portions of the Software=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDE=
D , WITHOUT WARRANTY OF ANY KIND<br>- *     EXPRESS OR IMPLIED, INCLUDING B=
UT NOT LIMITED TO THE WARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR=
 A PARTICULAR PURPOSE AND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL T=
HE AUTHORS OR COPYRIGHT<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR OTHER LIABILITY<br>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OT=
HERWISE, ARISING<br>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE=
 OR THE USE OR<br>- *     OTHER DEALINGS IN THE SOFTWARE=2E<br>  */<br> <br=
> / {<br>diff --git a/arch/arm/boot/dts/tegra124-apalis-eval=2Edts b/arch/a=
rm/boot/dts/tegra124-apalis-eval=2Edts<br>index eaee10ef6512=2E=2Ee2388368d=
635 100644<br>--- a/arch/arm/boot/dts/tegra124-apalis-eval=2Edts<br>+++ b/a=
rch/arm/boot/dts/tegra124-apalis-eval=2Edts<br>@@ -1,42 +1,6 @@<br>+// SPDX=
-License-Identifier: (GPL-2=2E0 OR X11)<br> /*<br>- * Copyright 2016-2018 T=
oradex AG<br>- *<br>- * This file is dual-licensed: you can use it either u=
nder the terms<br>- * of the GPL or the X11 license, at your option=2E Note=
 that this dual<br>- * licensing only applies to this file, and not this pr=
oject as a<br>- * whole=2E<br>- *<br>- *  a) This file is free software; yo=
u can redistribute it and/or<br>- *     modify it under the terms of the GN=
U General Public License<br>- *     version 2 as published by the Free Soft=
ware Foundation=2E<br>- *<br>- *     This file is distributed in the hope t=
hat it will be useful<br>- *     but WITHOUT ANY WARRANTY; without even the=
 implied warranty of<br>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR=
 PURPOSE=2E  See the<br>- *     GNU General Public License for more details=
=2E<br>- *<br>- * Or, alternatively<br>- *<br>- *  b) Permission is hereby =
granted, free of charge, to any person<br>- *     obtaining a copy of this =
software and associated documentation<br>- *     files (the "Software"), to=
 deal in the Software without<br>- *     restriction, including without lim=
itation the rights to use<br>- *     copy, modify, merge, publish, distribu=
te, sublicense, and/or<br>- *     sell copies of the Software, and to permi=
t persons to whom the<br>- *     Software is furnished to do so, subject to=
 the following<br>- *     conditions:<br>- *<br>- *     The above copyright=
 notice and this permission notice shall be<br>- *     included in all copi=
es or substantial portions of the Software=2E<br>- *<br>- *     THE SOFTWAR=
E IS PROVIDED , WITHOUT WARRANTY OF ANY KIND<br>- *     EXPRESS OR IMPLIED,=
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES<br>- *     OF MERCHANTABILITY,=
 FITNESS FOR A PARTICULAR PURPOSE AND<br>- *     NONINFRINGEMENT=2E IN NO E=
VENT SHALL THE AUTHORS OR COPYRIGHT<br>- *     HOLDERS BE LIABLE FOR ANY CL=
AIM, DAMAGES OR OTHER LIABILITY<br>- *     WHETHER IN AN ACTION OF CONTRACT=
, TORT OR OTHERWISE, ARISING<br>- *     FROM, OUT OF OR IN CONNECTION WITH =
THE SOFTWARE OR THE USE OR<br>- *     OTHER DEALINGS IN THE SOFTWARE=2E<br>=
+ * Copyright 2016-2019 Toradex AG<br>  */<br> <br> /dts-v1/;<br>diff --git=
 a/arch/arm/boot/dts/tegra124-apalis=2Edtsi b/arch/arm/boot/dts/tegra124-ap=
alis=2Edtsi<br>index 13c93cd507d8=2E=2E690f881ea9cb 100644<br>--- a/arch/ar=
m/boot/dts/tegra124-apalis=2Edtsi<br>+++ b/arch/arm/boot/dts/tegra124-apali=
s=2Edtsi<br>@@ -1,42 +1,6 @@<br>+// SPDX-License-Identifier: (GPL-2=2E0 OR =
X11)<br> /*<br>- * Copyright 2016-2018 Toradex AG<br>- *<br>- * This file i=
s dual-licensed: you can use it either under the terms<br>- * of the GPL or=
 the X11 license, at your option=2E Note that this dual<br>- * licensing on=
ly applies to this file, and not this project as a<br>- * whole=2E<br>- *<b=
r>- *  a) This file is free software; you can redistribute it and/or<br>- *=
     modify it under the terms of the GNU General Public License<br>- *    =
 version 2 as published by the Free Software Foundation=2E<br>- *<br>- *   =
  This file is distributed in the hope that it will be useful<br>- *     bu=
t WITHOUT ANY WARRANTY; without even the implied warranty of<br>- *     MER=
CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *     GNU=
 General Public License for more details=2E<br>- *<br>- * Or, alternatively=
<br>- *<br>- *  b) Permission is hereby granted, free of charge, to any per=
son<br>- *     obtaining a copy of this software and associated documentati=
on<br>- *     files (the "Software"), to deal in the Software without<br>- =
*     restriction, including without limitation the rights to use<br>- *   =
  copy, modify, merge, publish, distribute, sublicense, and/or<br>- *     s=
ell copies of the Software, and to permit persons to whom the<br>- *     So=
ftware is furnished to do so, subject to the following<br>- *     condition=
s:<br>- *<br>- *     The above copyright notice and this permission notice =
shall be<br>- *     included in all copies or substantial portions of the S=
oftware=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF=
 ANY KIND<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE W=
ARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE A=
ND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT=
<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY<br>=
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING<br>- *=
     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<br>- *  =
   OTHER DEALINGS IN THE SOFTWARE=2E<br>+ * Copyright 2016-2019 Toradex AG<=
br>  */<br> <br> #include "tegra124=2Edtsi"</pre></blockquote></div><br>-- =
<br>Sent from my Android device with K-9 Mail=2E Please excuse my brevity=
=2E</body></html>
------VVVE166978OT75IY638FTUZY6MUFOS--
