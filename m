From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 2/2] regulator: add QCOM RPMh regulator driver
Date: Tue, 26 Jun 2018 08:00:29 -0700
Message-ID: <CAD=FV=X1E8Cz=L93G-zJwhM0R=N3YuBBhkvCnLvWuxMU9KJkTw@mail.gmail.com>
References: <cover.1529712888.git.collinsd@codeaurora.org> <35c4ea70cdf5caba560fb6f40e866ee8bc456d93.1529712888.git.collinsd@codeaurora.org>
 <CAD=FV=XVEEPgjBXxR+-46RgxLOq63Xvq-jtruoaCxccmMoKUuA@mail.gmail.com> <20180626120733.GD1779@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180626120733.GD1779@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Jun 26, 2018 at 5:07 AM, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Jun 25, 2018 at 11:50:52AM -0700, Doug Anderson wrote:
>
>> ...to this patch.  Speaking of which it might be getting very close to
>> time for this series to land along with David's other series, AKA:
>
>> * [1/2] regulator: of: add property for allowed modes specification
>>   https://patchwork.kernel.org/patch/10395731/
>
>> * [2/2] regulator: of: add support for allowed modes configuration
>>   https://patchwork.kernel.org/patch/10395725/
>
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.

Sorry, wasn't suggesting making any changes to those two patches, just
was noting the dependency.  ...but, as you said, the two dependent
patches have already landed and I just didn't notice.  :(  Sorry for
the noise.

-Doug
