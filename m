From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] of_net: Implement of_get_nvmem_mac_address helper
Date: Sun, 25 Mar 2018 10:17:26 +0200
Message-ID: <d2dfee96-cd30-fa16-6c83-b55773e3aa91@topic.nl>
References: <1521815074-30424-1-git-send-email-mike.looijmans@topic.nl>
 <20180323151101.GB24361@lunn.ch>
 <b68d4540-b15d-ec31-05a8-e1a4632bb5ee@topic.nl>
 <886c94ef-e2c8-2afa-307d-1924c74c6dc0@gmail.com>
 <cb12ea29-a7b0-cf66-7f5a-c09d36f443f0@topic.nl>
 <20180324185324.GG31941@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180324185324.GG31941@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 24-03-18 19:53, Andrew Lunn wrote:
>> A quick survey for the of_get_mac_address users learns that most of them do
>> a memcpy (or similar) right after it, so for these drivers the
>> "of_get_nvmem_mac_address" style signature that performs the memcpy (or
>> better, ether_addr_copy) is a better fit, e.g.:
>>
>> int of_get_mac_address(struct device_node *np, void *addr)
> 
> Hi Mike
> 
> This is a nicer solution, but it is quite a lot of work, there are a
> lot of users. Maybe Coccinelle can help?

About 58 of them, yeah. And this looked like such a simple thing when I 
started it...
https://elixir.bootlin.com/linux/v4.16-rc6/ident/of_get_mac_address
I have no experience with Coccinelle though.



-- 
Mike Looijmans
