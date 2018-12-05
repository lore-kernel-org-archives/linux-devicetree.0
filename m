Return-Path: <SRS0=QIJi=OO=gmail.com=edubezval@kernel.org>
Date: Tue, 4 Dec 2018 22:12:23 -0800
From: Eduardo Valentin <edubezval@gmail.com>
Subject: Re: [PATCH/RFT 0/2] thermal: add suport for R8A77990
Message-ID: <20181205061221.GA21626@localhost.localdomain>
References: <1539612719-9650-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539612719-9650-1-git-send-email-ykaneko0929@gmail.com>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello Yoshihiro,

On Mon, Oct 15, 2018 at 11:11:57PM +0900, Yoshihiro Kaneko wrote:
> This series adds thermal support for R-Car E3 (R8A77990).
> 
> This series is based on the next branch of Eduardo Valentin's linux-soc-thermal
> tree.

Sorry for the late response, but would you be able to refresh your
series to latest linus master branch?

> 
> Yoshihiro Kaneko (2):
>   dt-bindings: thermal: rcar-thermal: add R8A77990 support
>   thermal: rcar_thermal: add R8A77990 support
> 
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
>  drivers/thermal/rcar_thermal.c                             | 4 ++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> -- 
> 1.9.1
> 
