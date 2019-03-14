MIME-Version: 1.0
Date: Thu, 14 Mar 2019 11:44:47 -0500
References: <1551252192-535-1-git-send-email-stanley.chu@mediatek.com>
	<1551252192-535-7-git-send-email-stanley.chu@mediatek.com>
	<20190312133113.GA8956@bogus>
	<1552444909.30977.39.camel@mtkswgap22>
	<CAL_JsqJ8EkM5EsQCCsyY0M1SuDar2qQi6QjA=91+Svv79-8rAg@mail.gmail.com>
	<7f801bb4-97ea-1fe2-045c-507fd2656469@free.fr>
In-Reply-To: <7f801bb4-97ea-1fe2-045c-507fd2656469@free.fr>
Message-ID: <CAL_Jsq+O5O6JL2tafojn5xEC95dw7dMNzrcoDm7N4No6HfonxQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: scsi: ufs: Add document for ufs-mediatek
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Avri Altman <avri.altman@wdc.com>, Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jeffrey Hugo <jhugo@codeaurora.org>, DT <devicetree@vger.kernel.org>, SCSI <linux-scsi@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 14, 2019 at 3:46 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> On 13/03/2019 20:48, Rob Herring wrote:
>
> Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt mentions:
> - <name>-fixed-regulator : boolean property specifying that <name>-supply is a fixed regulator.
>
> > There are no users of that property in tree and doesn't look like
> > adding it was ever reviewed. We have standard ways to handle this and
> > don't need a custom property.
>
> FWIW, it seems to come from downstream:

The question would be is downstream compliant with the upstream
binding. If so, then we shouldn't really break things as that's just
out of tree which is fine.

Or we just need a better explanation of why it is needed. MMC has some
properties related to card voltages for example. Maybe the need is
similar.

Rob
