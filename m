From: "Imre Kaloz" <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCHv2] mvebu: add Linksys WRT1900AC (Mamba) support
Date: Tue, 27 Jan 2015 15:13:50 +0100
Message-ID: <op.xs4khcpz2s3iss@ecaz>
References: <1421687701-5667-1-git-send-email-kaloz@openwrt.org>
 <20150126184436.GE5015@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150126184436.GE5015-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On Mon, 26 Jan 2015 19:44:36 +0100, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

>> +	model = "Linksys WRT1900AC (Mamba)";
>> +	compatible = "linksys,mamba", "marvell,armadaxp-mv78230",
>> +		     "marvell,armadaxp", "marvell,armada-370-xp";
>
> Hi Imre
>
> So the consensus seems to be
>
>  model = "Linksys WRT1900AC";
>  compatible = "linksys,mamba", "...";
>
> with leds using mamba.

Okie.

> Please name the file armada-xp-linksys-mamba.dts.

Will do, thanks everyone for the help.


Imre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
