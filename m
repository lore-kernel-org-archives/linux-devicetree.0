From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2] of_net: Implement of_get_nvmem_mac_address helper
Date: Mon, 26 Mar 2018 20:41:59 +0200
Message-ID: <20180326184159.GA5862@lunn.ch>
References: <1521815074-30424-1-git-send-email-mike.looijmans@topic.nl>
 <20180323151101.GB24361@lunn.ch>
 <1522046489-19652-1-git-send-email-mike.looijmans@topic.nl>
 <20180326155010.GC3014@lunn.ch>
 <e151482e-7f67-c072-e946-95f6819c3bc2@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e151482e-7f67-c072-e946-95f6819c3bc2@topic.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

> fwnode_get_mac_address looks really new, there's only one user so far. Is it
> the intention that all drivers eventually migrate to that?

Hi Mike

Probably not. But any driver which needs to work with both ACPI and OF
is likely to use this API. So server class ARM64 chips for example.

   Andrew
