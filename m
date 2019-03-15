Return-Path: <SRS0=1Muv=RS=mediatek.com=stanley.chu@kernel.org>
Message-ID: <1552622667.30977.70.camel@mtkswgap22>
Subject: Re: [PATCH v3 5/7] dt-bindings: scsi: ufs: Add document for
 ufs-mediatek
From: Stanley Chu <stanley.chu@mediatek.com>
Date: Fri, 15 Mar 2019 12:04:27 +0800
In-Reply-To: <CAL_Jsq+O5O6JL2tafojn5xEC95dw7dMNzrcoDm7N4No6HfonxQ@mail.gmail.com>
References: <1551252192-535-1-git-send-email-stanley.chu@mediatek.com>
	 <1551252192-535-7-git-send-email-stanley.chu@mediatek.com>
	 <20190312133113.GA8956@bogus> <1552444909.30977.39.camel@mtkswgap22>
	 <CAL_JsqJ8EkM5EsQCCsyY0M1SuDar2qQi6QjA=91+Svv79-8rAg@mail.gmail.com>
	 <7f801bb4-97ea-1fe2-045c-507fd2656469@free.fr>
	 <CAL_Jsq+O5O6JL2tafojn5xEC95dw7dMNzrcoDm7N4No6HfonxQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
To: Rob Herring <robh+dt@kernel.org>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, Avri Altman <avri.altman@wdc.com>, Alim Akhtar <alim.akhtar@samsung.com>, "Bjorn Andersson  <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>, DT" <devicetree@vger.kernel.org>, SCSI <linux-scsi@vger.kernel.org>, kuohong.wang@mediatek.com, peter.wang@mediatek.com, chun-hung.wu@mediatek.com, stanley.chu@mediatek.com
List-ID: <devicetree@vger.kernel.org>

Hi Rob and all,

On Fri, 2019-03-15 at 00:44 +0800, Rob Herring wrote:
> On Thu, Mar 14, 2019 at 3:46 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
> >
> > On 13/03/2019 20:48, Rob Herring wrote:
> >
> > Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt mentions:
> > - <name>-fixed-regulator : boolean property specifying that <name>-supply is a fixed regulator.
> >
> > > There are no users of that property in tree and doesn't look like
> > > adding it was ever reviewed. We have standard ways to handle this and
> > > don't need a custom property.
> >
> > FWIW, it seems to come from downstream:
> 
> The question would be is downstream compliant with the upstream
> binding. If so, then we shouldn't really break things as that's just
> out of tree which is fine.
> 
> Or we just need a better explanation of why it is needed. MMC has some
> properties related to card voltages for example. Maybe the need is
> similar.
> 

For short-term, could this patch series be merged without "vcc" related
property defined in dt-bindings (like PATCH V5 does)? Or using
"vcc-supply" along with "vcc-fixed-regulator" with a detailed
explanation can be accepted?

ufs-mediatek can work fine without "vcc" related property but with a
limitation that driver cannot control "vcc" power which is enabled
by-default on MediaTek chipsets.

For long-term, it seems to me that "<name>-fixed-regulator" can be
removed from both dt-bindings and UFS driver without impact, even for
downstream usage found by Marc.

If "<name>-fixed-regulator" property is defined in device tree, such
regulator will skip "current limit" assignment from
"<name>-max-microamp" property, and voltage range assignment from
"vcc-supply-lp8" property (for vcc, vccq, and vccq2 only). If driver can
handle above both cases correctly, "<name>-fixed-regulator" can be
removed.

In MediaTek chipsets, "vcc-supply" can ignore above two properties.
However if "vcc-fixed-regulator" is not added, driver will get fail
during device tree probing due to undefined "vcc-max-microamp".

If our target is removing "<name>-fixed-regulator", we could try to fix
and resolve above all. And if we do not merge "vcc" related property
this time, after that we can add "vcc-supply" back to dt-bindings to
provide vcc control capability in ufs-mediatek driver.

Would you please provide any suggestions?

> Rob
