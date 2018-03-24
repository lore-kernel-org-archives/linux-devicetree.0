From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] of_net: Implement of_get_nvmem_mac_address helper
Date: Sat, 24 Mar 2018 17:03:29 +0100
Message-ID: <f8045062-bfb3-249f-482e-3e54524ce725@topic.nl>
References: <1521815074-30424-1-git-send-email-mike.looijmans@topic.nl>
 <20180323151101.GB24361@lunn.ch>
 <b68d4540-b15d-ec31-05a8-e1a4632bb5ee@topic.nl>
 <20180323194259.GP24361@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323194259.GP24361@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, robh+dt@kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 23-03-18 20:42, Andrew Lunn wrote:
>> Indeed. I'll add my settings as an example. Where should I put this
>> documentation, in the commit comment or somewhere in
>> Documents/devicetree/bindings?
> 
> Documention/devicetree/bindings/net/ethernet.txt

Ok

>> It's what I intended to do, but there were two problems with that:
>> - of_get_mac_address() returns a pointer to constant data in memory, but the
>> nvmem functions return an allocated memory object that must be freed after
>> use. This changes the way the call is to be made.
>> - The nvmem functions need the "struct device" pointer as well, while
>> of_get_mac_address() only gets passed the DT node.
> 
> Does of_nvmem_cell_get() help?

Yes, looking at the interface, it would.

-- 
Mike Looijmans
