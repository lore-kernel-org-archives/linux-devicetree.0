Return-Path: <SRS0=Q+cw=RR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp3-g21.free.fr ([212.27.42.3]:15522 "EHLO smtp3-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbfCNIq1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 Mar 2019 04:46:27 -0400
Subject: Re: [PATCH v3 5/7] dt-bindings: scsi: ufs: Add document for
 ufs-mediatek
References: <1551252192-535-1-git-send-email-stanley.chu@mediatek.com>
 <1551252192-535-7-git-send-email-stanley.chu@mediatek.com>
 <20190312133113.GA8956@bogus> <1552444909.30977.39.camel@mtkswgap22>
 <CAL_JsqJ8EkM5EsQCCsyY0M1SuDar2qQi6QjA=91+Svv79-8rAg@mail.gmail.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <7f801bb4-97ea-1fe2-045c-507fd2656469@free.fr>
Date: Thu, 14 Mar 2019 09:46:09 +0100
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ8EkM5EsQCCsyY0M1SuDar2qQi6QjA=91+Svv79-8rAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Avri Altman <avri.altman@wdc.com>, Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>, DT <devicetree@vger.kernel.org>, SCSI <linux-scsi@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 13/03/2019 20:48, Rob Herring wrote:

Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt mentions:
- <name>-fixed-regulator : boolean property specifying that <name>-supply is a fixed regulator.

> There are no users of that property in tree and doesn't look like
> adding it was ever reviewed. We have standard ways to handle this and
> don't need a custom property.

FWIW, it seems to come from downstream:

https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/?h=LE.UM.1.3.r3.25

$ git grep fixed-regulator vendor -- arch/arm/boot/dts/qcom/
vendor:arch/arm/boot/dts/qcom/msm8996.dtsi:             vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-cdp.dtsi: vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-interposer-sdm660-cdp.dtsi:       vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-interposer-sdm660-mtp.dtsi:       vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-mtp.dtsi: vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-qrd-skuk.dtsi:    vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-qrd-vr1.dtsi:     vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-qrd.dtsi: vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-rumi.dtsi:        vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-sim.dtsi: vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-svr20.dtsi:       vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/msm8998-v2.1-interposer-sdm660-qrd.dtsi:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm630-cdp.dtsi:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm630-mtp.dtsi:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm630-qrd.dtsi:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm630-rumi.dts:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm660-cdp.dtsi:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm660-mtp.dtsi:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm660-pm660a-rumi.dts:   vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm660-pm660a-sim.dts:    vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm660-qrd.dtsi:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm660-rumi.dts:  vdd-hba-fixed-regulator;
vendor:arch/arm/boot/dts/qcom/sdm660-sim.dts:   vdd-hba-fixed-regulator;
