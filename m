From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [PATCH v2] Removes OF_SELFTEST dependency on OF_DYNAMIC config symbol
Date: Mon, 15 Sep 2014 12:34:45 +0300
Message-ID: <9D65D8A3-6404-451B-A3F4-E9ED94810B7B@antoniou-consulting.com>
References: <1410611708-9369-1-git-send-email-gaurav.minocha.os@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410611708-9369-1-git-send-email-gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gaurav,


On Sep 13, 2014, at 3:35 PM, Gaurav Minocha wrote:

> This patch is used to remove the selftests dependency on
> OF_DYNAMIC config flag. Now, it selectively builds only
> the functions required by the selftests.
> 
> Tested with and without OF_DYNAMIC enabled.
> 
> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

[snip]

I'm not happy with this patch.

It duplicates core functionality already present in drivers/of/dynamic.c and those
two implementations are for sure going to get out of sync.

If you require the self-tests to work without OF_DYNAMIC you can do that by including the
tests in your dts. If you want to insert them dynamically then use OF_DYNAMIC.

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
