From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/2] of_mdio: use IS_ERR_OR_NULL()
Date: Fri, 11 Mar 2016 14:48:49 -0800
Message-ID: <56E34B51.5050805@gmail.com>
References: <4882738.uyje2ICxKW@wasted.cogentembedded.com>
 <3305414.rAFdOb57tB@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <3305414.rAFdOb57tB@wasted.cogentembedded.com>
Sender: netdev-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org

On 11/03/16 14:12, Sergei Shtylyov wrote:
> IS_ERR_OR_NULL() is open coded in of_mdiobus_register_{phy|device}(), so
> just call it directly...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
