From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2] mtd: part: add generic parsing of linux,part-probe
Date: Thu, 13 Aug 2015 22:09:36 +0200
Message-ID: <55CCF980.7080703@hauke-m.de>
References: <1432492714-12598-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432492714-12598-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/24/2015 08:38 PM, Hauke Mehrtens wrote:
> This moves the linux,part-probe device tree parsing code from
> physmap_of.c to mtdpart.c. Now all drivers can use this feature by just
> providing a reference to their device tree node in struct
> mtd_part_parser_data.
> 
> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
> ---
> 
> changes since
> v1:
>  * add documentation for linux,part-probe
>  * fix spacing
>  * add documentation for of_get_probes()
> 
>  Documentation/devicetree/bindings/mtd/nand.txt | 16 ++++++++++
>  drivers/mtd/maps/physmap_of.c                  | 40 +-----------------------
>  drivers/mtd/mtdpart.c                          | 43 ++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+), 39 deletions(-)
> 
I just want to bring this up again.

@Brian do you still have any problem with this patch? Should I use a
different approach and if so which? I think we agreed on that it is bad
when the flash chip driver decides which parser to use and it is not
possible to change it other that changing the code, but this is the
current situation with most drivers.

Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
