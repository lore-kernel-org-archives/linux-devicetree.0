From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH v2] clk: qcom: Add support for IPQ8064's global clock
 controller (GCC)
Date: Mon, 07 Apr 2014 18:22:30 +0300
Message-ID: <1396884150.28420.38.camel@iivanov-dev>
References: <1396642749-12979-1-git-send-email-galak@codeaurora.org>
	 <1396882918.28420.37.camel@iivanov-dev>
	 <AF6AA9C9-6A47-4394-91FD-F7F0C264C530@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <AF6AA9C9-6A47-4394-91FD-F7F0C264C530@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-04-07 at 10:10 -0500, Kumar Gala wrote:
> On Apr 7, 2014, at 10:01 AM, Ivan T. Ivanov <iivanov@mm-sol.com> wrot=
e:
>=20
> > Hi Kumar,

<snip>
> >=20
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> >> @@ -0,0 +1,1957 @@
> >> +/*

<snip>

> >> +#include <dt-bindings/clock/qcom,gcc-ipq806x.h>
> >> +#include <dt-bindings/reset/qcom,gcc-ipq806x.h>
> >> +
> >> +#include "common.h"
> >=20
> > Do I miss something or this file is not available?
>=20
> Its based on Stephen=E2=80=99s refactoring patch:
>=20
> https://patchwork.kernel.org/patch/3876761/
>=20

Thanks,=20
Ivan

> - k
>=20
