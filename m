From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v8 2/2] regulator: add QCOM RPMh regulator driver
Date: Thu, 28 Jun 2018 11:04:17 -0700
Message-ID: <87cc8c77-7b39-1746-4680-cb26d602e62e@codeaurora.org>
References: <cover.1529712888.git.collinsd@codeaurora.org>
 <35c4ea70cdf5caba560fb6f40e866ee8bc456d93.1529712888.git.collinsd@codeaurora.org>
 <CAD=FV=XVEEPgjBXxR+-46RgxLOq63Xvq-jtruoaCxccmMoKUuA@mail.gmail.com>
 <20180626120733.GD1779@sirena.org.uk>
 <CAD=FV=X1E8Cz=L93G-zJwhM0R=N3YuBBhkvCnLvWuxMU9KJkTw@mail.gmail.com>
 <20180626150203.GG1779@sirena.org.uk>
 <CAD=FV=WC_XWRk-6OELOFFWGnhRq1VeoiiveqXLSy+xqsVb22pA@mail.gmail.com>
 <20180627150126.GC5263@sirena.org.uk>
 <CAD=FV=WYcCVjAiMpzf4zyAByw5y-oDMnuabip1HXqa-mQFRt2w@mail.gmail.com>
 <20180628101813.GD14040@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180628101813.GD14040@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Doug Anderson <dianders@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello Mark,

On 06/28/2018 03:18 AM, Mark Brown wrote:
> On Wed, Jun 27, 2018 at 09:28:03AM -0700, Doug Anderson wrote:
> 
>> OK, great.  I guess I'm confused about the "|| COMPILE_TEST" causing
>> problems then?  I was worried that anyone trying to do "COMPILE_TEST"
>> on your tree (or linuxnext if RPMh isn't there) would get failures due
>> to the lack of header files.  I guess if it's a problem you could just
>> gut the "|| COMPILE_TEST" and it could be added back in later?
> 
> Ugh, yes - that'll break things.  In that case I can't apply this
> without a signed tag from Andy's tree with the dependency stuff in.
> 

Do you have any remaining concerns with the qcom-rpmh-regulator binding
and driver patches that would keep you from applying them (other than the
dependency patches being applied first)?

Thanks,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
