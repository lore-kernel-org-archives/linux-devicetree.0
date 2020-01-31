Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C476C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 18:47:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F6E02082E
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 18:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kYyfR75N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgAaSri (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 13:47:38 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:32903 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgAaSri (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 13:47:38 -0500
Received: by mail-io1-f68.google.com with SMTP id z8so9305686ioh.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 10:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z12KSSqL1KJdwamizgR+cu61k/BO8uFsaMiUp+uaC8A=;
        b=kYyfR75NdILyYgs2nkyuzC6KZsTElt/XDlTnGE4fbHsDlovYdZaD2KVjbd1lBeNYhm
         KKcNS8+XUG44aEicsvaw5sKvdNj4Hh5HHhkMOlP4foUNEFO1Zve/+NlPENHfZ4xhjDGh
         Uhr5WHC+JuTQP5FJKSpI4/9LTqE0TKEzGp+1eEyWOVsbAdqZf64FluUTuBHX3IAYK1di
         PhvD5UDxUZPSD0lv9IaqctGC631HG2zmwgOh3mX0OpTDzeXTyjHzCI6nE/wVDARSv5I1
         VQLDRyiq5zl0r2axW989zShLmJsl8115LIho1YLhV6K5UirbObj/mdSRvFFWYW3Ld4qb
         DKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z12KSSqL1KJdwamizgR+cu61k/BO8uFsaMiUp+uaC8A=;
        b=f2iOG6f7abq/FFrV8eBUA5/gSKAYc0PW9fI8I9QEnRMRdCF4DRkzR2oNiSXlCDUFYF
         8gXJ2m0dF9QJsTcZBzbL/8aZe5OQ4pavuB81HiUjp+XI+8wbh3YZY8Q4AVrKxRgLKsJo
         32QNiV6d8DTb75MKFIcWx15Jr5jhQLwlnpOeH0/LHBocvgvlm8d4c8bKQjSrK+H2CtRu
         2SULo3ddM5ptfJYycD7VUBFrR3CFf5Euqnh6kv9iTn4lludyDZO29EHt+70pFLKfD20V
         xq0601d5wo8cHAbVSSRnI2suWvkmENhH9WzOxA/y6tf9eGclr4TMzPIs1bbbjyaj1qG0
         BfwQ==
X-Gm-Message-State: APjAAAXniHvdBXjBtM8hI85aCOaexUH8P0HJBoaG/TsJ1e++NzZ3RqAr
        zsuCDQJRJfGRdtr8aMZaDZyolWaHqDRpwzWLJ4MKx+GE
X-Google-Smtp-Source: APXvYqxKOoodaO6dgf35H01tOU3+874v4UOyVeL1PslmWERDBoK0VTfYHbDxI7bzxAV934vQ5b0vqrdXCFlmrDaUFQo=
X-Received: by 2002:a05:6638:44a:: with SMTP id r10mr9359273jap.36.1580496457604;
 Fri, 31 Jan 2020 10:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20200130153613.20365-1-wzmuda@n7space.com> <20200130153613.20365-2-wzmuda@n7space.com>
 <20200131183637.GA26658@xps15>
In-Reply-To: <20200131183637.GA26658@xps15>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Fri, 31 Jan 2020 11:47:26 -0700
Message-ID: <CANLsYkxOLdMjFkjJSZ7Y1OLSCefb0fFiNVnaWyrgOUyDfWtweg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: zynqmp: Add CoreSight components
To:     =?UTF-8?Q?Wojciech_=C5=BBmuda?= <wzmuda@n7space.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "m.tretter@pengutronix.de" <m.tretter@pengutronix.de>,
        "nava.manne@xilinx.com" <nava.manne@xilinx.com>,
        "antoine.tenart@bootlin.com" <antoine.tenart@bootlin.com>,
        "t-kristo@ti.com" <t-kristo@ti.com>,
        "rajan.vaja@xilinx.com" <rajan.vaja@xilinx.com>,
        Krzysztof Pilch <kpilch@n7space.com>,
        Michal Mosdorf <mmosdorf@n7space.com>,
        =?UTF-8?Q?Micha=C5=82_Kurowski?= <mkurowski@n7space.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 31 Jan 2020 at 11:36, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hi Wojciech,
>
> On Thu, Jan 30, 2020 at 03:36:27PM +0000, Wojciech =C5=BBmuda wrote:
> > From: Wojciech Zmuda <wzmuda@n7space.com>
> >
> > Add nodes for the following CoreSight components:
> >  - ETMs for A53 cores
> >  - debug components for A53 cores
> >  - funnel gathering outputs from A53 ETMs and SoC-wide funnels
> >  - the only replicator
> >  - all TMCs: 4k ETF, 8k ETF and ETR
> >  - TPIU
> >
> > Signed-off-by: Wojciech Zmuda <wzmuda@n7space.com>
> > ---
> >  arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi | 272 +++++++++++++++=
++++++++
> >  arch/arm64/boot/dts/xilinx/zynqmp.dtsi           |   2 +
> >  2 files changed, 274 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi b/arch/ar=
m64/boot/dts/xilinx/zynqmp-coresight.dtsi
> > new file mode 100644
> > index 000000000000..8b7579ad89cc
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/xilinx/zynqmp-coresight.dtsi
> > @@ -0,0 +1,272 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
>
> Looking at other Xilinx DT files there is no space between the SPDX ident=
ifier
> and the header of the file.
>
> > +/*
> > + * dtsi for Xilinx Ultrascale+ MPSoC CoreSight components
> > + *
> > + * Copyright (C) 2019-2020 N7 Space Sp. z o.o.
> > + *
> > + * Author: Wojciech Zmuda <wzmuda@n7space.com>
> > + *
> > + */
> > +/ {
> > +     etm0@fec40000 {
> > +             compatible =3D "arm,coresight-etm4x", "arm,primecell";
> > +             reg =3D <0 0xfec40000 0 0x1000>;
> > +             cpu =3D <&cpu0>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             out-ports {
> > +                     port {
> > +                             etm0_out_port: endpoint {
> > +                                     remote-endpoint =3D <&funnel1_in_=
port0>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     etm1@fed40000 {
> > +             compatible =3D "arm,coresight-etm4x", "arm,primecell";
> > +             reg =3D <0 0xfed40000 0 0x1000>;
> > +             cpu =3D <&cpu1>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             out-ports {
> > +                     port {
> > +                             etm1_out_port: endpoint {
> > +                                     remote-endpoint =3D <&funnel1_in_=
port1>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     etm2@fee40000 {
> > +             compatible =3D "arm,coresight-etm4x", "arm,primecell";
> > +             reg =3D <0 0xfee40000 0 0x1000>;
> > +             cpu =3D <&cpu2>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             out-ports {
> > +                     port {
> > +                             etm2_out_port: endpoint {
> > +                                     remote-endpoint =3D <&funnel1_in_=
port2>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     etm3@fef40000 {
> > +             compatible =3D "arm,coresight-etm4x", "arm,primecell";
> > +             reg =3D <0 0xfef40000 0 0x1000>;
> > +             cpu =3D <&cpu3>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             out-ports {
> > +                     port {
> > +                             etm3_out_port: endpoint {
> > +                                     remote-endpoint =3D <&funnel1_in_=
port3>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     debug0@fec10000 {
> > +             compatible =3D "arm,coresight-cpu-debug", "arm,primecell"=
;
> > +             reg =3D <0 0xfec10000 0 0x1000>;
> > +             cpu =3D <&cpu0>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +     };
> > +
> > +     debug1@fed10000 {
> > +             compatible =3D "arm,coresight-cpu-debug", "arm,primecell"=
;
> > +             reg =3D <0 0xfed10000 0 0x1000>;
> > +             cpu =3D <&cpu1>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +     };
> > +
> > +     debug2@fee10000 {
> > +             compatible =3D "arm,coresight-cpu-debug", "arm,primecell"=
;
> > +             reg =3D <0 0xfee10000 0 0x1000>;
> > +             cpu =3D <&cpu2>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +     };
> > +
> > +     debug3@fee10000 {
> > +             compatible =3D "arm,coresight-cpu-debug", "arm,primecell"=
;
> > +             reg =3D <0 0xfef10000 0 0x1000>;
> > +             cpu =3D <&cpu3>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +     };
> > +
> > +     funnel1@fe920000 {
> > +             compatible =3D "arm,coresight-dynamic-funnel", "arm,prime=
cell";
> > +             reg =3D <0 0xfe920000 0 0x1000>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             in-ports {
> > +                     #address-cells =3D <0x1>;
> > +                     #size-cells =3D <0x0>;
> > +                     port@0 {
> > +                             reg =3D <0x0>;
> > +                             funnel1_in_port0: endpoint {
> > +                                     remote-endpoint =3D <&etm0_out_po=
rt>;
> > +                             };
> > +                     };
> > +                     port@1 {
> > +                             reg =3D <0x1>;
> > +                             funnel1_in_port1: endpoint {
> > +                                     remote-endpoint =3D <&etm1_out_po=
rt>;
> > +                             };
> > +                     };
> > +                     port@2 {
> > +                             reg =3D <0x2>;
> > +                             funnel1_in_port2: endpoint {
> > +                                     remote-endpoint =3D <&etm2_out_po=
rt>;
> > +                             };
> > +                     };
> > +                     port@3 {
> > +                             reg =3D <0x3>;
> > +                             funnel1_in_port3: endpoint {
> > +                                     remote-endpoint =3D <&etm3_out_po=
rt>;
> > +                             };
> > +                     };
> > +             };
> > +             out-ports {
> > +                     port {
> > +                             funnel1_out_port0: endpoint {
> > +                                     remote-endpoint =3D <&etf1_in_por=
t>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     funnel2@fe930000 {
> > +             compatible =3D "arm,coresight-dynamic-funnel", "arm,prime=
cell";
> > +             reg =3D <0 0xfe930000 0 0x1000>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             in-ports {
> > +                     #address-cells =3D <0x1>;
> > +                     #size-cells =3D <0x0>;
> > +                     port@2 {
> > +                             reg =3D <0x2>;
> > +                             funnel2_in_port2: endpoint {
> > +                                     remote-endpoint =3D <&etf1_out_po=
rt>;
> > +                             };
> > +                     };
> > +                     // Funnel2 has another input port connected to
> > +                     // funnel0's output. Funnel0 gathers Cortex-R5 ET=
Ms.
>
> C++ style comments.
>
> > +             };
> > +             out-ports {
> > +                     port {
> > +                             funnel2_out_port0: endpoint {
> > +                                     remote-endpoint =3D <&etf2_in_por=
t>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     etf1@fe940000 {
> > +             compatible =3D "arm,coresight-tmc", "arm,primecell";
> > +             reg =3D <0 0xfe940000 0 0x1000>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             in-ports {
> > +                     port {
> > +                             etf1_in_port: endpoint {
> > +                                     remote-endpoint =3D <&funnel1_out=
_port0>;
> > +                             };
> > +                     };
> > +             };
> > +             out-ports {
> > +                     port {
> > +                             etf1_out_port: endpoint {
> > +                                     remote-endpoint =3D <&funnel2_in_=
port2>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     etf2@fe950000 {
> > +             compatible =3D "arm,coresight-tmc", "arm,primecell";
> > +             reg =3D <0 0xfe950000 0 0x1000>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             in-ports {
> > +                     port {
> > +                             etf2_in_port: endpoint {
> > +                                     remote-endpoint =3D <&funnel2_out=
_port0>;
> > +                             };
> > +                     };
> > +             };
> > +             out-ports {
> > +                     port {
> > +                             etf2_out_port: endpoint {
> > +                                     remote-endpoint =3D
> > +                                             <&replicator_in_port0>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     replicator {
> > +             compatible =3D "arm,coresight-static-replicator";
> > +             in-ports {
> > +                     port {
> > +                             replicator_in_port0: endpoint {
> > +                                     remote-endpoint =3D <&etf2_out_po=
rt>;
> > +                             };
> > +                     };
> > +             };
> > +             out-ports {
> > +                     #address-cells =3D <0x1>;
> > +                     #size-cells =3D <0x0>;
> > +                     port@0 {
> > +                             reg =3D <0x0>;
> > +                             replicator_out_port0: endpoint {
> > +                                     remote-endpoint =3D <&etr_in_port=
>;
> > +                             };
> > +                     };
> > +                     port@1 {
> > +                             reg =3D <0x1>;
> > +                             replicator_out_port1: endpoint {
> > +                                     remote-endpoint =3D <&tpiu_in_por=
t>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     etr@fe970000 {
> > +             compatible =3D "arm,coresight-tmc", "arm,primecell";
> > +             reg =3D <0 0xfe970000 0 0x1000>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             in-ports {
> > +                     port {
> > +                             etr_in_port: endpoint {
> > +                                     remote-endpoint =3D
> > +                                             <&replicator_out_port0>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> > +     tpiu@fe980000  {
> > +             compatible =3D "arm,coresight-tpiu", "arm,primecell";
> > +             reg =3D <0 0xfe980000 0 0x1000>;
> > +             clocks =3D <&clk100>;
> > +             clock-names =3D "apb_pclk";
> > +             in-ports {
> > +                     port {
> > +                             tpiu_in_port: endpoint {
> > +                                     remote-endpoint =3D
> > +                                             <&replicator_out_port1>;
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/d=
ts/xilinx/zynqmp.dtsi
> > index 3c731e73903a..ca0a6b9f4445 100644
> > --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> > @@ -12,6 +12,8 @@
> >   * the License, or (at your option) any later version.
> >   */
> >
> > +#include "zynqmp-coresight.dtsi"
> > +
>
> Those bindings are correctly used.  If Michal doesn't mind the nit-picks =
I have
> highlighted above then
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> Otherwise feel free to add my tag to your next revision, which I advise y=
ou to
> send out once v5.6-rc1 comes out.

I forgot...  How does power management work on this board?  Is the
power domain where the CS blocks are powered up by the FW?  And what
about state retention when processors go idle?  Should this be taken
care of in the drivers or is the PMIC properly handling low retention
states?  Failure to properly address both cases will likely hang the
board (at boot time of when processors are idled).

>
> Thanks,
> Mathieu
>
> >  / {
> >       compatible =3D "xlnx,zynqmp";
> >       #address-cells =3D <2>;
> > --
> > 2.11.0
> >
