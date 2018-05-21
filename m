From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 5/7] net: dsa: qca8k: Allow overwriting CPU port
 setting
Date: Mon, 21 May 2018 08:20:16 -0700
Message-ID: <57c7ed4f-71ee-17bb-7ece-83af89652e77@gmail.com>
References: <1526909293-56377-1-git-send-email-michal.vokac@ysoft.com>
 <1526909293-56377-6-git-send-email-michal.vokac@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526909293-56377-6-git-send-email-michal.vokac@ysoft.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <vokac.m@gmail.com>, netdev@vger.kernel.org, michal.vokac@ysoft.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, vivien.didelot@savoirfairelinux.com, andrew@lunn.ch, mark.rutland@arm.com, robh+dt@kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org



On 05/21/2018 06:28 AM, Michal Vokáč wrote:
> Implement adjust_link function that allows to overwrite default CPU port
> setting using fixed-link device tree subnode.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
