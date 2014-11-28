From: Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
Date: Fri, 28 Nov 2014 08:01:41 +0100
Message-ID: <54781DD5.5030801@denx.de>
References: <1417097929-17832-1-git-send-email-sr@denx.de> <20141128014832.GA3113@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141128014832.GA3113-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huang Shijie <shijie8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28.11.2014 02:48, Huang Shijie wrote:
> On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
>> This sentence "We support only one NAND chip now" is not true any more.
>> Multiple chips are supported. So lets remove this sentence to not
>
> The gpmi can only supports one chip. Of course, there are maybe two dies
> in this single chip.

Now I'm a bit confused. The i.MX6 supports 4 chips select signals. And 
isn't "two dies in this single chip" not practically the same as 
connecting 2 (or more) chips (same device) to multiple chip selects of 
the SoC? Where is the difference here?

Thanks,
Stefan

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
