From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH 0/3] Add initial DT support for Qualcomm SPMI PMIC
 devices
Date: Tue, 10 Feb 2015 15:17:00 +0800
Message-ID: <1423552620.9293.5.camel@mm-sol.com>
References: <1422965880-11047-1-git-send-email-iivanov@mm-sol.com>
	 <CAJAp7OjL6+QLs45LM8pEsZ4tHQ2jgM9z2tg8pb6A=xAxBO7pGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJAp7OjL6+QLs45LM8pEsZ4tHQ2jgM9z2tg8pb6A=xAxBO7pGA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>, Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Tue, 2015-02-03 at 12:38 -0800, Bjorn Andersson wrote:
> On Tue, Feb 3, 2015 at 4:17 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrote:
> > Following set of patches add initial DT support for PMIC devices
> > found on recent Quqalcomm chipsets. Details for SPMI bus and PMIC arbiter
> > could be found here [1].
> > 
> > Regards,
> > Ivan
> > 
> > [1] http://lwn.net/Articles/564637/
> > 
> > Ivan T. Ivanov (3):
> >   ARM: dts: qcom: Add SPMI PMIC Arbiter nodes for APQ8084 and MSM8974
> >   ARM: dts: qcom: Add 8x74 chipset SPMI PMIC's nodes
> >   ARM: dts: qcom: Add APQ8084 chipset SPMI PMIC's nodes
> > 
> 
> Looks good.
> 
> Reviewed-by: Bjorn Andersson andersson@sonymobile.com>
> 

Thank you.

Any other comments? Kumar?

Regards,
Ivan
