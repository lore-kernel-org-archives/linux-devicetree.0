From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [PATCH v6 0/3] netdev/of/phy: MDIO bus multiplexer support.
Date: Fri, 18 May 2012 21:42:34 +0000
Message-ID: <CAOZdJXWVCu+aNxcQRkcSSDsWWxnn8B9X5Y6=8oVgFwJ9SZTTGQ@mail.gmail.com>
References: <1336007799-31016-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1336007799-31016-1-git-send-email-ddaney.cavm@gmail.com>
Content-Language: en-US
Content-ID: <426B810870A0D0478A3EFD67A7394FD3@mgd.freescale.com>
Sender: netdev-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 2, 2012 at 8:16 PM, David Daney <ddaney.cavm@gmail.com> wrote:
> From: David Daney <david.daney@cavium.com>
>
> This code has been working well for about six months on a couple of
> different configurations (boards), so I thought it would be a good
> time to send it out again, and I hope get it on the path towards
> merging.

David,

I'm trying to implement this feature on our boards, which don't use
GPIOs but rather a memory-mapped FPGA.  I control the mux by setting
some bits in one of the FPGA registers.

Do you have a real device tree I can use as an example?

I'm not sure what the "parent" MDIO bus node is supposed to represent.
 Is that that device that actually controls the muxing hardware, which
in our case would be the FPGA?

-- 
Timur Tabi
Linux kernel developer at Freescale
