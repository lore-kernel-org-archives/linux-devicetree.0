From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] checkpatch: add DT compatible string documentation check
Date: Tue, 26 Nov 2013 09:29:00 -0800
Message-ID: <1385486940.20100.60.camel@joe-AO722>
References: <1385481675-26675-1-git-send-email-robherring2@gmail.com>
	 <1385484225.20100.58.camel@joe-AO722>
	 <CAL_JsqKgUQZT4g3fgPe-h8G-zWb1gnfxgT20BDrL+zS5u4URzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKgUQZT4g3fgPe-h8G-zWb1gnfxgT20BDrL+zS5u4URzg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Whitcroft <apw-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2013-11-26 at 11:11 -0600, Rob Herring wrote:
> I think we don't really want '+' (or '_') in compatible strings.

What about lines like:
arch/powerpc/boot/dts/kmeter1.dts:  compatible = "ucc_geth";


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
