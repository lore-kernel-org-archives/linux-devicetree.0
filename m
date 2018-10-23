From: David Miller <davem@davemloft.net>
Subject: Re: [PATCHv2 1/2] arm64: dts: stratix10: Support Ethernet Jumbo
 frame
Date: Mon, 22 Oct 2018 20:23:19 -0700 (PDT)
Message-ID: <20181022.202319.760925281706914812.davem@davemloft.net>
References: <1540246946-12784-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540246946-12784-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: thor.thayer@linux.intel.com
Date: Mon, 22 Oct 2018 17:22:25 -0500

> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Properly specify the RX and TX FIFO size which is important
> for Jumbo frames.
> Update the max-frame-size to support Jumbo frames.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
> v2 Shorten title. No change to DTS.

Applied.
