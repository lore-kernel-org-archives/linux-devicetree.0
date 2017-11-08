From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v1] dmaengine: stm32_mdma: activate pack/unpack feature
Date: Wed, 8 Nov 2017 10:50:54 +0530
Message-ID: <20171108052054.GL3187@localhost>
References: <1508247827-31741-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1508247827-31741-1-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 17, 2017 at 03:43:47PM +0200, Pierre-Yves MORDRET wrote:
> If source and destination bus width differs pack/unpack MDMA
> feature has to be activated for alignment.
> This pack/unpack feature implies to have both source/destination address
> and buffer length aligned on bus width.

Applied, thanks

-- 
~Vinod
