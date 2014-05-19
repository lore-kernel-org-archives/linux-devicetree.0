From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH net-next 4/4] Documentation: devicetree: net: refer to
 fixed-link.txt
Date: Mon, 19 May 2014 22:23:13 +0200
Message-ID: <20140519222313.5669579c@free-electrons.com>
References: <1400528625-32744-1-git-send-email-f.fainelli@gmail.com>
	<1400528625-32744-5-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1400528625-32744-5-git-send-email-f.fainelli@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dear Florian Fainelli,

On Mon, 19 May 2014 12:43:45 -0700, Florian Fainelli wrote:
> Update the Freescale TSEC PHY, Broadcom GENET & SYSTEMPORT Device Tree
> binding documentation to refer to the fixed-link Device Tree binding in
> fixed-link.txt.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/broadcom-bcmgenet.txt   | 2 +-
>  Documentation/devicetree/bindings/net/broadcom-systemport.txt | 2 +-
>  Documentation/devicetree/bindings/net/fsl-tsec-phy.txt        | 5 +----
>  3 files changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
