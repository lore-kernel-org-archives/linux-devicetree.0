From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2 6/9] dmaengine: st_fdma: Add fdma suspend and resume
 callbacks.
Date: Wed, 7 Oct 2015 12:23:48 +0100
Message-ID: <20151007112346.GC4810@vkoul-mobl.iind.intel.com>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-7-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441980871-24475-7-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, lee.jones@linaro.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 11, 2015 at 03:14:28PM +0100, Peter Griffin wrote:
> +#define ST_FDMA_PM	(&st_fdma_pm)
> +#else
> +#define ST_FDMA_PM	NULL
> +#endif
Pls use PM helpers you dont need to do this

-- 
~Vinod
