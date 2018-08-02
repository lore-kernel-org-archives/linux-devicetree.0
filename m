From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v4 0/8] Add clock config and pm support to bcm iProc
 mdio mux
Date: Thu, 02 Aug 2018 14:39:26 -0700 (PDT)
Message-ID: <20180802.143926.1196419242536904239.davem@davemloft.net>
References: <1533171233-14557-1-git-send-email-arun.parameswaran@broadcom.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533171233-14557-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arun.parameswaran@broadcom.com
Cc: f.fainelli@gmail.com, andrew@lunn.ch, robh+dt@kernel.org, mark.rutland@arm.com, rjui@broadcom.com, sbranden@broadcom.com, catalin.marinas@arm.com, will.deacon@arm.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Date: Wed,  1 Aug 2018 17:53:45 -0700

> The patchset extends the Broadcom iProc mdio mux to add support for
> suspend/resume and the ability to configure the internal clock
> divider. The patchset also sets the scan control register to
> disable external master access.
 ...

Series applied to net-next, thank you.
