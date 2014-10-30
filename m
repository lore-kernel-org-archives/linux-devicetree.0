From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] dtb: xgene: fix: Disable 10GbE and SGMII based 1GbE by default
Date: Thu, 30 Oct 2014 11:13:49 +0100
Message-ID: <1991367.DGHysZpQVP@wuerfel>
References: <1414630580-24640-1-git-send-email-isubramanian@apm.com> <1414630580-24640-2-git-send-email-isubramanian@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1414630580-24640-2-git-send-email-isubramanian@apm.com>
Sender: netdev-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Iyappan Subramanian <isubramanian@apm.com>, davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org, kchudgar@apm.com, patches@apm.com
List-Id: devicetree@vger.kernel.org

On Wednesday 29 October 2014 17:56:19 Iyappan Subramanian wrote:
> @@ -621,7 +621,7 @@
>                         };
>                 };
>  
> -               sgenet0: ethernet@1f210000 {
> +               sgenet0: sgenet@1f210000 {
>                         compatible = "apm,xgene-enet";
>                         status = "disabled";
>                         reg = <0x0 0x1f210000 0x0 0x10000>,
> 

This looks like you accidentally reverted a bug fix made earlier.
Network devices should always have the name 'ethernet@...'.

	Arnd
