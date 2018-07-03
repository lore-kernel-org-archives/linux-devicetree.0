Return-Path: <SRS0=G0Eu=JT=linaro.org=mathieu.poirier@kernel.org>
MIME-Version: 1.0
References: <1530190677-19933-1-git-send-email-suzuki.poulose@arm.com>
In-Reply-To: <1530190677-19933-1-git-send-email-suzuki.poulose@arm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 3 Jul 2018 10:56:25 -0600
Message-ID: <CANLsYkw8bVn+tD=gCm-+Xw0PnueYmWXCbcm0K=fCCD-a7FpOog@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] coresight: Coresight Address Translation Unit support
Content-Type: multipart/alternative; boundary="0000000000007abdc205701b326a"
To: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--0000000000007abdc205701b326a
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Jun 2018 at 06:58, Suzuki K Poulose <suzuki.poulose@arm.com>
wrote:

> Add support for the Coresight Address Translation Unit (CATU), which
> provides improved scatter-gather functionality for TMC-ETR. The CATU
> performs address translation for ETR based on a page table, which
> contains address of 4KB sized data pages, but uses a different
> format from that of the TMC-ETR SG table. The page table format is
> described in the code. See patch
>
>  "coresight: catu: Add support for scatter gather tables"
>
> The CATU devices do not appear on the "software" path for given
> trace session, to leave the management of the device to the driving
> TMC-ETR, depending on the mode of the buffer. Towards this we
> introduce a new class of coresight device_type, helper devices.
> These helper devices are managed by the master devices. The
> build-path operation takes care of making sure that any helper
> device associated with a device is turned on.
>
> Applies on Mathieu's coresight/next tree.
>
> This series is, part 2 of the split of the series [0].


> Changes since v2:
>  - Change coresight_is_catu_device() to checkpatch friendly, without
>    additional variables.
>  - Added Reviewed-by tag from Rob
>
> Changes since v1:
>  - Rename the variables in CATU page table populate for better
>    readability.
>  - Fix broken commit description.
>  - Fix the order of "wait for ready" & "disable hw" in catu_disable_hw.
>
> Changes since [0] :
>  - Remove "restore" buf support and trim down the page table
>    populate code to get rid of "range" updates.
>  - Do not create a circular table by default.
>  - Fix style issues
>  - Set DMA mask for CATU based on the address width.
>  - Rename :
>         coresight_prepare_device => coresight_grab_device
>         coresight_release_device => coresight_drop_device
>    to avoid confusing with coresight_device_release().
>
> [0] - TMC ETR perf support
>  -
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-May/574875.html
>
> Suzuki K Poulose (6):
>   coresight: Cleanup device subtype struct
>   coresight: Add helper device type
>   coresight: Introduce support for Coresight Address Translation Unit
>   dts: bindings: Document device tree binding for CATU
>   coresight: catu: Add support for scatter gather tables
>   coresight: catu: Plug in CATU as a backend for ETR buffer
>
>  .../devicetree/bindings/arm/coresight.txt          |  53 ++
>  drivers/hwtracing/coresight/Kconfig                |  11 +
>  drivers/hwtracing/coresight/Makefile               |   1 +
>  drivers/hwtracing/coresight/coresight-catu.c       | 577
> +++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-catu.h       | 119 +++++
>  drivers/hwtracing/coresight/coresight-tmc-etr.c    |  71 ++-
>  drivers/hwtracing/coresight/coresight-tmc.h        |   3 +
>  drivers/hwtracing/coresight/coresight.c            |  43 +-
>  include/linux/coresight.h                          |  46 +-
>  9 files changed, 910 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/hwtracing/coresight/coresight-catu.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-catu.h
>
>
I have applied this set  - thanks.
Mathieu


> --
> 2.7.4
>
>

--0000000000007abdc205701b326a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, 28 Jun 2018 at 06:58, Suzuki K Poulose &lt;<a href=3D"mailto:suzuki.poulo=
se@arm.com">suzuki.poulose@arm.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Add support for the Coresight Address Translation Unit (CATU=
), which<br>
provides improved scatter-gather functionality for TMC-ETR. The CATU<br>
performs address translation for ETR based on a page table, which<br>
contains address of 4KB sized data pages, but uses a different<br>
format from that of the TMC-ETR SG table. The page table format is<br>
described in the code. See patch<br>
<br>
=C2=A0&quot;coresight: catu: Add support for scatter gather tables&quot;<br=
>
<br>
The CATU devices do not appear on the &quot;software&quot; path for given<b=
r>
trace session, to leave the management of the device to the driving<br>
TMC-ETR, depending on the mode of the buffer. Towards this we<br>
introduce a new class of coresight device_type, helper devices.<br>
These helper devices are managed by the master devices. The<br>
build-path operation takes care of making sure that any helper<br>
device associated with a device is turned on.<br>
<br>
Applies on Mathieu&#39;s coresight/next tree.<br>
<br>
This series is, part 2 of the split of the series [0].</blockquote><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
Changes since v2:<br>
=C2=A0- Change coresight_is_catu_device() to checkpatch friendly, without<b=
r>
=C2=A0 =C2=A0additional variables.<br>
=C2=A0- Added Reviewed-by tag from Rob<br>
<br>
Changes since v1:<br>
=C2=A0- Rename the variables in CATU page table populate for better<br>
=C2=A0 =C2=A0readability.<br>
=C2=A0- Fix broken commit description.<br>
=C2=A0- Fix the order of &quot;wait for ready&quot; &amp; &quot;disable hw&=
quot; in catu_disable_hw.<br>
<br>
Changes since [0] :<br>
=C2=A0- Remove &quot;restore&quot; buf support and trim down the page table=
<br>
=C2=A0 =C2=A0populate code to get rid of &quot;range&quot; updates.<br>
=C2=A0- Do not create a circular table by default.<br>
=C2=A0- Fix style issues<br>
=C2=A0- Set DMA mask for CATU based on the address width.<br>
=C2=A0- Rename :<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 coresight_prepare_device =3D&gt; coresight_grab=
_device<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 coresight_release_device =3D&gt; coresight_drop=
_device<br>
=C2=A0 =C2=A0to avoid confusing with coresight_device_release().<br>
<br>
[0] - TMC ETR perf support<br>
=C2=A0- <a href=3D"http://lists.infradead.org/pipermail/linux-arm-kernel/20=
18-May/574875.html" rel=3D"noreferrer" target=3D"_blank">http://lists.infra=
dead.org/pipermail/linux-arm-kernel/2018-May/574875.html</a><br>
<br>
Suzuki K Poulose (6):<br>
=C2=A0 coresight: Cleanup device subtype struct<br>
=C2=A0 coresight: Add helper device type<br>
=C2=A0 coresight: Introduce support for Coresight Address Translation Unit<=
br>
=C2=A0 dts: bindings: Document device tree binding for CATU<br>
=C2=A0 coresight: catu: Add support for scatter gather tables<br>
=C2=A0 coresight: catu: Plug in CATU as a backend for ETR buffer<br>
<br>
=C2=A0.../devicetree/bindings/arm/coresight.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 53 ++<br>
=C2=A0drivers/hwtracing/coresight/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +<br>
=C2=A0drivers/hwtracing/coresight/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0drivers/hwtracing/coresight/coresight-catu.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 577 +++++++++++++++++++++<br>
=C2=A0drivers/hwtracing/coresight/coresight-catu.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 119 +++++<br>
=C2=A0drivers/hwtracing/coresight/coresight-tmc-etr.c=C2=A0 =C2=A0 |=C2=A0 =
71 ++-<br>
=C2=A0drivers/hwtracing/coresight/coresight-tmc.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0drivers/hwtracing/coresight/coresight.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 43 +-<br>
=C2=A0include/linux/coresight.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 46 +-<br>
=C2=A09 files changed, 910 insertions(+), 14 deletions(-)<br>
=C2=A0create mode 100644 drivers/hwtracing/coresight/coresight-catu.c<br>
=C2=A0create mode 100644 drivers/hwtracing/coresight/coresight-catu.h<br>
<br></blockquote><div><br></div><div>I have applied this set =C2=A0- thanks=
.</div><div>Mathieu</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-- <br>
2.7.4<br>
<br>
</blockquote></div></div>

--0000000000007abdc205701b326a--
