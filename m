From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: Add msm8916 CoreSight components
Date: Tue, 19 May 2015 10:03:04 +0300
Message-ID: <1432018984.29174.2.camel@linaro.org>
References: <1431333119-13626-1-git-send-email-ivan.ivanov@linaro.org>
	 <CANLsYkyKrtyMicsNs2CDd4=GfrQJOPJkAqSUiTB=5hRs3+d=tQ@mail.gmail.com>
	 <7F8B0480-06A8-4381-90C8-3F2A35F14FCD@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <7F8B0480-06A8-4381-90C8-3F2A35F14FCD@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Pratik Patel <pratikp@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Mon, 2015-05-18 at 13:52 -0500, Kumar Gala wrote:
> >=20
> > On May 11, 2015, at 2:21 PM, Mathieu Poirier poirier@linaro.org> wr=
ote:
> >=20
> > On 11 May 2015 at 02:31, Ivan T. Ivanov ivanov@linaro.org> wrote:
> > > Add initial set of CoreSight components found on Qualcomm's 8x16 =
chipset.
> >=20

> >=20
> > Kumar, I'm happy with this DT specification for Coresight.  Since I=
'm
> > taking the driver it would likely make more sense for this to go
> > through my tree.  Could you please have a look and give me your ack=
?
>=20
> It looks ok, however I don=E2=80=99t see us including this file anywh=
ere, so that=E2=80=99s my only concern.
>=20

True. The reason is that 'rpmcc' driver is still in testing phase
and it is not upstreamed. Once it is ready, I will include this file
where is appropriate.

Regards,
Ivan
