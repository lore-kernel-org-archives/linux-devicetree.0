From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] documentation: drivers/core/of: fix name of of_node symlink
Date: Fri, 20 May 2016 07:59:59 -0500
Message-ID: <CAL_Jsq+onAvTti_k_6CZHoyZKF_KQPCNyCHiWYMm=Hszmh2+Qw@mail.gmail.com>
References: <20160520122338.17701.38409.stgit@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160520122338.17701.38409.stgit@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Device Tree mailing list <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 20, 2016 at 7:23 AM, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org> wrote:
> commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> devices with an OF node") added a symlink called "of_node" to sysfs
> however the documentation describes it as "of_path".
>
> Fix the documentation to match what the code actually does.
>
> Signed-off-by: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/ABI/stable/sysfs-devices |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks like stable material to me.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
