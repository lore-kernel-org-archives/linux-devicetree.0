Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F03C35247
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 17:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77E9521582
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 17:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qsT3Qguk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgBCR5Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 12:57:16 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:33145 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728278AbgBCR5P (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 12:57:15 -0500
Received: by mail-il1-f193.google.com with SMTP id s18so13422913iln.0
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 09:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9bPgLq4fxHtZ7V4hkGSEsGnhWiB7fVcuZDJ7/9065VM=;
        b=qsT3Qguk0+XJD2ZQ+/JQkvwcEZdeSY/KPxTEJLyJuW4/PjNAmKZH/FQXUQvS4o/TEi
         eOoOOPv1MkUYq4H5pAzUfmJ6ZFBgxMPJxCxQ/boBSgyMsbhVsZBBoZGeaNWycvjxi5qB
         z9SgZ32ofVUz4eQ9M7IjUXw+OAy39iMtimHKJ9NImzv+rsFWXH55fmxmGKU3Xeb473B3
         mq2U1w+Zv8JYbobRbbOxEWsY/d+9b3SKkPm738wP/CN8iZWVO5idhWc/SGc4BUNUViCJ
         YHlraea2GLtQFf06tQToHkg9dX/c7kzx7ICxDGV3uiho0w2xd+zbTu1Yx0HnS25eQmpU
         LNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9bPgLq4fxHtZ7V4hkGSEsGnhWiB7fVcuZDJ7/9065VM=;
        b=lMDroruE/PJMrrbt6/9H1Ha/VH4DG+ovDYN2IZWBlme0k89k8DR3HTjdgQHf1Yg/+K
         XuxhvdZfv3S53nNqiYi5BBSIQkIKm5Wg+BMFXSc3FQrzXpjJ9GnZ3bQ1uWWcQhmbUgEN
         dG3hgFifj681oT0+fI8xI7/RstLq1/3kfHaRP0qx0iFeOn8vuQ5hwrVkCMTq+V5QSWin
         gWFyraERS4WG6HXPf1AMvE+uDfKnB06wcyJg8qKtZjR59GTd3mtk/8RtJpqMIvk5C4xq
         s9S0pU/KpsybZHicDNYAr+OvlSQWRNE7Z6FaWl44rt/suL+6/WXsHuBXafl3GBV4YfpS
         H5aA==
X-Gm-Message-State: APjAAAUw100/BKKdlq0GM+OnHSOMhit+iV7Rvay226aQKUiaj2IWARol
        l26FOd3PqI1b/u+8TZZxCySmHiYPacXUqZ0keB610w==
X-Google-Smtp-Source: APXvYqwoqW41d3VmiCOt4TEtIV+RTK8tXqLFvToPxG+OADUqlgABjHzrFp7YEKoFF9HjelUK0CM9C8WwBSr1RUiwkCQ=
X-Received: by 2002:a92:8309:: with SMTP id f9mr11285671ild.50.1580752634639;
 Mon, 03 Feb 2020 09:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20200130153613.20365-1-wzmuda@n7space.com> <20200130153613.20365-2-wzmuda@n7space.com>
 <20200131183637.GA26658@xps15> <CANLsYkxOLdMjFkjJSZ7Y1OLSCefb0fFiNVnaWyrgOUyDfWtweg@mail.gmail.com>
 <CDE42254-9963-4D2B-B762-032B8C947810@n7space.com> <a108d3ee-0959-d5f2-ecc7-a301929412ec@xilinx.com>
In-Reply-To: <a108d3ee-0959-d5f2-ecc7-a301929412ec@xilinx.com>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 3 Feb 2020 10:57:03 -0700
Message-ID: <CANLsYkyAU2zcW6fRPh8suArD+rTdpL6vT=NOAXZx-jyK-7XENQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: zynqmp: Add CoreSight components
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     =?UTF-8?Q?Wojciech_=C5=BBmuda?= <wzmuda@n7space.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>,
        "nava.manne@xilinx.com" <nava.manne@xilinx.com>,
        "antoine.tenart@bootlin.com" <antoine.tenart@bootlin.com>,
        "t-kristo@ti.com" <t-kristo@ti.com>,
        "rajan.vaja@xilinx.com" <rajan.vaja@xilinx.com>,
        Krzysztof Pilch <kpilch@n7space.com>,
        Michal Mosdorf <mmosdorf@n7space.com>,
        =?UTF-8?Q?Micha=C5=82_Kurowski?= <mkurowski@n7space.com>,
        Jolly Shah <jolly.shah@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 3 Feb 2020 at 00:12, Michal Simek <michal.simek@xilinx.com> wrote:
>
> On 31. 01. 20 20:37, Wojciech =C5=BBmuda wrote:
> > Hello Mathieu, thank you for quick review!
> > Please see my responses inline
> >
> > =EF=BB=BFOn 31/01/2020, 19:47, "Mathieu Poirier" <mathieu.poirier@linar=
o.org> wrote:
> >> On Fri, 31 Jan 2020 at 11:36, Mathieu Poirier
> >> <mathieu.poirier@linaro.org> wrote:
> >>
> >>> Hi Wojciech,
> >>>
> >>> On Thu, Jan 30, 2020 at 03:36:27PM +0000, Wojciech =C5=BBmuda wrote:
> >>>> From: Wojciech Zmuda <wzmuda@n7space.com>
> >>>>
> >>>> Add nodes for the following CoreSight components:
> >>>>  - ETMs for A53 cores
> >>>>  - debug components for A53 cores
> >>>>  - funnel gathering outputs from A53 ETMs and SoC-wide funnels
> >>>>  - the only replicator
> >>>>  - all TMCs: 4k ETF, 8k ETF and ETR
> >>>>  - TPIU
> >>>>
> >>>> Signed-off-by: Wojciech Zmuda <wzmuda@n7space.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi | 272 ++++++++++++=
+++++++++++
> >>>>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi           |   2 +
> >>>>  2 files changed, 274 insertions(+)
> >>>>  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi b/arch=
/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
> >>>> new file mode 100644
> >>>> index 000000000000..8b7579ad89cc
> >>>> --- /dev/null
> >>>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
> >>>> @@ -0,0 +1,272 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0+
> >>>> +
> >>>
> >>> Looking at other Xilinx DT files there is no space between the SPDX i=
dentifier
> >>> and the header of the file.
> >
> > Ok, I'll remove the extra space.
> >
> >>>
> >>>> +/*
> >>>> + * dtsi for Xilinx Ultrascale+ MPSoC CoreSight components
> >>>> + *
> >>>> + * Copyright (C) 2019-2020 N7 Space Sp. z o.o.
> >>>> + *
> >>>> + * Author: Wojciech Zmuda <wzmuda@n7space.com>
> >>>> + *
> >>>> + */
> >>>> +/ {
> >>>> +     etm0@fec40000 {
> >>>> +             compatible =3D "arm,coresight-etm4x", "arm,primecell";
> >>>> +             reg =3D <0 0xfec40000 0 0x1000>;
> >>>> +             cpu =3D <&cpu0>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             out-ports {
> >>>> +                     port {
> >>>> +                             etm0_out_port: endpoint {
> >>>> +                                     remote-endpoint =3D <&funnel1_=
in_port0>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     etm1@fed40000 {
> >>>> +             compatible =3D "arm,coresight-etm4x", "arm,primecell";
> >>>> +             reg =3D <0 0xfed40000 0 0x1000>;
> >>>> +             cpu =3D <&cpu1>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             out-ports {
> >>>> +                     port {
> >>>> +                             etm1_out_port: endpoint {
> >>>> +                                     remote-endpoint =3D <&funnel1_=
in_port1>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     etm2@fee40000 {
> >>>> +             compatible =3D "arm,coresight-etm4x", "arm,primecell";
> >>>> +             reg =3D <0 0xfee40000 0 0x1000>;
> >>>> +             cpu =3D <&cpu2>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             out-ports {
> >>>> +                     port {
> >>>> +                             etm2_out_port: endpoint {
> >>>> +                                     remote-endpoint =3D <&funnel1_=
in_port2>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     etm3@fef40000 {
> >>>> +             compatible =3D "arm,coresight-etm4x", "arm,primecell";
> >>>> +             reg =3D <0 0xfef40000 0 0x1000>;
> >>>> +             cpu =3D <&cpu3>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             out-ports {
> >>>> +                     port {
> >>>> +                             etm3_out_port: endpoint {
> >>>> +                                     remote-endpoint =3D <&funnel1_=
in_port3>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     debug0@fec10000 {
> >>>> +             compatible =3D "arm,coresight-cpu-debug", "arm,primece=
ll";
> >>>> +             reg =3D <0 0xfec10000 0 0x1000>;
> >>>> +             cpu =3D <&cpu0>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +     };
> >>>> +
> >>>> +     debug1@fed10000 {
> >>>> +             compatible =3D "arm,coresight-cpu-debug", "arm,primece=
ll";
> >>>> +             reg =3D <0 0xfed10000 0 0x1000>;
> >>>> +             cpu =3D <&cpu1>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +     };
> >>>> +
> >>>> +     debug2@fee10000 {
> >>>> +             compatible =3D "arm,coresight-cpu-debug", "arm,primece=
ll";
> >>>> +             reg =3D <0 0xfee10000 0 0x1000>;
> >>>> +             cpu =3D <&cpu2>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +     };
> >>>> +
> >>>> +     debug3@fee10000 {
> >>>> +             compatible =3D "arm,coresight-cpu-debug", "arm,primece=
ll";
> >>>> +             reg =3D <0 0xfef10000 0 0x1000>;
> >>>> +             cpu =3D <&cpu3>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +     };
> >>>> +
> >>>> +     funnel1@fe920000 {
> >>>> +             compatible =3D "arm,coresight-dynamic-funnel", "arm,pr=
imecell";
> >>>> +             reg =3D <0 0xfe920000 0 0x1000>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             in-ports {
> >>>> +                     #address-cells =3D <0x1>;
> >>>> +                     #size-cells =3D <0x0>;
> >>>> +                     port@0 {
> >>>> +                             reg =3D <0x0>;
> >>>> +                             funnel1_in_port0: endpoint {
> >>>> +                                     remote-endpoint =3D <&etm0_out=
_port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +                     port@1 {
> >>>> +                             reg =3D <0x1>;
> >>>> +                             funnel1_in_port1: endpoint {
> >>>> +                                     remote-endpoint =3D <&etm1_out=
_port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +                     port@2 {
> >>>> +                             reg =3D <0x2>;
> >>>> +                             funnel1_in_port2: endpoint {
> >>>> +                                     remote-endpoint =3D <&etm2_out=
_port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +                     port@3 {
> >>>> +                             reg =3D <0x3>;
> >>>> +                             funnel1_in_port3: endpoint {
> >>>> +                                     remote-endpoint =3D <&etm3_out=
_port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +             out-ports {
> >>>> +                     port {
> >>>> +                             funnel1_out_port0: endpoint {
> >>>> +                                     remote-endpoint =3D <&etf1_in_=
port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     funnel2@fe930000 {
> >>>> +             compatible =3D "arm,coresight-dynamic-funnel", "arm,pr=
imecell";
> >>>> +             reg =3D <0 0xfe930000 0 0x1000>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             in-ports {
> >>>> +                     #address-cells =3D <0x1>;
> >>>> +                     #size-cells =3D <0x0>;
> >>>> +                     port@2 {
> >>>> +                             reg =3D <0x2>;
> >>>> +                             funnel2_in_port2: endpoint {
> >>>> +                                     remote-endpoint =3D <&etf1_out=
_port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +                     // Funnel2 has another input port connected to
> >>>> +                     // funnel0's output. Funnel0 gathers Cortex-R5=
 ETMs.
> >>>
> >>> C++ style comments.
> >>>
> >
> > Ok, I'll go with:
> > /*
> >  * Funnel2 has another input port connected to
> >  * funnel0's output. Funnel0 gathers Cortex-R5 ETMs.
> >  */
> >
> >>>> +             };
> >>>> +             out-ports {
> >>>> +                     port {
> >>>> +                             funnel2_out_port0: endpoint {
> >>>> +                                     remote-endpoint =3D <&etf2_in_=
port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     etf1@fe940000 {
> >>>> +             compatible =3D "arm,coresight-tmc", "arm,primecell";
> >>>> +             reg =3D <0 0xfe940000 0 0x1000>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             in-ports {
> >>>> +                     port {
> >>>> +                             etf1_in_port: endpoint {
> >>>> +                                     remote-endpoint =3D <&funnel1_=
out_port0>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +             out-ports {
> >>>> +                     port {
> >>>> +                             etf1_out_port: endpoint {
> >>>> +                                     remote-endpoint =3D <&funnel2_=
in_port2>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     etf2@fe950000 {
> >>>> +             compatible =3D "arm,coresight-tmc", "arm,primecell";
> >>>> +             reg =3D <0 0xfe950000 0 0x1000>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             in-ports {
> >>>> +                     port {
> >>>> +                             etf2_in_port: endpoint {
> >>>> +                                     remote-endpoint =3D <&funnel2_=
out_port0>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +             out-ports {
> >>>> +                     port {
> >>>> +                             etf2_out_port: endpoint {
> >>>> +                                     remote-endpoint =3D
> >>>> +                                             <&replicator_in_port0>=
;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     replicator {
> >>>> +             compatible =3D "arm,coresight-static-replicator";
> >>>> +             in-ports {
> >>>> +                     port {
> >>>> +                             replicator_in_port0: endpoint {
> >>>> +                                     remote-endpoint =3D <&etf2_out=
_port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +             out-ports {
> >>>> +                     #address-cells =3D <0x1>;
> >>>> +                     #size-cells =3D <0x0>;
> >>>> +                     port@0 {
> >>>> +                             reg =3D <0x0>;
> >>>> +                             replicator_out_port0: endpoint {
> >>>> +                                     remote-endpoint =3D <&etr_in_p=
ort>;
> >>>> +                             };
> >>>> +                     };
> >>>> +                     port@1 {
> >>>> +                             reg =3D <0x1>;
> >>>> +                             replicator_out_port1: endpoint {
> >>>> +                                     remote-endpoint =3D <&tpiu_in_=
port>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     etr@fe970000 {
> >>>> +             compatible =3D "arm,coresight-tmc", "arm,primecell";
> >>>> +             reg =3D <0 0xfe970000 0 0x1000>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             in-ports {
> >>>> +                     port {
> >>>> +                             etr_in_port: endpoint {
> >>>> +                                     remote-endpoint =3D
> >>>> +                                             <&replicator_out_port0=
>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +
> >>>> +     tpiu@fe980000  {
> >>>> +             compatible =3D "arm,coresight-tpiu", "arm,primecell";
> >>>> +             reg =3D <0 0xfe980000 0 0x1000>;
> >>>> +             clocks =3D <&clk100>;
> >>>> +             clock-names =3D "apb_pclk";
> >>>> +             in-ports {
> >>>> +                     port {
> >>>> +                             tpiu_in_port: endpoint {
> >>>> +                                     remote-endpoint =3D
> >>>> +                                             <&replicator_out_port1=
>;
> >>>> +                             };
> >>>> +                     };
> >>>> +             };
> >>>> +     };
> >>>> +};
> >>>> +
> >>>> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boo=
t/dts/xilinx/zynqmp.dtsi
> >>>> index 3c731e73903a..ca0a6b9f4445 100644
> >>>> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> >>>> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> >>>> @@ -12,6 +12,8 @@
> >>>>   * the License, or (at your option) any later version.
> >>>>   */
> >>>  >
> >>>> +#include "zynqmp-coresight.dtsi"
> >>>> +
> >>>
> >>> Those bindings are correctly used.  If Michal doesn't mind the nit-pi=
cks I have
> >>> highlighted above then
> >>>
> >>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >>>
> >>> Otherwise feel free to add my tag to your next revision, which I advi=
se you to
> >>> send out once v5.6-rc1 comes out.
> >
> > Great, thanks. I'll keep an eye for v5.6-rc1.
> >
> >>
> >> I forgot...  How does power management work on this board?  Is the
> >> power domain where the CS blocks are powered up by the FW?  And what
> >> about state retention when processors go idle?  Should this be taken
> >> care of in the drivers or is the PMIC properly handling low retention
> >> states?  Failure to properly address both cases will likely hang the
> >> board (at boot time of when processors are idled).
> >
> > To be honest, I don't know. I use kernel with CPU idle permanently disa=
bled, as was
> > advised somewhere in CoreSight-related documents I found at the beginni=
ng of my
> > experiments. It might've been a presentation from Linaro Connect, eithe=
r yours or Leo's.
> > I didn't do any extra steps to power CS blocks on, so I guess they're e=
ither powered on
> > by default, or it's taken care of by either FSBL, U-boot or ATF. I use =
those three provided
> > by Xilinx. I didn't experiment with vanilla U-boot or ATF.
> >
> > Can you please suggest some experiments I in this matter? Would turning=
 off CPU idle
> > in kernel's config and tracing a migrating process be sufficient for su=
ch test?

This is a fairly new feature that Andrew finished in September [1].
It allows to save/restore the coresight tracers' configuration when
CPUs enter idle states, allowing coresight to be used when CPUIdle is
enabled.  This is necessary when the HW line driven by the PU bit of
configuration register TRCPDCR is not connected to a PMIC or the
PMIC's firmware is ignoring the signal.  It is very likely that either
one of those scenarios are enacted on this platform.

To deal with power management issues on the ETM blocks, re-enable
CPUIdle and add "arm,coresight-loses-context-with-cpu;" to each of the
ETM node specification in the DT (see bindings for details).  That
should take care of the ETMs only, which are usually in the CPU power
domain.  The rest of the coresight blocks are generally located in the
debug power domain, something I can't help with.  It is either enabled
at boot time by the boot loader or the kernel, or handled dynamically
at run time.  See the "power-domains" property in the Juno coresight
specification[2].

[1]. https://www.spinics.net/lists/devicetree/msg309139.html
[2]. https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/arm=
/juno-base.dtsi#L169

>
> Jolly: Can you please take a look how this block is powered and how
> power stuff should be handled?
>
> Thanks,
> Michal
>
