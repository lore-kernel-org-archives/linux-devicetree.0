Return-Path: <SRS0=Dthd=2E=us.ibm.com=eajames@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH linux v8 0/6] drivers: hwmon: Add On-Chip Controller driver
From: "Edward James" <eajames@us.ibm.com>
Date: Thu, 23 Feb 2017 16:43:20 -0600
References: <1487104463-4253-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-type: multipart/alternative;
	Boundary="0__=8FBB0A43DFEFDD3D8f9e8a93df938690918c8FBB0A43DFEFDD3D"
Content-Disposition: inline
Message-Id: <OF68CFA9BA.DAF80746-ON002580D0.007C5BAD-862580D0.007CD16A@notes.na.collabserv.com>
To: linux@roeck-us.net
Cc: andrew@aj.id.au, benh@kernel.crashing.org, corbet@lwn.net, devicetree@vger.kernel.org, jdelvare@suse.com, joel@jms.id.a, linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de, Eddie James <eajames@linux.vnet.ibm.com>
List-ID: <devicetree@vger.kernel.org>


--0__=8FBB0A43DFEFDD3D8f9e8a93df938690918c8FBB0A43DFEFDD3D
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII

Hi Guenter,

Any thoughts on this patch set? Others welcome to chime in too.

Thanks,
Eddie

Eddie James <eajames@linux.vnet.ibm.com> wrote on 02/14/2017 02:34:17 PM:

> From: Eddie James <eajames@linux.vnet.ibm.com>
> To: linux@roeck-us.net
> Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-
> hwmon@vger.kernel.org, linux-doc@vger.kernel.org, jdelvare@suse.com,
> corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-
> dreams.de, andrew@aj.id.au, benh@kernel.crashing.org,
> joel@jms.id.au, Edward James/Austin/IBM@IBMUS
> Date: 02/14/2017 02:34 PM
> Subject: [PATCH linux v8 0/6] drivers: hwmon: Add On-Chip Controller
driver
>
> From: "Edward A. James" <eajames@us.ibm.com>
>
> This patchset adds a hwmon driver to support the OCC (On-Chip Controller)
> on the IBM POWER8 and POWER9 processors, from a BMC (Baseboard Management
> Controller). The OCC is an embedded processor that provides real time
> power and thermal monitoring.
>
> The driver provides an interface on a BMC to poll OCC sensor data, set
> user power caps, and perform some basic OCC error handling. It interfaces
> with userspace through hwmon.
>
> The driver is currently functional only for the OCC on POWER8 chips.
> Communicating with the POWER9 OCC requries FSI support.
>
> Since v7:
>  * change Makefile and Kconfig to build a single module for the driver
>  * include p9 file in build
>  * change Kconfig from "PPC" to "IBM"
>  * remove EXPORT=5FSYMBOL
>  * bundle occ=5Fconfig and occ=5Fops structures into occ=5Finit=5Fdata st=
ructure
>  * few style tweaks suggested by Joel
>
> Edward A. James (6):
>   hwmon: Add core On-Chip Controller support for POWER CPUs
>   hwmon: occ: Add sysfs interface
>   hwmon: occ: Add I2C transport implementation for SCOM operations
>   hwmon: occ: Add callbacks for parsing P8 OCC datastructures
>   hwmon: occ: Add hwmon implementation for the P8 OCC
>   hwmon: occ: Add callbacks for parsing P9 OCC datastructures
>
>  Documentation/devicetree/bindings/hwmon/occ.txt |  13 +
>  Documentation/hwmon/occ                         | 116 +++++++
>  MAINTAINERS                                     |   7 +
>  drivers/hwmon/Kconfig                           |   2 +
>  drivers/hwmon/Makefile                          |   1 +
>  drivers/hwmon/occ/Kconfig                       |  39 +++
>  drivers/hwmon/occ/Makefile                      |   5 +
>  drivers/hwmon/occ/occ.c                         | 440 +++++++++++++
> +++++++++++
>  drivers/hwmon/occ/occ.h                         |  77 +++++
>  drivers/hwmon/occ/occ=5Fp8.c                      | 256 ++++++++++++++
>  drivers/hwmon/occ/occ=5Fp8.h                      |  25 ++
>  drivers/hwmon/occ/occ=5Fp8=5Fi2c.c                  |  99 ++++++
>  drivers/hwmon/occ/occ=5Fp9.c                      | 320 +++++++++++++++++
>  drivers/hwmon/occ/occ=5Fp9.h                      |  25 ++
>  drivers/hwmon/occ/occ=5Fscom=5Fi2c.c                |  69 ++++
>  drivers/hwmon/occ/occ=5Fscom=5Fi2c.h                |  21 ++
>  drivers/hwmon/occ/occ=5Fsysfs.c                   | 245 +++++++++++++
>  drivers/hwmon/occ/occ=5Fsysfs.h                   |  25 ++
>  drivers/hwmon/occ/scom.h                        |  42 +++
>  19 files changed, 1827 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
>  create mode 100644 Documentation/hwmon/occ
>  create mode 100644 drivers/hwmon/occ/Kconfig
>  create mode 100644 drivers/hwmon/occ/Makefile
>  create mode 100644 drivers/hwmon/occ/occ.c
>  create mode 100644 drivers/hwmon/occ/occ.h
>  create mode 100644 drivers/hwmon/occ/occ=5Fp8.c
>  create mode 100644 drivers/hwmon/occ/occ=5Fp8.h
>  create mode 100644 drivers/hwmon/occ/occ=5Fp8=5Fi2c.c
>  create mode 100644 drivers/hwmon/occ/occ=5Fp9.c
>  create mode 100644 drivers/hwmon/occ/occ=5Fp9.h
>  create mode 100644 drivers/hwmon/occ/occ=5Fscom=5Fi2c.c
>  create mode 100644 drivers/hwmon/occ/occ=5Fscom=5Fi2c.h
>  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.c
>  create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.h
>  create mode 100644 drivers/hwmon/occ/scom.h
>
> --
> 1.8.3.1
>

--0__=8FBB0A43DFEFDD3D8f9e8a93df938690918c8FBB0A43DFEFDD3D
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><tt>Hi Guenter,</tt><br><br><tt>Any thoughts on this patch s=
et? Others welcome to chime in too.</tt><br><br><tt>Thanks,</tt><br><tt>Edd=
ie</tt><br><br><tt>Eddie James &lt;eajames@linux.vnet.ibm.com&gt; wrote on =
02/14/2017 02:34:17 PM:<br><br>&gt; From: Eddie James &lt;eajames@linux.vne=
t.ibm.com&gt;</tt><br><tt>&gt; To: linux@roeck-us.net</tt><br><tt>&gt; Cc: =
devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-<br>&gt; hw=
mon@vger.kernel.org, linux-doc@vger.kernel.org, jdelvare@suse.com,<br>&gt; =
corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-<br>&gt; =
dreams.de, andrew@aj.id.au, benh@kernel.crashing.org, <br>&gt; joel@jms.id.=
au, Edward James/Austin/IBM@IBMUS</tt><br><tt>&gt; Date: 02/14/2017 02:34 P=
M</tt><br><tt>&gt; Subject: [PATCH linux v8 0/6] drivers: hwmon: Add On-Chi=
p Controller driver</tt><br><tt>&gt; <br>&gt; From: &quot;Edward A. James&q=
uot; &lt;eajames@us.ibm.com&gt;<br>&gt; <br>&gt; This patchset adds a hwmon=
 driver to support the OCC (On-Chip Controller)<br>&gt; on the IBM POWER8 a=
nd POWER9 processors, from a BMC (Baseboard Management<br>&gt; Controller).=
 The OCC is an embedded processor that provides real time<br>&gt; power and=
 thermal monitoring.<br>&gt; <br>&gt; The driver provides an interface on a=
 BMC to poll OCC sensor data, set<br>&gt; user power caps, and perform some=
 basic OCC error handling. It interfaces<br>&gt; with userspace through hwm=
on.<br>&gt; <br>&gt; The driver is currently functional only for the OCC on=
 POWER8 chips.<br>&gt; Communicating with the POWER9 OCC requries FSI suppo=
rt.<br>&gt; <br>&gt; Since v7:<br>&gt; &nbsp;* change Makefile and Kconfig =
to build a single module for the driver<br>&gt; &nbsp;* include p9 file in =
build<br>&gt; &nbsp;* change Kconfig from &quot;PPC&quot; to &quot;IBM&quot=
;<br>&gt; &nbsp;* remove EXPORT=5FSYMBOL<br>&gt; &nbsp;* bundle occ=5Fconfi=
g and occ=5Fops structures into occ=5Finit=5Fdata structure<br>&gt; &nbsp;*=
 few style tweaks suggested by Joel<br>&gt; <br>&gt; Edward A. James (6):<b=
r>&gt; &nbsp; hwmon: Add core On-Chip Controller support for POWER CPUs<br>=
&gt; &nbsp; hwmon: occ: Add sysfs interface<br>&gt; &nbsp; hwmon: occ: Add =
I2C transport implementation for SCOM operations<br>&gt; &nbsp; hwmon: occ:=
 Add callbacks for parsing P8 OCC datastructures<br>&gt; &nbsp; hwmon: occ:=
 Add hwmon implementation for the P8 OCC<br>&gt; &nbsp; hwmon: occ: Add cal=
lbacks for parsing P9 OCC datastructures<br>&gt; <br>&gt; &nbsp;Documentati=
on/devicetree/bindings/hwmon/occ.txt | &nbsp;13 +<br>&gt; &nbsp;Documentati=
on/hwmon/occ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; | 116 +++++++<br>&gt; &nbsp;MAINTAINERS &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 7 +<br>&gt; &nbsp;drivers/hw=
mon/Kconfig &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; 2 +<br>&gt; &nbsp;drivers/hwmon/Makefi=
le &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;| &nbsp; 1 +<br>&gt; &nbsp;drivers/hwmon/occ/Kconfig &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | =
&nbsp;39 +++<br>&gt; &nbsp;drivers/hwmon/occ/Makefile &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp; 5 +<br>&gt;=
 &nbsp;drivers/hwmon/occ/occ.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 440 +++++++++++++<br>&gt; +++++++=
++++<br>&gt; &nbsp;drivers/hwmon/occ/occ.h &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;77 +++++<br>&gt=
; &nbsp;drivers/hwmon/occ/occ=5Fp8.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 256 ++++++++++++++<br>&gt; &nbsp;dr=
ivers/hwmon/occ/occ=5Fp8.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;25 ++<br>&gt; &nbsp;drivers/hwmon/occ/o=
cc=5Fp8=5Fi2c.c &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;| &nbsp;99 ++++++<br>&gt; &nbsp;drivers/hwmon/occ/occ=5Fp9.c &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 320 ++++=
+++++++++++++<br>&gt; &nbsp;drivers/hwmon/occ/occ=5Fp9.h &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;25 ++<br>=
&gt; &nbsp;drivers/hwmon/occ/occ=5Fscom=5Fi2c.c &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;69 ++++<br>&gt; &nbsp;drivers/hwmon/occ=
/occ=5Fscom=5Fi2c.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
| &nbsp;21 ++<br>&gt; &nbsp;drivers/hwmon/occ/occ=5Fsysfs.c &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 245 +++++++++++++<br>&gt;=
 &nbsp;drivers/hwmon/occ/occ=5Fsysfs.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; | &nbsp;25 ++<br>&gt; &nbsp;drivers/hwmon/occ/sc=
om.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;| &nbsp;42 +++<br>&gt; &nbsp;19 files changed, 1827 insertions=
(+)<br>&gt; &nbsp;create mode 100644 Documentation/devicetree/bindings/hwmo=
n/occ.txt<br>&gt; &nbsp;create mode 100644 Documentation/hwmon/occ<br>&gt; =
&nbsp;create mode 100644 drivers/hwmon/occ/Kconfig<br>&gt; &nbsp;create mod=
e 100644 drivers/hwmon/occ/Makefile<br>&gt; &nbsp;create mode 100644 driver=
s/hwmon/occ/occ.c<br>&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ.h<=
br>&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=5Fp8.c<br>&gt; &nbsp=
;create mode 100644 drivers/hwmon/occ/occ=5Fp8.h<br>&gt; &nbsp;create mode =
100644 drivers/hwmon/occ/occ=5Fp8=5Fi2c.c<br>&gt; &nbsp;create mode 100644 =
drivers/hwmon/occ/occ=5Fp9.c<br>&gt; &nbsp;create mode 100644 drivers/hwmon=
/occ/occ=5Fp9.h<br>&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=5Fsc=
om=5Fi2c.c<br>&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=5Fscom=5F=
i2c.h<br>&gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.c<br>&=
gt; &nbsp;create mode 100644 drivers/hwmon/occ/occ=5Fsysfs.h<br>&gt; &nbsp;=
create mode 100644 drivers/hwmon/occ/scom.h<br>&gt; <br>&gt; -- <br>&gt; 1.=
8.3.1<br>&gt; <br></tt><BR>
</body></html>

--0__=8FBB0A43DFEFDD3D8f9e8a93df938690918c8FBB0A43DFEFDD3D--
