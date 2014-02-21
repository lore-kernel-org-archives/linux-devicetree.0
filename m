From: "fugang.duan@freescale.com" <fugang.duan@freescale.com>
Subject: RE: [PATCH v5 1/3] ARM: dts: vf610-twr: Add ADC support
Date: Fri, 21 Feb 2014 06:06:28 +0000
Message-ID: <83f633db31fb4591a9e7b0ffddc179b0@BLUPR03MB373.namprd03.prod.outlook.com>
References: <1390714773-23066-1-git-send-email-B38611@freescale.com>
 <1390714773-23066-2-git-send-email-B38611@freescale.com>
 <20140216074850.GA2946@S2101-09.ap.freescale.net>
 <20140219050716.GA3010@S2101-09.ap.freescale.net>
 <da1f0ce0784e434d8a384aa34e271a18@BLUPR03MB373.namprd03.prod.outlook.com>
 <20140221053834.GT3010@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140221053834.GT3010@S2101-09.ap.freescale.net>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lars@metafoo.de" <lars@metafoo.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "sachin.kamat@linaro.org" <sachin.kamat@linaro.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, "jic23@kernel.org" <jic23@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>
Data: Friday, February 21, 2014 1:39 PM + 0800

>To: Duan Fugang-B38611
>Cc: jic23@kernel.org; sachin.kamat@linaro.org; pmeerw@pmeerw.net;
>lars@metafoo.de; mark.rutland@arm.com; linux-iio@vger.kernel.org; Rob Herring;
>Grant Likely; Pawel Moll; Ian Campbell; Kumar Gala; devicetree@vger.kernel.org;
>linux-arm-kernel@lists.infradead.org
>Subject: Re: [PATCH v5 1/3] ARM: dts: vf610-twr: Add ADC support
>
>On Fri, Feb 21, 2014 at 05:17:20AM +0000, fugang.duan@freescale.com wrote:
>> So, you apply the original patch ? Do I need to resend it again ?
>
>You still need to rebase it against my for-next branch to resolve my comment on
>pinctrl setting.
>
>Shawn

I send the patch to you after moving pinctrl setting to board dts.

Thanks,
Andy
