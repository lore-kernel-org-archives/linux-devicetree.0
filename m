From: "Imre Kaloz" <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCHv2] ARM: mvebu: add support for the new Aramda 385 based
 Linksys boards
Date: Mon, 25 May 2015 15:02:27 +0200
Message-ID: <op.xy6zudje2s3iss@ecaz>
References: <1432156456-440-1-git-send-email-kaloz@openwrt.org>
 <55631C6E.8050700@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55631C6E.8050700-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gregory,

On Mon, 25 May 2015 14:58:22 +0200, Gregory CLEMENT  
<gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

<snip>

> it seems that you missed my comment about removing bootargs and just  
> using
> stdout-path = "serial0:115200n8";
>
> If you agree and if there is no remark about the DSA part from Andrew, I  
> can
> take car of it while applying your patch on mvebu/dt.

Sorry, I indeed did miss it. I agree with that change. Andrew?


Thanks,

Imre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
