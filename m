From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/3] mfd: syscon: Add optional clock support
Date: Wed, 20 Mar 2019 13:05:34 +0000
Message-ID: <20190320130534.GP4731@dell>
References: <1544604495-4082-1-git-send-email-fabrice.gasnier@st.com>
 <1544604495-4082-3-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544604495-4082-3-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, arnd@arndb.de, mark.rutland@arm.com, gabriel.fernandez@st.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 12 Dec 2018, Fabrice Gasnier wrote:

> Some system control registers need to be clocked, so the registers can
> be accessed. Add an optional clock and attach it to regmap.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  drivers/mfd/syscon.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
