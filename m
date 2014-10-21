From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 6/8] phy: miphy28lp: Add SSC support for PCIE
Date: Tue, 21 Oct 2014 17:19:01 +0530
Message-ID: <5446482D.2060909@ti.com>
References: <1411721657-9924-1-git-send-email-gabriel.fernandez@linaro.org>	<1411721657-9924-7-git-send-email-gabriel.fernandez@linaro.org>	<15685.1412018368@turing-police.cc.vt.edu> <CAG374jBJcX00S4nSugWXaUxAQV3Bwp+OxY0c2GJ-+rskzDzpGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAG374jBJcX00S4nSugWXaUxAQV3Bwp+OxY0c2GJ-+rskzDzpGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>, Valdis.Kletnieks@vt.edu
Cc: Gabriel FERNANDEZ <gabriel.fernandez@st.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@stlinux.com" <kernel@stlinux.com>, Lee Jones <lee.jones@linaro.org>, Harsh Gupta <harsh.gupta@st.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 13 October 2014 01:46 PM, Gabriel Fernandez wrote:
> Hi Valdis,
> Thanks for your remark.
> 
> Concerning multiple writing in MIPHY_PLL_SBR_1, the writing of the
> first 0 it's to be sure there is no previous request.
> Then we take account new setting by writing 0x02.
> And then we make it 0 to make sure there is no other pending requests.
> 
> I added comments and macro to be more clear (see the code below).
> 
> 
> Hi Kishon,
> 
> Do you want a new patch set (v4),  or i wait other remarks from you ?

Apart from my comment below and for adding a common dt header file, rest of it
looks fine.
> 
> 
>     for (val = 0; val < 2; val++) {

What is "2" here? Lets add a macro for it.

Thanks
Kishon
