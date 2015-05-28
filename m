From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH v4 2/3] Documentation: dt: add the CSR atlas7 hwspinlock
 bindings document
Date: Thu, 28 May 2015 14:02:11 -0700
Message-ID: <CAJAp7OhVVoY82vDHdvRJm=xTssZ3e7xCmUkjh2vRenyXH6gNkQ@mail.gmail.com>
References: <1432628911-18555-1-git-send-email-21cnbao@gmail.com>
	<1432628911-18555-2-git-send-email-21cnbao@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432628911-18555-2-git-send-email-21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, workgroup.linux-kQvG35nSl+M@public.gmane.org, Wei Chen <wei.chen-kQvG35nSl+M@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, Barry Song <Baohua.Song-kQvG35nSl+M@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 26, 2015 at 1:28 AM, Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
[..]
> diff --git a/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/sirf,hwspinlock.txt
[..]
> +- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
> +       hwlock, so the number of cells should be <1> here.
> +

Jfyi, you could have gotten away with:

#hwlock-cells: must be 1

> +Please look at the generic hwlock binding for usage information for consumers,
> +"Documentation/devicetree/bindings/hwlock/hwlock.txt"

Reviewed-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
