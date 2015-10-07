From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2 5/9] dmaengine: st_fdma: Add xp70 firmware loading
 mechanism.
Date: Wed, 7 Oct 2015 12:22:02 +0100
Message-ID: <20151007112201.GB4810@vkoul-mobl.iind.intel.com>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
 <1441980871-24475-6-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441980871-24475-6-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, lee.jones@linaro.org, robh+dt@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 11, 2015 at 03:14:27PM +0100, Peter Griffin wrote:
> This patch adds the code to load the xp70 fdma firmware
> using the asynchronous request_firmware_nowait call
> so as not to delay bootup of builtin code.

Okay we need to check here. Can the driver be built in, if so this is not
the right usage. You should load the firmware on first open for this device

See https://lkml.org/lkml/2015/8/26/588

-- 
~Vinod
