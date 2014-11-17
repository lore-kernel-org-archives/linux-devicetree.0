From: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 1/2] efuse: IMG Pistachio eFuse Controller
Date: Mon, 17 Nov 2014 17:02:13 -0300
Message-ID: <546A5445.3020905@imgtec.com>
References: <1416237576-21542-1-git-send-email-arul.ramasamy@imgtec.com> <1416237576-21542-2-git-send-email-arul.ramasamy@imgtec.com> <546A189B.3090202@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <546A189B.3090202-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naidu.tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, jude.abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi James,

On 11/17/2014 12:47 PM, James Hogan wrote:
> Hi,
> 
> Some comments below.
> 
> Should this driver live in drivers/misc/fuse?
> 

You might want to take a look at the discussion around Tegra's eFuse
driver, which was originally proposed for drivers/misc and then got
merged in drivers/soc.

I'm curious about who should merge this driver. The Tegra one got merged
through ARM SoC. Maybe this time gregkh can take it directly, given
there's no maintainer for this.

-- 
Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
