From: Valentine <valentine.barshak@cogentembedded.com>
Subject: Re: [PATCH V3 1/2] sata_rcar: Add R-Car Gen2 SATA PHY support
Date: Sat, 30 Nov 2013 00:35:52 +0400
Message-ID: <5298FAA8.2050300@cogentembedded.com>
References: <1383912570-8393-1-git-send-email-valentine.barshak@cogentembedded.com> <1383912570-8393-2-git-send-email-valentine.barshak@cogentembedded.com> <52951B4D.3030205@cogentembedded.com> <20131129201406.GD21755@mtj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-ide-owner@vger.kernel.org>
In-Reply-To: <20131129201406.GD21755@mtj.dyndns.org>
Sender: linux-ide-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: linux-sh@vger.kernel.org, linux-ide@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Kumar Gala <galak@codeaurora.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On 11/30/2013 12:14 AM, Tejun Heo wrote:
> Hello,
>
> On Wed, Nov 27, 2013 at 02:06:05AM +0400, Valentine wrote:
>> On 11/08/2013 04:09 PM, Valentine Barshak wrote:
>>
>> Tejun,
>> are you OK with taking this?
>
> Yeah, the stat part looks okay to me.  How the two should be routed?
> Both through libata or should I just take the first one?

I'm not sure about that. I'm more concerned about the first one.
But I wouldn't mind if you take both.

>
> Thanks.
>

Thanks,
Val.
