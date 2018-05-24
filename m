From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 0/7] Add support for QCA8334 switch
Date: Thu, 24 May 2018 15:17:38 +0200
Message-ID: <20180524131738.GD24557@lunn.ch>
References: <1527056424-14528-1-git-send-email-michal.vokac@ysoft.com>
 <29ea7cdd-5690-e39a-a2ef-4f48fbcb7659@gmail.com>
 <f8bf325c-77a5-d44b-34c3-93ea4b11fd84@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f8bf325c-77a5-d44b-34c3-93ea4b11fd84@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal =?utf-8?B?Vm9rw6HEjQ==?= <vokac.m@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vivien.didelot@savoirfairelinux.com, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net, michal.vokac@ysoft.com
List-Id: devicetree@vger.kernel.org

> Thank you too Florian. And also big thank to you Andrew. You helped me
> a lot to debug the RGMII issue. I have been stuck at that for more than
> a month and would not resolve it without your help.

We are here to help. I also got stuck figuring out RGMII issues, so i
know what it feels like...
 
> As I have done this in a process of upgrading our BSP to a more recent
> kernel, and hopefully mainline, I now need to move on to other parts of
> the board.

Do you think you can mainline the board? It would be nice to have an
in kernel board using this switch. If you post the device tree
patches, please Cc: me.

	 Andrew
