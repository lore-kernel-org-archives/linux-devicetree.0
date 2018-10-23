From: David Miller <davem@davemloft.net>
Subject: Re: [PATCHv2 2/2] net: stmmac: Set OWN bit for jumbo frames
Date: Mon, 22 Oct 2018 20:23:33 -0700 (PDT)
Message-ID: <20181022.202333.713125643948482516.davem@davemloft.net>
References: <1540246946-12784-1-git-send-email-thor.thayer@linux.intel.com>
        <1540246946-12784-2-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540246946-12784-2-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: thor.thayer@linux.intel.com
Date: Mon, 22 Oct 2018 17:22:26 -0500

> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Ping with Jumbo packet does not reply and get a watchdog timeout
 ...
> Inspection of queue showed Jumbo packets were not sent out.
> The ring Jumbo packet function needs to set the OWN bit so
> the packet is sent.
> 
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---
> v2  Add fix for jumbo frames > 8K (same OWN bit)

Applied.
