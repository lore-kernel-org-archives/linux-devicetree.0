From: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 1/2] net: ti cpsw ethernet: allow reading phy interface
 mode from DT
Date: Mon, 01 Oct 2012 23:15:38 +0200
Message-ID: <506A07FA.5000800@gmail.com>
References: <1348680268-8194-1-git-send-email-zonque@gmail.com> <20121001.171114.1093867649404020043.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20121001.171114.1093867649404020043.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, mugunthanvnm@ti.com, hvaibhav@ti.com
List-Id: devicetree@vger.kernel.org

On 01.10.2012 23:11, David Miller wrote:
> From: Daniel Mack <zonque@gmail.com>
> Date: Wed, 26 Sep 2012 19:24:27 +0200
> 
>> Allow users to specify the phy interface of the CPSW slaves. The new
>> node parameter is called "phy_if_mode" and is optional. The original
>> behaviour of the driver is preserved when not given.
>>
>> Signed-off-by: Daniel Mack <zonque@gmail.com>
> 
> Applied, thanks.
> 

Eh, no - sorry. My original understanding was that a bit in the cpsw
registers has to be set only when a certain physical phy mode is in use.
Hence we would have needed a way to pass that information in via DT. But
as Mugunthan pointed out, that bit must always be set, and the cpsw
slaves can stay agnostic to the actual phy mode.

So that patch isn't needed. Sorry for the confusion.


Daniel
