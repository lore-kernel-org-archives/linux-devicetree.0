From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/6] Add ethernet support for Orange Pi 3
Date: Tue, 20 Aug 2019 13:56:18 -0700 (PDT)
Message-ID: <20190820.135618.1241308358677497033.davem@davemloft.net>
References: <20190820145343.29108-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190820145343.29108-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mripard@kernel.org, wens@csie.org, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org


It looks like there will be some updates to this series either involving
adding -supply to the property names or adjusting some of the kernel log
messages.

Seriously, I would prefer less verbiage in the logs rather than more.
