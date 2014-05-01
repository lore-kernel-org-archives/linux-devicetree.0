From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 2/3] of: mtd: add NAND randomizer mode retrieval
Date: Thu, 01 May 2014 19:18:44 +0200
Message-ID: <536281F4.1000402@gmail.com>
References: <1398906592-24677-1-git-send-email-b.brezillon.dev@gmail.com>	<1398906592-24677-3-git-send-email-b.brezillon.dev@gmail.com> <20140501131605.9CB7CC409DA@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140501131605.9CB7CC409DA-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 01/05/2014 15:16, Grant Likely wrote:
> On Thu,  1 May 2014 03:09:51 +0200, Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Signed-off-by: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
> No commit message? Immediate NAK. Please, make sure you write a
> description for each and every patch. This is not optional. Future
> readers want to know what this patch solves and any other information
> you can provide without having to read the diff.

My bad. I just sent a commit I forgot to rework to add a proper commit
message.
I'll add a commit message describing the different options for the
"nand-rnd-mode" property and update the nand DT bindings documentation.

Best Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
