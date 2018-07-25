From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v7 1/4] phy: Update PHY power control sequence
Date: Wed, 25 Jul 2018 13:26:18 -0700
Message-ID: <CAE=gft5m_upt4hhPf3ZbCm99usoaW_OXibxM2XzFEgvwLmjnKQ@mail.gmail.com>
References: <20180619083647.10116-1-cang@codeaurora.org> <20180619083647.10116-2-cang@codeaurora.org>
 <CAFp+6iHxu2GYAn8ftDuHfE1Hj=aQvd6Rum9zjEe-G1WHsAkZuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFp+6iHxu2GYAn8ftDuHfE1Hj=aQvd6Rum9zjEe-G1WHsAkZuw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vivek.gautam@codeaurora.org
Cc: cang@codeaurora.org, subhashj@codeaurora.org, asutoshd@codeaurora.org, Manu Gautam <mgautam@codeaurora.org>, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 2, 2018 at 10:00 AM Vivek Gautam
<vivek.gautam@codeaurora.org> wrote:
>
> On Tue, Jun 19, 2018 at 2:06 PM, Can Guo <cang@codeaurora.org> wrote:
> > All PHYs should be powered on before register configuration starts. And
> > only PCIe PHYs need an extra power control before deasserts reset state.
> >
> > Signed-off-by: Can Guo <cang@codeaurora.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp.c | 19 ++++++++++++-------
> >  1 file changed, 12 insertions(+), 7 deletions(-)
> >

Reviewed-by: Evan Green <evgreen@chromium.org>
