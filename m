From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [RFC PATCH 0/2] mfd: syscon: declare holes in syscon register
 maps
Date: Wed, 8 Oct 2014 13:12:37 +0200
Message-ID: <54351C25.70604@st.com>
References: <54244655.1090801@st.com> <1412688148-20835-1-git-send-email-seraphin.bonnaffe@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412688148-20835-1-git-send-email-seraphin.bonnaffe@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Seraphin Bonnaffe <seraphin.bonnaffe@st.com>, b29396@freescale.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org
Cc: sameo@linux.intel.com, grant.likely@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

Hi Seraphin,

On 10/07/2014 03:22 PM, Seraphin Bonnaffe wrote:
> In reply to mail: Holes management in syscon driver.
> 
> Hi Dong, Maxime, Lee, all,
> 
> Regmap also offers .rd_table and .wr_table structures that can be used to
> specify valid ranges within agiven regmap configuration.
> 
> This patch uses these structures to declare holes in a syscon instance.
> It takes the description from DT, and fills in the structures accordingly.
> 
> Can I have your opinion on this implementation ?

As discussed face to face, it looks fine to me.

But we would like green light in the new "holes" property introduced.

Thanks,
Maxime

> 
> Thanks and Regards,
> Seraphin
> 
> Seraphin Bonnaffe (2):
>    mfd: syscon: Document new DT binding "holes"
>    mfd: syscon: specify rd_table and wr_table from DT
> 
>   Documentation/devicetree/bindings/mfd/syscon.txt |  5 ++++
>   drivers/mfd/syscon.c                             | 35 ++++++++++++++++++++++++
>   2 files changed, 40 insertions(+)
> 
