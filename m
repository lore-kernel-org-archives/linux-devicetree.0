Return-Path: <SRS0=imBe=ST=ziswiler.com=marcel@kernel.org>
Date: Wed, 17 Apr 2019 08:15:01 +0200
In-Reply-To: <20190410071007.13276-1-igor.opaniuk@toradex.com>
References: <20190410071007.13276-1-igor.opaniuk@toradex.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="----ADY3BQGTWPF54EBVBLO6X3AYXYRJUF"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] ARM: dts: colibri/apalis: convert to SPDX license tags
From: Marcel Ziswiler <marcel@ziswiler.com>
Message-ID: <8F22A611-7CC6-4C74-8369-748FD8DB8073@ziswiler.com>
To: Igor Opaniuk <igor.opaniuk@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-imx@nxp.com
Cc: jonathanh@nvidia.com, thierry.reding@gmail.com, festevam@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, marcel.ziswiler@toradex.com, stefan@agner.ch
List-ID: <devicetree@vger.kernel.org>

------ADY3BQGTWPF54EBVBLO6X3AYXYRJUF
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

With them parentheses removed:

Acked-by: Marcel Ziswiler <marcel=2Eziswiler@toradex=2Ecom>

On April 10, 2019 9:10:06 AM GMT+02:00, Igor Opaniuk <igor=2Eopaniuk@torad=
ex=2Ecom> wrote:
>Replace boiler plate licenses texts with the SPDX license
>identifiers in Colibri/Apalis DTS files=2E
>
>Signed-off-by: Igor Opaniuk <igor=2Eopaniuk@toradex=2Ecom>
>---
> arch/arm/boot/dts/imx6q-apalis-eval=2Edts       | 40 +-----------------
> arch/arm/boot/dts/imx6q-apalis-ixora-v1=2E1=2Edts | 40 +----------------=
-
> arch/arm/boot/dts/imx6q-apalis-ixora=2Edts      | 40 +-----------------
> arch/arm/boot/dts/imx6qdl-apalis=2Edtsi         | 40 +-----------------
> arch/arm/boot/dts/imx7-colibri-eval-v3=2Edtsi   | 39 +-----------------
> arch/arm/boot/dts/imx7-colibri=2Edtsi           | 39 +-----------------
> arch/arm/boot/dts/imx7d-colibri-eval-v3=2Edts   | 39 +-----------------
> arch/arm/boot/dts/imx7d-colibri=2Edtsi          | 41 +------------------
> arch/arm/boot/dts/imx7s-colibri-eval-v3=2Edts   | 41 +------------------
> arch/arm/boot/dts/imx7s-colibri=2Edtsi          | 41 +------------------
> arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi     | 40 +-----------------
> arch/arm/boot/dts/vf-colibri=2Edtsi             | 38 +----------------
> arch/arm/boot/dts/vf500-colibri-eval-v3=2Edts   | 40 +-----------------
> arch/arm/boot/dts/vf500-colibri=2Edtsi          | 39 +-----------------
> arch/arm/boot/dts/vf610-colibri-eval-v3=2Edts   | 38 +----------------
> arch/arm/boot/dts/vf610-colibri=2Edtsi          | 40 +-----------------
> arch/arm/boot/dts/vf610m4-colibri=2Edts         | 40 +-----------------
> 17 files changed, 29 insertions(+), 646 deletions(-)
>
>diff --git a/arch/arm/boot/dts/imx6q-apalis-eval=2Edts
>b/arch/arm/boot/dts/imx6q-apalis-eval=2Edts
>index 0edd3043d9c1=2E=2E621e9ee5bbeb 100644
>--- a/arch/arm/boot/dts/imx6q-apalis-eval=2Edts
>+++ b/arch/arm/boot/dts/imx6q-apalis-eval=2Edts
>@@ -1,44 +1,8 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2014-2017 Toradex AG
>+ * Copyright 2014-2019 Toradex AG
>  * Copyright 2012 Freescale Semiconductor, Inc=2E
>  * Copyright 2011 Linaro Ltd=2E
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
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> /dts-v1/;
>diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora-v1=2E1=2Edts
>b/arch/arm/boot/dts/imx6q-apalis-ixora-v1=2E1=2Edts
>index b94bb687be6b=2E=2E1e365e2636c4 100644
>--- a/arch/arm/boot/dts/imx6q-apalis-ixora-v1=2E1=2Edts
>+++ b/arch/arm/boot/dts/imx6q-apalis-ixora-v1=2E1=2Edts
>@@ -1,44 +1,8 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2014-2017 Toradex AG
>+ * Copyright 2014-2019 Toradex AG
>  * Copyright 2012 Freescale Semiconductor, Inc=2E
>  * Copyright 2011 Linaro Ltd=2E
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
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> /dts-v1/;
>diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora=2Edts
>b/arch/arm/boot/dts/imx6q-apalis-ixora=2Edts
>index 302fd6adc8a7=2E=2Edeb5509d3597 100644
>--- a/arch/arm/boot/dts/imx6q-apalis-ixora=2Edts
>+++ b/arch/arm/boot/dts/imx6q-apalis-ixora=2Edts
>@@ -1,44 +1,8 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2014-2017 Toradex AG
>+ * Copyright 2014-2019 Toradex AG
>  * Copyright 2012 Freescale Semiconductor, Inc=2E
>  * Copyright 2011 Linaro Ltd=2E
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
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> /dts-v1/;
>diff --git a/arch/arm/boot/dts/imx6qdl-apalis=2Edtsi
>b/arch/arm/boot/dts/imx6qdl-apalis=2Edtsi
>index 7c4ad541c3f5=2E=2E031c021a7fc5 100644
>--- a/arch/arm/boot/dts/imx6qdl-apalis=2Edtsi
>+++ b/arch/arm/boot/dts/imx6qdl-apalis=2Edtsi
>@@ -1,44 +1,8 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2014-2017 Toradex AG
>+ * Copyright 2014-2019 Toradex AG
>  * Copyright 2012 Freescale Semiconductor, Inc=2E
>  * Copyright 2011 Linaro Ltd=2E
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
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> #include <dt-bindings/gpio/gpio=2Eh>
>diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3=2Edtsi
>b/arch/arm/boot/dts/imx7-colibri-eval-v3=2Edtsi
>index 3f2746169181=2E=2E43b6be76941b 100644
>--- a/arch/arm/boot/dts/imx7-colibri-eval-v3=2Edtsi
>+++ b/arch/arm/boot/dts/imx7-colibri-eval-v3=2Edtsi
>@@ -1,43 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)
> /*
>  * Copyright 2016 Toradex AG
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License as
>- *     published by the Free Software Foundation; either version 2 of
>the
>- *     License, or (at your option) any later version=2E
>- *
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> / {
>diff --git a/arch/arm/boot/dts/imx7-colibri=2Edtsi
>b/arch/arm/boot/dts/imx7-colibri=2Edtsi
>index 895fbde4d433=2E=2Ec53e9576813b 100644
>--- a/arch/arm/boot/dts/imx7-colibri=2Edtsi
>+++ b/arch/arm/boot/dts/imx7-colibri=2Edtsi
>@@ -1,43 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)
> /*
>  * Copyright 2016 Toradex AG
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License as
>- *     published by the Free Software Foundation; either version 2 of
>the
>- *     License, or (at your option) any later version=2E
>- *
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> / {
>diff --git a/arch/arm/boot/dts/imx7d-colibri-eval-v3=2Edts
>b/arch/arm/boot/dts/imx7d-colibri-eval-v3=2Edts
>index 136e11ab4893=2E=2E5077ec355725 100644
>--- a/arch/arm/boot/dts/imx7d-colibri-eval-v3=2Edts
>+++ b/arch/arm/boot/dts/imx7d-colibri-eval-v3=2Edts
>@@ -1,43 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)
> /*
>  * Copyright 2016 Toradex AG
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License as
>- *     published by the Free Software Foundation; either version 2 of
>the
>- *     License, or (at your option) any later version=2E
>- *
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> /dts-v1/;
>diff --git a/arch/arm/boot/dts/imx7d-colibri=2Edtsi
>b/arch/arm/boot/dts/imx7d-colibri=2Edtsi
>index e2e327f437e3=2E=2Efc5573171114 100644
>--- a/arch/arm/boot/dts/imx7d-colibri=2Edtsi
>+++ b/arch/arm/boot/dts/imx7d-colibri=2Edtsi
>@@ -1,43 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)
> /*
>- * Copyright 2016 Toradex AG
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License as
>- *     published by the Free Software Foundation; either version 2 of
>the
>- *     License, or (at your option) any later version=2E
>- *
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>+ * Copyright 2016-2019 Toradex AG
>  */
>=20
> #include "imx7d=2Edtsi"
>diff --git a/arch/arm/boot/dts/imx7s-colibri-eval-v3=2Edts
>b/arch/arm/boot/dts/imx7s-colibri-eval-v3=2Edts
>index bd2a49c1ade6=2E=2Ec12bb60b6acb 100644
>--- a/arch/arm/boot/dts/imx7s-colibri-eval-v3=2Edts
>+++ b/arch/arm/boot/dts/imx7s-colibri-eval-v3=2Edts
>@@ -1,43 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)
> /*
>- * Copyright 2016 Toradex AG
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License as
>- *     published by the Free Software Foundation; either version 2 of
>the
>- *     License, or (at your option) any later version=2E
>- *
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>+ * Copyright 2016-2019 Toradex AG
>  */
>=20
> /dts-v1/;
>diff --git a/arch/arm/boot/dts/imx7s-colibri=2Edtsi
>b/arch/arm/boot/dts/imx7s-colibri=2Edtsi
>index 1fb1ec5d3d70=2E=2E3f3e0fbc8597 100644
>--- a/arch/arm/boot/dts/imx7s-colibri=2Edtsi
>+++ b/arch/arm/boot/dts/imx7s-colibri=2Edtsi
>@@ -1,43 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)
> /*
>- * Copyright 2016 Toradex AG
>- *
>- * This file is dual-licensed: you can use it either under the terms
>- * of the GPL or the X11 license, at your option=2E Note that this dual
>- * licensing only applies to this file, and not this project as a
>- * whole=2E
>- *
>- *  a) This file is free software; you can redistribute it and/or
>- *     modify it under the terms of the GNU General Public License as
>- *     published by the Free Software Foundation; either version 2 of
>the
>- *     License, or (at your option) any later version=2E
>- *
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>+ * Copyright 2016-2019 Toradex AG
>  */
>=20
> #include "imx7s=2Edtsi"
>diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi
>b/arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi
>index e2da122a63f4=2E=2Ee5337a93c3d1 100644
>--- a/arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi
>+++ b/arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi
>@@ -1,42 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2014 Toradex AG
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
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>+ * Copyright 2014-2016 Toradex AG
>  */
>=20
> / {
>diff --git a/arch/arm/boot/dts/vf-colibri=2Edtsi
>b/arch/arm/boot/dts/vf-colibri=2Edtsi
>index b6a1eeeb2bb4=2E=2E34a93fe90a5c 100644
>--- a/arch/arm/boot/dts/vf-colibri=2Edtsi
>+++ b/arch/arm/boot/dts/vf-colibri=2Edtsi
>@@ -1,42 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>  * Copyright 2014 Toradex AG
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
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>  */
>=20
> / {
>diff --git a/arch/arm/boot/dts/vf500-colibri-eval-v3=2Edts
>b/arch/arm/boot/dts/vf500-colibri-eval-v3=2Edts
>index 076998968fb5=2E=2Ea4b97e9d22d9 100644
>--- a/arch/arm/boot/dts/vf500-colibri-eval-v3=2Edts
>+++ b/arch/arm/boot/dts/vf500-colibri-eval-v3=2Edts
>@@ -1,42 +1,6 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2014 Toradex AG
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
>- *     This file is distributed in the hope that it will be useful,
>- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the
>- *     GNU General Public License for more details=2E
>- *
>- * Or, alternatively,
>- *
>- *  b) Permission is hereby granted, free of charge, to any person
>- *     obtaining a copy of this software and associated documentation
>- *     files (the "Software"), to deal in the Software without
>- *     restriction, including without limitation the rights to use,
>- *     copy, modify, merge, publish, distribute, sublicense, and/or
>- *     sell copies of the Software, and to permit persons to whom the
>- *     Software is furnished to do so, subject to the following
>- *     conditions:
>- *
>- *     The above copyright notice and this permission notice shall be
>- *     included in all copies or substantial portions of the Software=2E
>- *
>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>- *     OTHER DEALINGS IN THE SOFTWARE=2E
>+ * Copyright 2014-2019 Toradex AG
>  */
>=20
> /dts-v1/;
>diff --git a/arch/arm/boot/dts/vf500-colibri=2Edtsi
>b/arch/arm/boot/dts/vf500-colibri=2Edtsi
>index 237b0246fa84=2E=2E54e96b311a48 100644
>--- a/arch/arm/boot/dts/vf500-colibri=2Edtsi
>+++ b/arch/arm/boot/dts/vf500-colibri=2Edtsi
>@@ -1,42 +1,7 @@
>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)
> /*
>- * Copyright 2014 Toradex AG
>+ * Copyright 2014-2019 Toradex AG
>  *
>- * This file is dual-licensed: you can use it either under the terms
>-=20

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
------ADY3BQGTWPF54EBVBLO6X3AYXYRJUF
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>With them parentheses removed:<br><br>Acked-by: Ma=
rcel Ziswiler &lt;marcel=2Eziswiler@toradex=2Ecom&gt;<br><br><div class=3D"=
gmail_quote">On April 10, 2019 9:10:06 AM GMT+02:00, Igor Opaniuk &lt;igor=
=2Eopaniuk@toradex=2Ecom&gt; wrote:<blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204);=
 padding-left: 1ex;">
<pre class=3D"k9mail">Replace boiler plate licenses texts with the SPDX li=
cense<br>identifiers in Colibri/Apalis DTS files=2E<br><br>Signed-off-by: I=
gor Opaniuk &lt;igor=2Eopaniuk@toradex=2Ecom&gt;<hr> arch/arm/boot/dts/imx6=
q-apalis-eval=2Edts       | 40 +-----------------<br> arch/arm/boot/dts/imx=
6q-apalis-ixora-v1=2E1=2Edts | 40 +-----------------<br> arch/arm/boot/dts/=
imx6q-apalis-ixora=2Edts      | 40 +-----------------<br> arch/arm/boot/dts=
/imx6qdl-apalis=2Edtsi         | 40 +-----------------<br> arch/arm/boot/dt=
s/imx7-colibri-eval-v3=2Edtsi   | 39 +-----------------<br> arch/arm/boot/d=
ts/imx7-colibri=2Edtsi           | 39 +-----------------<br> arch/arm/boot/=
dts/imx7d-colibri-eval-v3=2Edts   | 39 +-----------------<br> arch/arm/boot=
/dts/imx7d-colibri=2Edtsi          | 41 +------------------<br> arch/arm/bo=
ot/dts/imx7s-colibri-eval-v3=2Edts   | 41 +------------------<br> arch/arm/=
boot/dts/imx7s-colibri=2Edtsi          | 41 +------------------<br> arch/ar=
m/boot/dts/vf-colibri-eval-v3=2Edtsi     | 40 +-----------------<br> arch/a=
rm/boot/dts/vf-colibri=2Edtsi             | 38 +----------------<br> arch/a=
rm/boot/dts/vf500-colibri-eval-v3=2Edts   | 40 +-----------------<br> arch/=
arm/boot/dts/vf500-colibri=2Edtsi          | 39 +-----------------<br> arch=
/arm/boot/dts/vf610-colibri-eval-v3=2Edts   | 38 +----------------<br> arch=
/arm/boot/dts/vf610-colibri=2Edtsi          | 40 +-----------------<br> arc=
h/arm/boot/dts/vf610m4-colibri=2Edts         | 40 +-----------------<br> 17=
 files changed, 29 insertions(+), 646 deletions(-)<br><br>diff --git a/arch=
/arm/boot/dts/imx6q-apalis-eval=2Edts b/arch/arm/boot/dts/imx6q-apalis-eval=
=2Edts<br>index 0edd3043d9c1=2E=2E621e9ee5bbeb 100644<br>--- a/arch/arm/boo=
t/dts/imx6q-apalis-eval=2Edts<br>+++ b/arch/arm/boot/dts/imx6q-apalis-eval=
=2Edts<br>@@ -1,44 +1,8 @@<br>+// SPDX-License-Identifier: (GPL-2=2E0 OR X1=
1)<br> /*<br>- * Copyright 2014-2017 Toradex AG<br>+ * Copyright 2014-2019 =
Toradex AG<br>  * Copyright 2012 Freescale Semiconductor, Inc=2E<br>  * Cop=
yright 2011 Linaro Ltd=2E<br>- *<br>- * This file is dual-licensed: you can=
 use it either under the terms<br>- * of the GPL or the X11 license, at you=
r option=2E Note that this dual<br>- * licensing only applies to this file,=
 and not this project as a<br>- * whole=2E<br>- *<br>- *  a) This file is f=
ree software; you can redistribute it and/or<br>- *     modify it under the=
 terms of the GNU General Public License<br>- *     version 2 as published =
by the Free Software Foundation=2E<br>- *<br>- *     This file is distribut=
ed in the hope that it will be useful,<br>- *     but WITHOUT ANY WARRANTY;=
 without even the implied warranty of<br>- *     MERCHANTABILITY or FITNESS=
 FOR A PARTICULAR PURPOSE=2E  See the<br>- *     GNU General Public License=
 for more details=2E<br>- *<br>- * Or, alternatively,<br>- *<br>- *  b) Per=
mission is hereby granted, free of charge, to any person<br>- *     obtaini=
ng a copy of this software and associated documentation<br>- *     files (t=
he "Software"), to deal in the Software without<br>- *     restriction, inc=
luding without limitation the rights to use,<br>- *     copy, modify, merge=
, publish, distribute, sublicense, and/or<br>- *     sell copies of the Sof=
tware, and to permit persons to whom the<br>- *     Software is furnished t=
o do so, subject to the following<br>- *     conditions:<br>- *<br>- *     =
The above copyright notice and this permission notice shall be<br>- *     i=
ncluded in all copies or substantial portions of the Software=2E<br>- *<br>=
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,<br>=
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES<br>=
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>- *    =
 NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT<br>- *     H=
OLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,<br>- *     WHET=
HER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING<br>- *     FROM, O=
UT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<br>- *     OTHER DEA=
LINGS IN THE SOFTWARE=2E<br>  */<br> <br> /dts-v1/;<br>diff --git a/arch/ar=
m/boot/dts/imx6q-apalis-ixora-v1=2E1=2Edts b/arch/arm/boot/dts/imx6q-apalis=
-ixora-v1=2E1=2Edts<br>index b94bb687be6b=2E=2E1e365e2636c4 100644<br>--- a=
/arch/arm/boot/dts/imx6q-apalis-ixora-v1=2E1=2Edts<br>+++ b/arch/arm/boot/d=
ts/imx6q-apalis-ixora-v1=2E1=2Edts<br>@@ -1,44 +1,8 @@<br>+// SPDX-License-=
Identifier: (GPL-2=2E0 OR X11)<br> /*<br>- * Copyright 2014-2017 Toradex AG=
<br>+ * Copyright 2014-2019 Toradex AG<br>  * Copyright 2012 Freescale Semi=
conductor, Inc=2E<br>  * Copyright 2011 Linaro Ltd=2E<br>- *<br>- * This fi=
le is dual-licensed: you can use it either under the terms<br>- * of the GP=
L or the X11 license, at your option=2E Note that this dual<br>- * licensin=
g only applies to this file, and not this project as a<br>- * whole=2E<br>-=
 *<br>- *  a) This file is free software; you can redistribute it and/or<br=
>- *     modify it under the terms of the GNU General Public License<br>- *=
     version 2 as published by the Free Software Foundation=2E<br>- *<br>- =
*     This file is distributed in the hope that it will be useful,<br>- *  =
   but WITHOUT ANY WARRANTY; without even the implied warranty of<br>- *   =
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *   =
  GNU General Public License for more details=2E<br>- *<br>- * Or, alternat=
ively,<br>- *<br>- *  b) Permission is hereby granted, free of charge, to a=
ny person<br>- *     obtaining a copy of this software and associated docum=
entation<br>- *     files (the "Software"), to deal in the Software without=
<br>- *     restriction, including without limitation the rights to use,<br=
>- *     copy, modify, merge, publish, distribute, sublicense, and/or<br>- =
*     sell copies of the Software, and to permit persons to whom the<br>- *=
     Software is furnished to do so, subject to the following<br>- *     co=
nditions:<br>- *<br>- *     The above copyright notice and this permission =
notice shall be<br>- *     included in all copies or substantial portions o=
f the Software=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHO=
UT WARRANTY OF ANY KIND,<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT L=
IMITED TO THE WARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTI=
CULAR PURPOSE AND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHO=
RS OR COPYRIGHT<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R LIABILITY,<br>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
, ARISING<br>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE=
 USE OR<br>- *     OTHER DEALINGS IN THE SOFTWARE=2E<br>  */<br> <br> /dts-=
v1/;<br>diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora=2Edts b/arch/arm/=
boot/dts/imx6q-apalis-ixora=2Edts<br>index 302fd6adc8a7=2E=2Edeb5509d3597 1=
00644<br>--- a/arch/arm/boot/dts/imx6q-apalis-ixora=2Edts<br>+++ b/arch/arm=
/boot/dts/imx6q-apalis-ixora=2Edts<br>@@ -1,44 +1,8 @@<br>+// SPDX-License-=
Identifier: (GPL-2=2E0 OR X11)<br> /*<br>- * Copyright 2014-2017 Toradex AG=
<br>+ * Copyright 2014-2019 Toradex AG<br>  * Copyright 2012 Freescale Semi=
conductor, Inc=2E<br>  * Copyright 2011 Linaro Ltd=2E<br>- *<br>- * This fi=
le is dual-licensed: you can use it either under the terms<br>- * of the GP=
L or the X11 license, at your option=2E Note that this dual<br>- * licensin=
g only applies to this file, and not this project as a<br>- * whole=2E<br>-=
 *<br>- *  a) This file is free software; you can redistribute it and/or<br=
>- *     modify it under the terms of the GNU General Public License<br>- *=
     version 2 as published by the Free Software Foundation=2E<br>- *<br>- =
*     This file is distributed in the hope that it will be useful,<br>- *  =
   but WITHOUT ANY WARRANTY; without even the implied warranty of<br>- *   =
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *   =
  GNU General Public License for more details=2E<br>- *<br>- * Or, alternat=
ively,<br>- *<br>- *  b) Permission is hereby granted, free of charge, to a=
ny person<br>- *     obtaining a copy of this software and associated docum=
entation<br>- *     files (the "Software"), to deal in the Software without=
<br>- *     restriction, including without limitation the rights to use,<br=
>- *     copy, modify, merge, publish, distribute, sublicense, and/or<br>- =
*     sell copies of the Software, and to permit persons to whom the<br>- *=
     Software is furnished to do so, subject to the following<br>- *     co=
nditions:<br>- *<br>- *     The above copyright notice and this permission =
notice shall be<br>- *     included in all copies or substantial portions o=
f the Software=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHO=
UT WARRANTY OF ANY KIND,<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT L=
IMITED TO THE WARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTI=
CULAR PURPOSE AND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHO=
RS OR COPYRIGHT<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R LIABILITY,<br>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
, ARISING<br>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE=
 USE OR<br>- *     OTHER DEALINGS IN THE SOFTWARE=2E<br>  */<br> <br> /dts-=
v1/;<br>diff --git a/arch/arm/boot/dts/imx6qdl-apalis=2Edtsi b/arch/arm/boo=
t/dts/imx6qdl-apalis=2Edtsi<br>index 7c4ad541c3f5=2E=2E031c021a7fc5 100644<=
br>--- a/arch/arm/boot/dts/imx6qdl-apalis=2Edtsi<br>+++ b/arch/arm/boot/dts=
/imx6qdl-apalis=2Edtsi<br>@@ -1,44 +1,8 @@<br>+// SPDX-License-Identifier: =
(GPL-2=2E0 OR X11)<br> /*<br>- * Copyright 2014-2017 Toradex AG<br>+ * Copy=
right 2014-2019 Toradex AG<br>  * Copyright 2012 Freescale Semiconductor, I=
nc=2E<br>  * Copyright 2011 Linaro Ltd=2E<br>- *<br>- * This file is dual-l=
icensed: you can use it either under the terms<br>- * of the GPL or the X11=
 license, at your option=2E Note that this dual<br>- * licensing only appli=
es to this file, and not this project as a<br>- * whole=2E<br>- *<br>- *  a=
) This file is free software; you can redistribute it and/or<br>- *     mod=
ify it under the terms of the GNU General Public License<br>- *     version=
 2 as published by the Free Software Foundation=2E<br>- *<br>- *     This f=
ile is distributed in the hope that it will be useful,<br>- *     but WITHO=
UT ANY WARRANTY; without even the implied warranty of<br>- *     MERCHANTAB=
ILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *     GNU Genera=
l Public License for more details=2E<br>- *<br>- * Or, alternatively,<br>- =
*<br>- *  b) Permission is hereby granted, free of charge, to any person<br=
>- *     obtaining a copy of this software and associated documentation<br>=
- *     files (the "Software"), to deal in the Software without<br>- *     =
restriction, including without limitation the rights to use,<br>- *     cop=
y, modify, merge, publish, distribute, sublicense, and/or<br>- *     sell c=
opies of the Software, and to permit persons to whom the<br>- *     Softwar=
e is furnished to do so, subject to the following<br>- *     conditions:<br=
>- *<br>- *     The above copyright notice and this permission notice shall=
 be<br>- *     included in all copies or substantial portions of the Softwa=
re=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY =
OF ANY KIND,<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO TH=
E WARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOS=
E AND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRI=
GHT<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,=
<br>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING<br=
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<br>-=
 *     OTHER DEALINGS IN THE SOFTWARE=2E<br>  */<br> <br> #include &lt;dt-b=
indings/gpio/gpio=2Eh&gt;<br>diff --git a/arch/arm/boot/dts/imx7-colibri-ev=
al-v3=2Edtsi b/arch/arm/boot/dts/imx7-colibri-eval-v3=2Edtsi<br>index 3f274=
6169181=2E=2E43b6be76941b 100644<br>--- a/arch/arm/boot/dts/imx7-colibri-ev=
al-v3=2Edtsi<br>+++ b/arch/arm/boot/dts/imx7-colibri-eval-v3=2Edtsi<br>@@ -=
1,43 +1,6 @@<br>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)<br> /*<br>=
  * Copyright 2016 Toradex AG<br>- *<br>- * This file is dual-licensed: you=
 can use it either under the terms<br>- * of the GPL or the X11 license, at=
 your option=2E Note that this dual<br>- * licensing only applies to this f=
ile, and not this project as a<br>- * whole=2E<br>- *<br>- *  a) This file =
is free software; you can redistribute it and/or<br>- *     modify it under=
 the terms of the GNU General Public License as<br>- *     published by the=
 Free Software Foundation; either version 2 of the<br>- *     License, or (=
at your option) any later version=2E<br>- *<br>- *     This file is distrib=
uted in the hope that it will be useful,<br>- *     but WITHOUT ANY WARRANT=
Y; without even the implied warranty of<br>- *     MERCHANTABILITY or FITNE=
SS FOR A PARTICULAR PURPOSE=2E  See the<br>- *     GNU General Public Licen=
se for more details=2E<br>- *<br>- * Or, alternatively,<br>- *<br>- *  b) P=
ermission is hereby granted, free of charge, to any person<br>- *     obtai=
ning a copy of this software and associated documentation<br>- *     files =
(the "Software"), to deal in the Software without<br>- *     restriction, i=
ncluding without limitation the rights to use,<br>- *     copy, modify, mer=
ge, publish, distribute, sublicense, and/or<br>- *     sell copies of the S=
oftware, and to permit persons to whom the<br>- *     Software is furnished=
 to do so, subject to the following<br>- *     conditions:<br>- *<br>- *   =
  The above copyright notice and this permission notice shall be<br>- *    =
 included in all copies or substantial portions of the Software=2E<br>- *<b=
r>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,<b=
r>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES<b=
r>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>- *  =
   NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT<br>- *    =
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,<br>- *     WH=
ETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING<br>- *     FROM,=
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<br>- *     OTHER D=
EALINGS IN THE SOFTWARE=2E<br>  */<br> <br> / {<br>diff --git a/arch/arm/bo=
ot/dts/imx7-colibri=2Edtsi b/arch/arm/boot/dts/imx7-colibri=2Edtsi<br>index=
 895fbde4d433=2E=2Ec53e9576813b 100644<br>--- a/arch/arm/boot/dts/imx7-coli=
bri=2Edtsi<br>+++ b/arch/arm/boot/dts/imx7-colibri=2Edtsi<br>@@ -1,43 +1,6 =
@@<br>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)<br> /*<br>  * Copyri=
ght 2016 Toradex AG<br>- *<br>- * This file is dual-licensed: you can use i=
t either under the terms<br>- * of the GPL or the X11 license, at your opti=
on=2E Note that this dual<br>- * licensing only applies to this file, and n=
ot this project as a<br>- * whole=2E<br>- *<br>- *  a) This file is free so=
ftware; you can redistribute it and/or<br>- *     modify it under the terms=
 of the GNU General Public License as<br>- *     published by the Free Soft=
ware Foundation; either version 2 of the<br>- *     License, or (at your op=
tion) any later version=2E<br>- *<br>- *     This file is distributed in th=
e hope that it will be useful,<br>- *     but WITHOUT ANY WARRANTY; without=
 even the implied warranty of<br>- *     MERCHANTABILITY or FITNESS FOR A P=
ARTICULAR PURPOSE=2E  See the<br>- *     GNU General Public License for mor=
e details=2E<br>- *<br>- * Or, alternatively,<br>- *<br>- *  b) Permission =
is hereby granted, free of charge, to any person<br>- *     obtaining a cop=
y of this software and associated documentation<br>- *     files (the "Soft=
ware"), to deal in the Software without<br>- *     restriction, including w=
ithout limitation the rights to use,<br>- *     copy, modify, merge, publis=
h, distribute, sublicense, and/or<br>- *     sell copies of the Software, a=
nd to permit persons to whom the<br>- *     Software is furnished to do so,=
 subject to the following<br>- *     conditions:<br>- *<br>- *     The abov=
e copyright notice and this permission notice shall be<br>- *     included =
in all copies or substantial portions of the Software=2E<br>- *<br>- *     =
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,<br>- *     =
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES<br>- *     =
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>- *     NONINFR=
INGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT<br>- *     HOLDERS B=
E LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,<br>- *     WHETHER IN A=
N ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING<br>- *     FROM, OUT OF OR=
 IN CONNECTION WITH THE SOFTWARE OR THE USE OR<br>- *     OTHER DEALINGS IN=
 THE SOFTWARE=2E<br>  */<br> <br> / {<br>diff --git a/arch/arm/boot/dts/imx=
7d-colibri-eval-v3=2Edts b/arch/arm/boot/dts/imx7d-colibri-eval-v3=2Edts<br=
>index 136e11ab4893=2E=2E5077ec355725 100644<br>--- a/arch/arm/boot/dts/imx=
7d-colibri-eval-v3=2Edts<br>+++ b/arch/arm/boot/dts/imx7d-colibri-eval-v3=
=2Edts<br>@@ -1,43 +1,6 @@<br>+// SPDX-License-Identifier: (GPL-2=2E0+ OR X=
11)<br> /*<br>  * Copyright 2016 Toradex AG<br>- *<br>- * This file is dual=
-licensed: you can use it either under the terms<br>- * of the GPL or the X=
11 license, at your option=2E Note that this dual<br>- * licensing only app=
lies to this file, and not this project as a<br>- * whole=2E<br>- *<br>- * =
 a) This file is free software; you can redistribute it and/or<br>- *     m=
odify it under the terms of the GNU General Public License as<br>- *     pu=
blished by the Free Software Foundation; either version 2 of the<br>- *    =
 License, or (at your option) any later version=2E<br>- *<br>- *     This f=
ile is distributed in the hope that it will be useful,<br>- *     but WITHO=
UT ANY WARRANTY; without even the implied warranty of<br>- *     MERCHANTAB=
ILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *     GNU Genera=
l Public License for more details=2E<br>- *<br>- * Or, alternatively,<br>- =
*<br>- *  b) Permission is hereby granted, free of charge, to any person<br=
>- *     obtaining a copy of this software and associated documentation<br>=
- *     files (the "Software"), to deal in the Software without<br>- *     =
restriction, including without limitation the rights to use,<br>- *     cop=
y, modify, merge, publish, distribute, sublicense, and/or<br>- *     sell c=
opies of the Software, and to permit persons to whom the<br>- *     Softwar=
e is furnished to do so, subject to the following<br>- *     conditions:<br=
>- *<br>- *     The above copyright notice and this permission notice shall=
 be<br>- *     included in all copies or substantial portions of the Softwa=
re=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY =
OF ANY KIND,<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO TH=
E WARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOS=
E AND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRI=
GHT<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,=
<br>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING<br=
>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<br>-=
 *     OTHER DEALINGS IN THE SOFTWARE=2E<br>  */<br> <br> /dts-v1/;<br>diff=
 --git a/arch/arm/boot/dts/imx7d-colibri=2Edtsi b/arch/arm/boot/dts/imx7d-c=
olibri=2Edtsi<br>index e2e327f437e3=2E=2Efc5573171114 100644<br>--- a/arch/=
arm/boot/dts/imx7d-colibri=2Edtsi<br>+++ b/arch/arm/boot/dts/imx7d-colibri=
=2Edtsi<br>@@ -1,43 +1,6 @@<br>+// SPDX-License-Identifier: (GPL-2=2E0+ OR =
X11)<br> /*<br>- * Copyright 2016 Toradex AG<br>- *<br>- * This file is dua=
l-licensed: you can use it either under the terms<br>- * of the GPL or the =
X11 license, at your option=2E Note that this dual<br>- * licensing only ap=
plies to this file, and not this project as a<br>- * whole=2E<br>- *<br>- *=
  a) This file is free software; you can redistribute it and/or<br>- *     =
modify it under the terms of the GNU General Public License as<br>- *     p=
ublished by the Free Software Foundation; either version 2 of the<br>- *   =
  License, or (at your option) any later version=2E<br>- *<br>- *     This =
file is distributed in the hope that it will be useful,<br>- *     but WITH=
OUT ANY WARRANTY; without even the implied warranty of<br>- *     MERCHANTA=
BILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *     GNU Gener=
al Public License for more details=2E<br>- *<br>- * Or, alternatively,<br>-=
 *<br>- *  b) Permission is hereby granted, free of charge, to any person<b=
r>- *     obtaining a copy of this software and associated documentation<br=
>- *     files (the "Software"), to deal in the Software without<br>- *    =
 restriction, including without limitation the rights to use,<br>- *     co=
py, modify, merge, publish, distribute, sublicense, and/or<br>- *     sell =
copies of the Software, and to permit persons to whom the<br>- *     Softwa=
re is furnished to do so, subject to the following<br>- *     conditions:<b=
r>- *<br>- *     The above copyright notice and this permission notice shal=
l be<br>- *     included in all copies or substantial portions of the Softw=
are=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY=
 OF ANY KIND,<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO T=
HE WARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPO=
SE AND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYR=
IGHT<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY=
,<br>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING<b=
r>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<br>=
- *     OTHER DEALINGS IN THE SOFTWARE=2E<br>+ * Copyright 2016-2019 Torade=
x AG<br>  */<br> <br> #include "imx7d=2Edtsi"<br>diff --git a/arch/arm/boot=
/dts/imx7s-colibri-eval-v3=2Edts b/arch/arm/boot/dts/imx7s-colibri-eval-v3=
=2Edts<br>index bd2a49c1ade6=2E=2Ec12bb60b6acb 100644<br>--- a/arch/arm/boo=
t/dts/imx7s-colibri-eval-v3=2Edts<br>+++ b/arch/arm/boot/dts/imx7s-colibri-=
eval-v3=2Edts<br>@@ -1,43 +1,6 @@<br>+// SPDX-License-Identifier: (GPL-2=2E=
0+ OR X11)<br> /*<br>- * Copyright 2016 Toradex AG<br>- *<br>- * This file =
is dual-licensed: you can use it either under the terms<br>- * of the GPL o=
r the X11 license, at your option=2E Note that this dual<br>- * licensing o=
nly applies to this file, and not this project as a<br>- * whole=2E<br>- *<=
br>- *  a) This file is free software; you can redistribute it and/or<br>- =
*     modify it under the terms of the GNU General Public License as<br>- *=
     published by the Free Software Foundation; either version 2 of the<br>=
- *     License, or (at your option) any later version=2E<br>- *<br>- *    =
 This file is distributed in the hope that it will be useful,<br>- *     bu=
t WITHOUT ANY WARRANTY; without even the implied warranty of<br>- *     MER=
CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *     GNU=
 General Public License for more details=2E<br>- *<br>- * Or, alternatively=
,<br>- *<br>- *  b) Permission is hereby granted, free of charge, to any pe=
rson<br>- *     obtaining a copy of this software and associated documentat=
ion<br>- *     files (the "Software"), to deal in the Software without<br>-=
 *     restriction, including without limitation the rights to use,<br>- * =
    copy, modify, merge, publish, distribute, sublicense, and/or<br>- *    =
 sell copies of the Software, and to permit persons to whom the<br>- *     =
Software is furnished to do so, subject to the following<br>- *     conditi=
ons:<br>- *<br>- *     The above copyright notice and this permission notic=
e shall be<br>- *     included in all copies or substantial portions of the=
 Software=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WA=
RRANTY OF ANY KIND,<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITE=
D TO THE WARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR=
 PURPOSE AND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR=
 COPYRIGHT<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIA=
BILITY,<br>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING<br>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR<br>- *     OTHER DEALINGS IN THE SOFTWARE=2E<br>+ * Copyright 2016-2019 =
Toradex AG<br>  */<br> <br> /dts-v1/;<br>diff --git a/arch/arm/boot/dts/imx=
7s-colibri=2Edtsi b/arch/arm/boot/dts/imx7s-colibri=2Edtsi<br>index 1fb1ec5=
d3d70=2E=2E3f3e0fbc8597 100644<br>--- a/arch/arm/boot/dts/imx7s-colibri=2Ed=
tsi<br>+++ b/arch/arm/boot/dts/imx7s-colibri=2Edtsi<br>@@ -1,43 +1,6 @@<br>=
+// SPDX-License-Identifier: (GPL-2=2E0+ OR X11)<br> /*<br>- * Copyright 20=
16 Toradex AG<br>- *<br>- * This file is dual-licensed: you can use it eith=
er under the terms<br>- * of the GPL or the X11 license, at your option=2E =
Note that this dual<br>- * licensing only applies to this file, and not thi=
s project as a<br>- * whole=2E<br>- *<br>- *  a) This file is free software=
; you can redistribute it and/or<br>- *     modify it under the terms of th=
e GNU General Public License as<br>- *     published by the Free Software F=
oundation; either version 2 of the<br>- *     License, or (at your option) =
any later version=2E<br>- *<br>- *     This file is distributed in the hope=
 that it will be useful,<br>- *     but WITHOUT ANY WARRANTY; without even =
the implied warranty of<br>- *     MERCHANTABILITY or FITNESS FOR A PARTICU=
LAR PURPOSE=2E  See the<br>- *     GNU General Public License for more deta=
ils=2E<br>- *<br>- * Or, alternatively,<br>- *<br>- *  b) Permission is her=
eby granted, free of charge, to any person<br>- *     obtaining a copy of t=
his software and associated documentation<br>- *     files (the "Software")=
, to deal in the Software without<br>- *     restriction, including without=
 limitation the rights to use,<br>- *     copy, modify, merge, publish, dis=
tribute, sublicense, and/or<br>- *     sell copies of the Software, and to =
permit persons to whom the<br>- *     Software is furnished to do so, subje=
ct to the following<br>- *     conditions:<br>- *<br>- *     The above copy=
right notice and this permission notice shall be<br>- *     included in all=
 copies or substantial portions of the Software=2E<br>- *<br>- *     THE SO=
FTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,<br>- *     EXPRES=
S OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES<br>- *     OF MER=
CHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>- *     NONINFRINGEME=
NT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT<br>- *     HOLDERS BE LIAB=
LE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,<br>- *     WHETHER IN AN ACTI=
ON OF CONTRACT, TORT OR OTHERWISE, ARISING<br>- *     FROM, OUT OF OR IN CO=
NNECTION WITH THE SOFTWARE OR THE USE OR<br>- *     OTHER DEALINGS IN THE S=
OFTWARE=2E<br>+ * Copyright 2016-2019 Toradex AG<br>  */<br> <br> #include =
"imx7s=2Edtsi"<br>diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi =
b/arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi<br>index e2da122a63f4=2E=2Ee5=
337a93c3d1 100644<br>--- a/arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi<br>+=
++ b/arch/arm/boot/dts/vf-colibri-eval-v3=2Edtsi<br>@@ -1,42 +1,6 @@<br>+//=
 SPDX-License-Identifier: (GPL-2=2E0 OR X11)<br> /*<br>- * Copyright 2014 T=
oradex AG<br>- *<br>- * This file is dual-licensed: you can use it either u=
nder the terms<br>- * of the GPL or the X11 license, at your option=2E Note=
 that this dual<br>- * licensing only applies to this file, and not this pr=
oject as a<br>- * whole=2E<br>- *<br>- *  a) This file is free software; yo=
u can redistribute it and/or<br>- *     modify it under the terms of the GN=
U General Public License<br>- *     version 2 as published by the Free Soft=
ware Foundation=2E<br>- *<br>- *     This file is distributed in the hope t=
hat it will be useful,<br>- *     but WITHOUT ANY WARRANTY; without even th=
e implied warranty of<br>- *     MERCHANTABILITY or FITNESS FOR A PARTICULA=
R PURPOSE=2E  See the<br>- *     GNU General Public License for more detail=
s=2E<br>- *<br>- * Or, alternatively,<br>- *<br>- *  b) Permission is hereb=
y granted, free of charge, to any person<br>- *     obtaining a copy of thi=
s software and associated documentation<br>- *     files (the "Software"), =
to deal in the Software without<br>- *     restriction, including without l=
imitation the rights to use,<br>- *     copy, modify, merge, publish, distr=
ibute, sublicense, and/or<br>- *     sell copies of the Software, and to pe=
rmit persons to whom the<br>- *     Software is furnished to do so, subject=
 to the following<br>- *     conditions:<br>- *<br>- *     The above copyri=
ght notice and this permission notice shall be<br>- *     included in all c=
opies or substantial portions of the Software=2E<br>- *<br>- *     THE SOFT=
WARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,<br>- *     EXPRESS =
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES<br>- *     OF MERCH=
ANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>- *     NONINFRINGEMENT=
=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT<br>- *     HOLDERS BE LIABLE=
 FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,<br>- *     WHETHER IN AN ACTION=
 OF CONTRACT, TORT OR OTHERWISE, ARISING<br>- *     FROM, OUT OF OR IN CONN=
ECTION WITH THE SOFTWARE OR THE USE OR<br>- *     OTHER DEALINGS IN THE SOF=
TWARE=2E<br>+ * Copyright 2014-2016 Toradex AG<br>  */<br> <br> / {<br>diff=
 --git a/arch/arm/boot/dts/vf-colibri=2Edtsi b/arch/arm/boot/dts/vf-colibri=
=2Edtsi<br>index b6a1eeeb2bb4=2E=2E34a93fe90a5c 100644<br>--- a/arch/arm/bo=
ot/dts/vf-colibri=2Edtsi<br>+++ b/arch/arm/boot/dts/vf-colibri=2Edtsi<br>@@=
 -1,42 +1,6 @@<br>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)<br> /*<br=
>  * Copyright 2014 Toradex AG<br>- *<br>- * This file is dual-licensed: yo=
u can use it either under the terms<br>- * of the GPL or the X11 license, a=
t your option=2E Note that this dual<br>- * licensing only applies to this =
file, and not this project as a<br>- * whole=2E<br>- *<br>- *  a) This file=
 is free software; you can redistribute it and/or<br>- *     modify it unde=
r the terms of the GNU General Public License<br>- *     version 2 as publi=
shed by the Free Software Foundation=2E<br>- *<br>- *     This file is dist=
ributed in the hope that it will be useful,<br>- *     but WITHOUT ANY WARR=
ANTY; without even the implied warranty of<br>- *     MERCHANTABILITY or FI=
TNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *     GNU General Public Li=
cense for more details=2E<br>- *<br>- * Or, alternatively,<br>- *<br>- *  b=
) Permission is hereby granted, free of charge, to any person<br>- *     ob=
taining a copy of this software and associated documentation<br>- *     fil=
es (the "Software"), to deal in the Software without<br>- *     restriction=
, including without limitation the rights to use,<br>- *     copy, modify, =
merge, publish, distribute, sublicense, and/or<br>- *     sell copies of th=
e Software, and to permit persons to whom the<br>- *     Software is furnis=
hed to do so, subject to the following<br>- *     conditions:<br>- *<br>- *=
     The above copyright notice and this permission notice shall be<br>- * =
    included in all copies or substantial portions of the Software=2E<br>- =
*<br>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND=
,<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIE=
S<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>- =
*     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT<br>- * =
    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,<br>- *    =
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING<br>- *     FR=
OM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR<br>- *     OTHE=
R DEALINGS IN THE SOFTWARE=2E<br>  */<br> <br> / {<br>diff --git a/arch/arm=
/boot/dts/vf500-colibri-eval-v3=2Edts b/arch/arm/boot/dts/vf500-colibri-eva=
l-v3=2Edts<br>index 076998968fb5=2E=2Ea4b97e9d22d9 100644<br>--- a/arch/arm=
/boot/dts/vf500-colibri-eval-v3=2Edts<br>+++ b/arch/arm/boot/dts/vf500-coli=
bri-eval-v3=2Edts<br>@@ -1,42 +1,6 @@<br>+// SPDX-License-Identifier: (GPL-=
2=2E0 OR X11)<br> /*<br>- * Copyright 2014 Toradex AG<br>- *<br>- * This fi=
le is dual-licensed: you can use it either under the terms<br>- * of the GP=
L or the X11 license, at your option=2E Note that this dual<br>- * licensin=
g only applies to this file, and not this project as a<br>- * whole=2E<br>-=
 *<br>- *  a) This file is free software; you can redistribute it and/or<br=
>- *     modify it under the terms of the GNU General Public License<br>- *=
     version 2 as published by the Free Software Foundation=2E<br>- *<br>- =
*     This file is distributed in the hope that it will be useful,<br>- *  =
   but WITHOUT ANY WARRANTY; without even the implied warranty of<br>- *   =
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=2E  See the<br>- *   =
  GNU General Public License for more details=2E<br>- *<br>- * Or, alternat=
ively,<br>- *<br>- *  b) Permission is hereby granted, free of charge, to a=
ny person<br>- *     obtaining a copy of this software and associated docum=
entation<br>- *     files (the "Software"), to deal in the Software without=
<br>- *     restriction, including without limitation the rights to use,<br=
>- *     copy, modify, merge, publish, distribute, sublicense, and/or<br>- =
*     sell copies of the Software, and to permit persons to whom the<br>- *=
     Software is furnished to do so, subject to the following<br>- *     co=
nditions:<br>- *<br>- *     The above copyright notice and this permission =
notice shall be<br>- *     included in all copies or substantial portions o=
f the Software=2E<br>- *<br>- *     THE SOFTWARE IS PROVIDED "AS IS", WITHO=
UT WARRANTY OF ANY KIND,<br>- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT L=
IMITED TO THE WARRANTIES<br>- *     OF MERCHANTABILITY, FITNESS FOR A PARTI=
CULAR PURPOSE AND<br>- *     NONINFRINGEMENT=2E IN NO EVENT SHALL THE AUTHO=
RS OR COPYRIGHT<br>- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R LIABILITY,<br>- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
, ARISING<br>- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE=
 USE OR<br>- *     OTHER DEALINGS IN THE SOFTWARE=2E<br>+ * Copyright 2014-=
2019 Toradex AG<br>  */<br> <br> /dts-v1/;<br>diff --git a/arch/arm/boot/dt=
s/vf500-colibri=2Edtsi b/arch/arm/boot/dts/vf500-colibri=2Edtsi<br>index 23=
7b0246fa84=2E=2E54e96b311a48 100644<br>--- a/arch/arm/boot/dts/vf500-colibr=
i=2Edtsi<br>+++ b/arch/arm/boot/dts/vf500-colibri=2Edtsi<br>@@ -1,42 +1,7 @=
@<br>+// SPDX-License-Identifier: (GPL-2=2E0 OR X11)<br> /*<br>- * Copyrigh=
t 2014 Toradex AG<br>+ * Copyright 2014-2019 Toradex AG<br>  *<br>- * This =
file is dual-licensed: you can use it either under the terms<br>- </pre></b=
lockquote></div><br>-- <br>Sent from my Android device with K-9 Mail=2E Ple=
ase excuse my brevity=2E</body></html>
------ADY3BQGTWPF54EBVBLO6X3AYXYRJUF--
