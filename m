From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH_V2] dm9000: Add regulator and reset support to dm9000
Date: Tue, 16 Dec 2014 15:25:33 -0500 (EST)
Message-ID: <20141216.152533.2094738642992885074.davem@davemloft.net>
References: <1418748391-9955-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1418748391-9955-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: netdev-owner@vger.kernel.org
To: Zubair.Kakakhel@imgtec.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, paul.burton@imgtec.com
List-Id: devicetree@vger.kernel.org

From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Date: Tue, 16 Dec 2014 16:46:31 +0000

> In boards, the dm9000 chip's power and reset can be controlled by gpio.
> 
> It makes sense to add them to the dm9000 driver and let dt be used to
> enable power and reset the phy.
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>

This looks like a new feature to me, and therefore only appropriate
for net-next, which is closed right now.

Please resubmit this when the net-next tree opens back up.
