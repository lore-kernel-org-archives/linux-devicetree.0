From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII
 mode type
Date: Sat, 07 Sep 2019 17:24:47 +0200 (CEST)
Message-ID: <20190907.172447.791462197681205913.davem@davemloft.net>
References: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
        <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: vitaly.gaiduk@cloudbear.ru
Cc: robh+dt@kernel.org, f.fainelli@gmail.com, mark.rutland@arm.com, tpiepho@impinj.com, andrew@lunn.ch, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Vitaly Gaiduk <vitaly.gaiduk@cloudbear.ru>
Date: Thu,  5 Sep 2019 19:26:00 +0300

> +	- ti,sgmii-type - This denotes the fact which SGMII mode is used (4 or 6-wire).

You need to document this more sufficiently as per Andrew's feedback.
